import sqlite3
from datetime import datetime

DB_NAME = "airline.db"


def get_connection():
    """Connect to the SQLite database and enable foreign keys."""
    conn = sqlite3.connect(DB_NAME)
    conn.execute("PRAGMA foreign_keys = ON")
    return conn


def print_results(rows, headings):
    """Print query results in a readable table format."""
    if not rows:
        print("\nNo records found.")
        return

    print("\n" + " | ".join(headings))
    print("-" * 120)

    for row in rows:
        print(" | ".join(str(value) for value in row))


def view_flights():
    """Retrieve flights by destination, status, departure date, or show all."""
    print("\nView Flights")
    print("1. View all flights")
    print("2. Search by destination city")
    print("3. Search by flight status")
    print("4. Search by departure date")

    choice = input("Enter choice: ").strip()

    sql = """
        SELECT
            f.flight_id,
            f.flight_number,
            d.city,
            d.country,
            f.departure_datetime,
            f.arrival_datetime,
            f.gate,
            f.status,
            a.registration_number
        FROM flights f
        INNER JOIN destinations d
            ON f.destination_id = d.destination_id
        LEFT JOIN aircraft_assignments aa
            ON f.flight_id = aa.flight_id
        LEFT JOIN aircraft a
            ON aa.aircraft_id = a.aircraft_id
    """

    values = []

    if choice == "2":
        city = input("Enter destination city: ").strip()
        sql += " WHERE LOWER(d.city) = LOWER(?)"
        values.append(city)

    elif choice == "3":
        status = input("Enter flight status: ").strip()
        sql += " WHERE LOWER(f.status) = LOWER(?)"
        values.append(status)

    elif choice == "4":
        departure_date = input("Enter departure date, e.g. 2026-06-10: ").strip()
        sql += " WHERE DATE(f.departure_datetime) = DATE(?)"
        values.append(departure_date)

    elif choice != "1":
        print("\nInvalid choice.")
        return

    sql += " ORDER BY f.departure_datetime"

    conn = get_connection()
    cur = conn.cursor()
    cur.execute(sql, values)
    rows = cur.fetchall()
    conn.close()

    headings = [
        "Flight ID",
        "Flight Number",
        "City",
        "Country",
        "Departure",
        "Arrival",
        "Gate",
        "Status",
        "Aircraft"
    ]

    print_results(rows, headings)


def add_new_flight():
    """Add a new flight record."""
    print("\nAdd a New Flight")

    flight_id = input("Enter flight ID, e.g. FLT-SBA-JFK-0201: ").strip().upper()
    flight_number = input("Enter flight number, e.g. SBA-JFK-0201: ").strip().upper()
    destination_id = input("Enter destination ID, e.g. DST-JFK-1001: ").strip().upper()
    departure_datetime = input("Enter departure datetime, e.g. 2026-06-20 08:00: ").strip()
    arrival_datetime = input("Enter arrival datetime, e.g. 2026-06-20 11:00: ").strip()
    gate = input("Enter gate: ").strip().upper()
    status = input("Enter status: ").strip().title()

    conn = get_connection()
    cur = conn.cursor()

    try:
        cur.execute("""
            INSERT INTO flights (
                flight_id,
                flight_number,
                destination_id,
                departure_datetime,
                arrival_datetime,
                gate,
                status
            )
            VALUES (?, ?, ?, ?, ?, ?, ?)
        """, (
            flight_id,
            flight_number,
            destination_id,
            departure_datetime,
            arrival_datetime,
            gate,
            status
        ))

        conn.commit()
        print("\nFlight added successfully.")

    except sqlite3.IntegrityError as error:
        print("\nCould not add flight:", error)

    conn.close()


def update_flight():
    """Update a flight schedule or status."""
    print("\nUpdate Flight Information")

    flight_id = input("Enter flight ID: ").strip().upper()

    print("\nWhat do you want to update?")
    print("1. Departure datetime")
    print("2. Arrival datetime")
    print("3. Gate")
    print("4. Status")

    choice = input("Enter choice: ").strip()

    columns = {
        "1": "departure_datetime",
        "2": "arrival_datetime",
        "3": "gate",
        "4": "status"
    }

    if choice not in columns:
        print("\nInvalid choice.")
        return

    new_value = input("Enter new value: ").strip()
    column = columns[choice]

    conn = get_connection()
    cur = conn.cursor()

    cur.execute(f"""
        UPDATE flights
        SET {column} = ?
        WHERE flight_id = ?
    """, (new_value, flight_id))

    conn.commit()

    if cur.rowcount > 0:
        print("\nFlight updated successfully.")
    else:
        print("\nNo flight found with that ID.")

    conn.close()


def delete_flight():
    """Delete a flight record."""
    print("\nDelete Flight")

    flight_id = input("Enter flight ID: ").strip().upper()

    conn = get_connection()
    cur = conn.cursor()

    cur.execute("""
        DELETE FROM flights
        WHERE flight_id = ?
    """, (flight_id,))

    conn.commit()

    if cur.rowcount > 0:
        print("\nFlight deleted successfully.")
    else:
        print("\nNo flight found with that ID.")

    conn.close()


def assign_pilot():
    """Assign a pilot to a flight."""
    print("\nAssign Pilot to Flight")

    flight_id = input("Enter flight ID: ").strip().upper()
    pilot_id = int(input("Enter pilot ID: "))
    pilot_role = input("Enter pilot role, e.g. Captain or First Officer: ").strip().title()
    assigned_at = datetime.now().strftime("%Y-%m-%d %H:%M")

    conn = get_connection()
    cur = conn.cursor()

    try:
        cur.execute("""
            INSERT INTO pilot_assignments (
                flight_id,
                pilot_id,
                pilot_role,
                assigned_at
            )
            VALUES (?, ?, ?, ?)
        """, (flight_id, pilot_id, pilot_role, assigned_at))

        conn.commit()
        print("\nPilot assigned successfully.")

    except sqlite3.IntegrityError as error:
        print("\nCould not assign pilot:", error)

    conn.close()


def view_pilot_schedule():
    """Show all flights assigned to one pilot."""
    print("\nView Pilot Schedule")

    pilot_id = int(input("Enter pilot ID: "))

    conn = get_connection()
    cur = conn.cursor()

    cur.execute("""
        SELECT
            p.pilot_id,
            p.first_name || ' ' || p.last_name,
            p.rank,
            f.flight_number,
            d.city,
            f.departure_datetime,
            f.arrival_datetime,
            pa.pilot_role,
            f.status
        FROM pilot_assignments pa
        INNER JOIN pilots p
            ON pa.pilot_id = p.pilot_id
        INNER JOIN flights f
            ON pa.flight_id = f.flight_id
        INNER JOIN destinations d
            ON f.destination_id = d.destination_id
        WHERE p.pilot_id = ?
        ORDER BY f.departure_datetime
    """, (pilot_id,))

    rows = cur.fetchall()
    conn.close()

    headings = [
        "Pilot ID",
        "Pilot Name",
        "Rank",
        "Flight Number",
        "Destination",
        "Departure",
        "Arrival",
        "Role",
        "Status"
    ]

    print_results(rows, headings)


def view_destinations():
    """View destination information."""
    conn = get_connection()
    cur = conn.cursor()

    cur.execute("""
        SELECT
            destination_id,
            airport_code,
            airport_name,
            city,
            country,
            timezone
        FROM destinations
        ORDER BY airport_code
    """)

    rows = cur.fetchall()
    conn.close()

    headings = [
        "Destination ID",
        "Airport Code",
        "Airport Name",
        "City",
        "Country",
        "Timezone"
    ]

    print_results(rows, headings)


def update_destination():
    """Update destination information."""
    print("\nUpdate Destination Information")

    destination_id = input("Enter destination ID: ").strip().upper()

    print("\nWhat do you want to update?")
    print("1. Airport code")
    print("2. Airport name")
    print("3. City")
    print("4. Country")
    print("5. Timezone")

    choice = input("Enter choice: ").strip()

    columns = {
        "1": "airport_code",
        "2": "airport_name",
        "3": "city",
        "4": "country",
        "5": "timezone"
    }

    if choice not in columns:
        print("\nInvalid choice.")
        return

    new_value = input("Enter new value: ").strip()
    column = columns[choice]

    conn = get_connection()
    cur = conn.cursor()

    try:
        cur.execute(f"""
            UPDATE destinations
            SET {column} = ?
            WHERE destination_id = ?
        """, (new_value, destination_id))

        conn.commit()

        if cur.rowcount > 0:
            print("\nDestination updated successfully.")
        else:
            print("\nNo destination found with that ID.")

    except sqlite3.IntegrityError as error:
        print("\nCould not update destination:", error)

    conn.close()


def summary_reports():
    """Run summary queries using GROUP BY."""
    print("\nSummary Reports")
    print("1. Number of flights to each destination")
    print("2. Number of flights assigned to each pilot")
    print("3. Number of flights by status")

    choice = input("Enter choice: ").strip()

    conn = get_connection()
    cur = conn.cursor()

    if choice == "1":
        cur.execute("""
            SELECT
                d.airport_code,
                d.city,
                COUNT(f.flight_id)
            FROM destinations d
            LEFT JOIN flights f
                ON d.destination_id = f.destination_id
            GROUP BY d.airport_code, d.city
            ORDER BY COUNT(f.flight_id) DESC
        """)

        headings = ["Airport Code", "City", "Number of Flights"]

    elif choice == "2":
        cur.execute("""
            SELECT
                p.pilot_id,
                p.first_name
                \ || ' ' || p.last_name,
                COUNT(pa.assignment_id)
            FROM pilots p
            LEFT JOIN pilot_assignments pa
                ON p.pilot_id = pa.pilot_id
            GROUP BY p.pilot_id, p.first_name, p.last_name
            ORDER BY COUNT(pa.assignment_id) DESC
        """)

        headings = ["Pilot ID", "Pilot Name", "Assigned Flights"]

    elif choice == "3":
        cur.execute("""
            SELECT
                status,
                COUNT(*)
            FROM flights
            GROUP BY status
            ORDER BY COUNT(*) DESC
        """)

        headings = ["Status", "Number of Flights"]

    else:
        print("\nInvalid choice.")
        conn.close()
        return

    rows = cur.fetchall()
    conn.close()

    print_results(rows, headings)


def main_menu():
    """Main program menu."""
    while True:
        print("\nFlight Management System")
        print("************************")
        print("1. Add a New Flight")
        print("2. View Flights")
        print("3. Update Flight Information")
        print("4. Delete Flight")
        print("5. Assign Pilot to Flight")
        print("6. View Pilot Schedule")
        print("7. View Destination Information")
        print("8. Update Destination Information")
        print("9. View Summary Reports")
        print("10. Exit")

        choice = input("\nEnter your choice: ").strip()

        if choice == "1":
            add_new_flight()
        elif choice == "2":
            view_flights()
        elif choice == "3":
            update_flight()
        elif choice == "4":
            delete_flight()
        elif choice == "5":
            assign_pilot()
        elif choice == "6":
            view_pilot_schedule()
        elif choice == "7":
            view_destinations()
        elif choice == "8":
            update_destination()
        elif choice == "9":
            summary_reports()
        elif choice == "10":
            print("\nGoodbye.")
            break
        else:
            print("\nInvalid choice. Please try again.")


if __name__ == "__main__":
    main_menu()
DROP TABLE IF EXISTS pilot_assignments;
DROP TABLE IF EXISTS flights;
DROP TABLE IF EXISTS pilots;
DROP TABLE IF EXISTS destinations;

CREATE TABLE destinations (
    destination_id INTEGER PRIMARY KEY,
    airport_code TEXT NOT NULL UNIQUE,
    airport_name TEXT NOT NULL,
    city TEXT NOT NULL,
    country TEXT NOT NULL,
    timezone TEXT NOT NULL
);

CREATE TABLE pilots (
    pilot_id INTEGER PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    licence_number TEXT NOT NULL UNIQUE,
    rank TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    phone_number TEXT,
    status TEXT NOT NULL DEFAULT 'Active'
);

CREATE TABLE flights (
    flight_id INTEGER PRIMARY KEY,
    flight_number TEXT NOT NULL UNIQUE,
    destination_id INTEGER NOT NULL,
    departure_datetime TEXT NOT NULL,
    arrival_datetime TEXT NOT NULL,
    gate TEXT,
    status TEXT NOT NULL DEFAULT 'Scheduled',
    FOREIGN KEY (destination_id)
        REFERENCES destinations(destination_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE pilot_assignments (
    assignment_id INTEGER PRIMARY KEY,
    flight_id INTEGER NOT NULL,
    pilot_id INTEGER NOT NULL,
    pilot_role TEXT NOT NULL,
    assigned_at TEXT NOT NULL,
    FOREIGN KEY (flight_id)
        REFERENCES flights(flight_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (pilot_id)
        REFERENCES pilots(pilot_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    UNIQUE (flight_id, pilot_id, pilot_role)
);
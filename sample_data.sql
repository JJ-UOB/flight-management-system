INSERT INTO destinations (
    destination_id,
    airport_code,
    airport_name,
    city,
    country,
    timezone
) VALUES
('DST-JFK-1001', 'JFK', 'John F. Kennedy International Airport', 'New York', 'United States', 'America/New_York'),
('DST-LAX-1002', 'LAX', 'Los Angeles International Airport', 'Los Angeles', 'United States', 'America/Los_Angeles'),
('DST-DXB-1003', 'DXB', 'Dubai International Airport', 'Dubai', 'United Arab Emirates', 'Asia/Dubai'),
('DST-CDG-1004', 'CDG', 'Charles de Gaulle Airport', 'Paris', 'France', 'Europe/Paris'),
('DST-AMS-1005', 'AMS', 'Amsterdam Schiphol Airport', 'Amsterdam', 'Netherlands', 'Europe/Amsterdam'),
('DST-FCO-1006', 'FCO', 'Leonardo da Vinci International Airport', 'Rome', 'Italy', 'Europe/Rome'),
('DST-MAD-1007', 'MAD', 'Adolfo Suarez Madrid-Barajas Airport', 'Madrid', 'Spain', 'Europe/Madrid'),
('DST-LHR-1008', 'LHR', 'Heathrow Airport', 'London', 'United Kingdom', 'Europe/London'),
('DST-SIN-1009', 'SIN', 'Singapore Changi Airport', 'Singapore', 'Singapore', 'Asia/Singapore'),
('DST-NRT-1010', 'NRT', 'Narita International Airport', 'Tokyo', 'Japan', 'Asia/Tokyo'),
('DST-ATL-1011', 'ATL', 'Hartsfield-Jackson Atlanta International Airport', 'Atlanta', 'United States', 'America/New_York'),
('DST-ORD-1012', 'ORD', 'O Hare International Airport', 'Chicago', 'United States', 'America/Chicago'),
('DST-DFW-1013', 'DFW', 'Dallas Fort Worth International Airport', 'Dallas', 'United States', 'America/Chicago'),
('DST-DEN-1014', 'DEN', 'Denver International Airport', 'Denver', 'United States', 'America/Denver'),
('DST-SFO-1015', 'SFO', 'San Francisco International Airport', 'San Francisco', 'United States', 'America/Los_Angeles');

INSERT INTO pilots (
    pilot_id,
    first_name,
    last_name,
    licence_number,
    rank,
    email,
    phone_number,
    status
) VALUES
(2001, 'James', 'Walker', 'UK-CAA-ATPL-JW-100214', 'Captain', 'james.walker@skybridgeairways.co.uk', '+44 7700 900101', 'Active'),
(2002, 'Amelia', 'Brown', 'UK-CAA-CPL-AB-100328', 'First Officer', 'amelia.brown@skybridgeairways.co.uk', '+44 7700 900102', 'Active'),
(2003, 'Daniel', 'Smith', 'UK-CAA-ATPL-DS-100472', 'Captain', 'daniel.smith@skybridgeairways.co.uk', '+44 7700 900103', 'Active'),
(2004, 'Sophie', 'Taylor', 'UK-CAA-CPL-ST-100591', 'First Officer', 'sophie.taylor@skybridgeairways.co.uk', '+44 7700 900104', 'Active'),
(2005, 'Michael', 'Johnson', 'UK-CAA-ATPL-MJ-100638', 'Captain', 'michael.johnson@skybridgeairways.co.uk', '+44 7700 900105', 'Active'),
(2006, 'Grace', 'Evans', 'UK-CAA-CPL-GE-100774', 'First Officer', 'grace.evans@skybridgeairways.co.uk', '+44 7700 900106', 'Active'),
(2007, 'Oliver', 'Wilson', 'UK-CAA-ATPL-OW-100819', 'Captain', 'oliver.wilson@skybridgeairways.co.uk', '+44 7700 900107', 'Inactive'),
(2008, 'Emily', 'Davis', 'UK-CAA-CPL-ED-100926', 'First Officer', 'emily.davis@skybridgeairways.co.uk', '+44 7700 900108', 'Active'),
(2009, 'Noah', 'Roberts', 'UK-CAA-ATPL-NR-101037', 'Captain', 'noah.roberts@skybridgeairways.co.uk', '+44 7700 900109', 'Active'),
(2010, 'Ava', 'Thomas', 'UK-CAA-CPL-AT-101144', 'First Officer', 'ava.thomas@skybridgeairways.co.uk', '+44 7700 900110', 'Active'),
(2011, 'Ethan', 'Harris', 'UK-CAA-ATPL-EH-101258', 'Captain', 'ethan.harris@skybridgeairways.co.uk', '+44 7700 900111', 'Active'),
(2012, 'Isabella', 'Clark', 'UK-CAA-CPL-IC-101362', 'First Officer', 'isabella.clark@skybridgeairways.co.uk', '+44 7700 900112', 'Active'),
(2013, 'Lucas', 'Lewis', 'UK-CAA-ATPL-LL-101479', 'Captain', 'lucas.lewis@skybridgeairways.co.uk', '+44 7700 900113', 'Active'),
(2014, 'Mia', 'Young', 'UK-CAA-CPL-MY-101583', 'First Officer', 'mia.young@skybridgeairways.co.uk', '+44 7700 900114', 'Active'),
(2015, 'Henry', 'Hall', 'UK-CAA-ATPL-HH-101690', 'Captain', 'henry.hall@skybridgeairways.co.uk', '+44 7700 900115', 'Active');

INSERT INTO aircraft (
    aircraft_id,
    registration_number,
    aircraft_model,
    manufacturer,
    seat_capacity,
    status
) VALUES
(3001, 'G-SBAA', 'Airbus A320-200', 'Airbus', 180, 'Active'),
(3002, 'G-SBAB', 'Airbus A321neo', 'Airbus', 220, 'Active'),
(3003, 'G-SBAC', 'Boeing 737-800', 'Boeing', 189, 'Active'),
(3004, 'G-SBAD', 'Boeing 787-9 Dreamliner', 'Boeing', 296, 'Active'),
(3005, 'G-SBAE', 'Airbus A350-900', 'Airbus', 325, 'Active'),
(3006, 'G-SBAF', 'Boeing 777-300ER', 'Boeing', 396, 'Active'),
(3007, 'G-SBAG', 'Airbus A330-300', 'Airbus', 277, 'Maintenance'),
(3008, 'G-SBAH', 'Embraer E190', 'Embraer', 100, 'Active'),
(3009, 'G-SBAI', 'Boeing 767-300ER', 'Boeing', 261, 'Active'),
(3010, 'G-SBAJ', 'Airbus A319-100', 'Airbus', 156, 'Active'),
(3011, 'G-SBAK', 'Boeing 737 MAX 8', 'Boeing', 178, 'Active'),
(3012, 'G-SBAL', 'Airbus A220-300', 'Airbus', 145, 'Active'),
(3013, 'G-SBAM', 'Boeing 787-10 Dreamliner', 'Boeing', 336, 'Active'),
(3014, 'G-SBAN', 'Airbus A340-600', 'Airbus', 380, 'Retired'),
(3015, 'G-SBAO', 'Boeing 747-400', 'Boeing', 416, 'Maintenance');

INSERT INTO flights (
    flight_id,
    flight_number,
    destination_id,
    departure_datetime,
    arrival_datetime,
    gate,
    status
) VALUES
('FLT-SBA-JFK-0101', 'SBA-JFK-0101', 'DST-JFK-1001', '2026-06-10 08:00', '2026-06-10 11:00', 'A12', 'Scheduled'),
('FLT-SBA-LAX-0102', 'SBA-LAX-0102', 'DST-LAX-1002', '2026-06-10 09:30', '2026-06-10 13:30', 'A18', 'Scheduled'),
('FLT-SBA-DXB-0103', 'SBA-DXB-0103', 'DST-DXB-1003', '2026-06-11 12:00', '2026-06-11 20:00', 'B07', 'Delayed'),
('FLT-SBA-CDG-0104', 'SBA-CDG-0104', 'DST-CDG-1004', '2026-06-11 14:00', '2026-06-11 16:20', 'B14', 'Scheduled'),
('FLT-SBA-AMS-0105', 'SBA-AMS-0105', 'DST-AMS-1005', '2026-06-12 07:45', '2026-06-12 09:05', 'C03', 'Cancelled'),
('FLT-SBA-FCO-0106', 'SBA-FCO-0106', 'DST-FCO-1006', '2026-06-12 10:15', '2026-06-12 12:45', 'C11', 'Scheduled'),
('FLT-SBA-MAD-0107', 'SBA-MAD-0107', 'DST-MAD-1007', '2026-06-13 15:00', '2026-06-13 17:30', 'D04', 'Scheduled'),
('FLT-SBA-LHR-0108', 'SBA-LHR-0108', 'DST-LHR-1008', '2026-06-13 18:00', '2026-06-13 19:00', 'D16', 'Boarding'),
('FLT-SBA-SIN-0109', 'SBA-SIN-0109', 'DST-SIN-1009', '2026-06-14 21:00', '2026-06-15 17:00', 'E09', 'Scheduled'),
('FLT-SBA-NRT-0110', 'SBA-NRT-0110', 'DST-NRT-1010', '2026-06-15 06:00', '2026-06-15 23:30', 'E21', 'Scheduled'),
('FLT-SBA-ATL-0111', 'SBA-ATL-0111', 'DST-ATL-1011', '2026-06-16 08:30', '2026-06-16 11:40', 'F02', 'Scheduled'),
('FLT-SBA-ORD-0112', 'SBA-ORD-0112', 'DST-ORD-1012', '2026-06-16 13:00', '2026-06-16 21:15', 'F15', 'Delayed'),
('FLT-SBA-DFW-0113', 'SBA-DFW-0113', 'DST-DFW-1013', '2026-06-17 07:00', '2026-06-17 11:30', 'G08', 'Scheduled'),
('FLT-SBA-DEN-0114', 'SBA-DEN-0114', 'DST-DEN-1014', '2026-06-17 08:15', '2026-06-17 12:45', 'G19', 'Scheduled'),
('FLT-SBA-SFO-0115', 'SBA-SFO-0115', 'DST-SFO-1015', '2026-06-18 09:00', '2026-06-18 13:10', 'H06', 'Delayed');

INSERT INTO pilot_assignments (
    assignment_id,
    flight_id,
    pilot_id,
    pilot_role,
    assigned_at
) VALUES
(5001, 'FLT-SBA-JFK-0101', 2001, 'Captain', '2026-06-01 09:00'),
(5002, 'FLT-SBA-JFK-0101', 2002, 'First Officer', '2026-06-01 09:05'),
(5003, 'FLT-SBA-LAX-0102', 2003, 'Captain', '2026-06-01 09:10'),
(5004, 'FLT-SBA-LAX-0102', 2004, 'First Officer', '2026-06-01 09:15'),
(5005, 'FLT-SBA-DXB-0103', 2005, 'Captain', '2026-06-02 10:00'),
(5006, 'FLT-SBA-DXB-0103', 2006, 'First Officer', '2026-06-02 10:05'),
(5007, 'FLT-SBA-CDG-0104', 2009, 'Captain', '2026-06-02 10:10'),
(5008, 'FLT-SBA-AMS-0105', 2008, 'First Officer', '2026-06-03 11:00'),
(5009, 'FLT-SBA-FCO-0106', 2001, 'Captain', '2026-06-03 11:05'),
(5010, 'FLT-SBA-MAD-0107', 2003, 'Captain', '2026-06-04 12:00'),
(5011, 'FLT-SBA-LHR-0108', 2010, 'First Officer', '2026-06-04 12:05'),
(5012, 'FLT-SBA-SIN-0109', 2005, 'Captain', '2026-06-05 13:00'),
(5013, 'FLT-SBA-DFW-0113', 2011, 'Captain', '2026-06-06 09:00'),
(5014, 'FLT-SBA-DEN-0114', 2012, 'First Officer', '2026-06-06 09:05'),
(5015, 'FLT-SBA-SFO-0115', 2013, 'Captain', '2026-06-06 09:10');

INSERT INTO aircraft_assignments (
    aircraft_assignment_id,
    flight_id,
    aircraft_id,
    assigned_at,
    assignment_status
) VALUES
(6001, 'FLT-SBA-JFK-0101', 3001, '2026-06-01 08:00', 'Assigned'),
(6002, 'FLT-SBA-LAX-0102', 3002, '2026-06-01 08:05', 'Assigned'),
(6003, 'FLT-SBA-DXB-0103', 3003, '2026-06-01 08:10', 'Assigned'),
(6004, 'FLT-SBA-CDG-0104', 3004, '2026-06-01 08:15', 'Assigned'),
(6005, 'FLT-SBA-AMS-0105', 3005, '2026-06-01 08:20', 'Assigned'),
(6006, 'FLT-SBA-FCO-0106', 3006, '2026-06-01 08:25', 'Assigned'),
(6007, 'FLT-SBA-MAD-0107', 3008, '2026-06-01 08:30', 'Assigned'),
(6008, 'FLT-SBA-LHR-0108', 3009, '2026-06-01 08:35', 'Assigned'),
(6009, 'FLT-SBA-SIN-0109', 3010, '2026-06-01 08:40', 'Assigned'),
(6010, 'FLT-SBA-NRT-0110', 3011, '2026-06-01 08:45', 'Assigned'),
(6011, 'FLT-SBA-ATL-0111', 3012, '2026-06-01 08:50', 'Assigned'),
(6012, 'FLT-SBA-ORD-0112', 3013, '2026-06-01 08:55', 'Assigned'),
(6013, 'FLT-SBA-DFW-0113', 3001, '2026-06-02 09:00', 'Assigned'),
(6014, 'FLT-SBA-DEN-0114', 3002, '2026-06-02 09:05', 'Assigned'),
(6015, 'FLT-SBA-SFO-0115', 3003, '2026-06-02 09:10', 'Assigned');

---Database create
create database vehicale;

---table create 
CREATE TABLE Users (
    user_id serial PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    role VARCHAR(20) NOT NULL
);


CREATE TABLE Vehicles (
    vehicle_id serial PRIMARY KEY,
    vehicle_name VARCHAR(100) NOT NULL,
    vehicle_type VARCHAR(50) NOT NULL,
    model VARCHAR(100),
    registration_number VARCHAR(50) NOT NULL UNIQUE,
    price_per_day DECIMAL(10,2) NOT NULL,
    availability_status VARCHAR(100) NOT NULL
);

CREATE TABLE Bookings (
    booking_id serial PRIMARY KEY,
    user_id INT NOT NULL,
    vehicle_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    booking_status VARCHAR(50) NOT NULL,
    total_cost DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (vehicle_id) REFERENCES Vehicles(vehicle_id)
);

---insert data
INSERT INTO users (role, name, email, password, phone) VALUES
('Admin', 'Alice Johnson', 'alice.johnson@example.com', 'pass123', '9876543210'),
('Customer', 'Bob Smith', 'bob.smith@example.com', 'pass123', '9123456780'),
('Customer', 'Charlie Brown', 'charlie.brown@example.com', 'pass123', '9988776655'),
('Customer', 'Diana Lee', 'diana.lee@example.com', 'pass123', '8899001122'),
('Customer', 'Ethan Miller', 'ethan.miller@example.com', 'pass123', '7766554433');

INSERT INTO Vehicles (vehicle_name, vehicle_type, model, registration_number, price_per_day, availability_status) VALUES
('Toyota Corolla', 'car', '2021', 'CAR-1001', 50.00, 'available'),
('Honda Civic', 'car', '2020', 'CAR-1002', 55.00, 'rented'),
('Yamaha R15', 'bike', '2019', 'BIKE-2001', 25.00, 'available'),
('Ford Ranger', 'truck', '2022', 'TRUCK-3001', 80.00, 'maintenance'),
('Suzuki Swift', 'car', '2021', 'CAR-1003', 48.00, 'available');


INSERT INTO Bookings (
    user_id,
    vehicle_id,
    start_date,
    end_date,
    booking_status,
    total_cost
) VALUES
(2, 1, '2024-01-01', '2024-01-05', 'completed', 250.00),
(3, 1, '2024-02-10', '2024-02-12', 'completed', 100.00),
(4, 2, '2024-03-01', '2024-03-04', 'confirmed', 165.00),
(5, 3, '2024-03-15', '2024-03-16', 'completed', 25.00),
(2, 1, '2024-04-01', '2024-04-03', 'confirmed', 150.00),
(3, 5, '2024-04-10', '2024-04-12', 'pending', 96.00);


-- Query 1: JOIN
SELECT 
    u.name AS customer_name,
    v.vehicle_name,
    b.start_date,
    b.end_date,
    b.booking_status,
    b.total_cost
FROM Bookings b
INNER JOIN Users u ON b.user_id = u.user_id
INNER JOIN Vehicles v ON b.vehicle_id = v.vehicle_id;

-- Query 2: EXISTS
SELECT *
FROM Vehicles v
WHERE NOT EXISTS (
    SELECT 1
    FROM Bookings b
    WHERE b.vehicle_id = v.vehicle_id
);

-- Query 3: WHERE
SELECT *
FROM Vehicles
WHERE availability_status = 'available'
AND vehicle_type = 'car';


-- Query 4: GROUP BY and HAVING
SELECT 
    v.vehicle_name,
    COUNT(b.booking_id) AS total_bookings
FROM Vehicles v
JOIN Bookings b ON v.vehicle_id = b.vehicle_id
GROUP BY v.vehicle_id, v.vehicle_name
HAVING COUNT(b.booking_id) > 2;







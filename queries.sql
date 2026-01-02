

-- user table Create
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    role VARCHAR(50) CHECK (role IN ('Customer', 'Admin'))
);
--data insert of user dtable

INSERT INTO Users (user_id, name, email, phone, role)
VALUES 
(1, 'Alice', 'alice@example.com', '1234567890', 'Customer'),
(2, 'Bob', 'bob@example.com', '0987654321', 'Admin'),
(3, 'Charlie', 'charlie@example.com', '1122334455', 'Customer');


-- Create Vehcles Tables

CREATE TABLE Vehicles (
    vehicle_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    type VARCHAR(50) NOT NULL,
    model INT NOT NULL,
    registration_number VARCHAR(20) UNIQUE NOT NULL,
    rental_price DECIMAL(10,2) NOT NULL,
    status VARCHAR(50) CHECK (status IN ('available', 'rented', 'maintenance'))
);

-- data Inser of Vehicles in Table


INSERT INTO Vehicles (vehicle_id, name, type, model, registration_number, rental_price, status)
VALUES
(1, 'Toyota Corolla', 'car', 2022, 'ABC-123', 50, 'available'),
(2, 'Honda Civic', 'car', 2021, 'DEF-456', 60, 'rented'),
(3, 'Yamaha R15', 'bike', 2023, 'GHI-789', 30, 'available'),
(4, 'Ford F-150', 'truck', 2020, 'JKL-012', 100, 'maintenance');

-- Create Bookings Table 
CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    vehicle_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(50) CHECK (status IN ('pending', 'confirmed', 'completed')),
    total_cost DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (vehicle_id) REFERENCES Vehicles(vehicle_id)
);

-- Data insert in Bookings Table

INSERT INTO Bookings (booking_id, user_id, vehicle_id, start_date, end_date, status, total_cost)
VALUES
(1, 1, 2, '2023-10-01', '2023-10-05', 'completed', 240),
(2, 1, 2, '2023-11-01', '2023-11-03', 'completed', 120),
(3, 3, 2, '2023-12-01', '2023-12-02', 'confirmed', 60),
(4, 1, 1, '2023-12-10', '2023-12-12', 'pending', 100);


-- Query 1: JOIN

CREATE TABLE booking_details (
    booking_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    vehicle_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL,

    FOREIGN KEY (booking_id) REFERENCES bookings (booking_id),
    FOREIGN KEY (user_id) REFERENCES users (user_id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicles (vehicle_id)
);

-- data insert

INSERT INTO booking_details
(booking_id, user_id, vehicle_id, start_date, end_date, status)
VALUES
(1, 1, 2, '2023-10-01', '2023-10-05', 'completed'),
(2, 1, 2, '2023-11-01', '2023-11-03', 'completed'),
(3, 3, 2, '2023-12-01', '2023-12-02', 'confirmed'),
(4, 1, 1, '2023-12-10', '2023-12-12', 'pending');


-- Query 2: EXISTS  UnbookedVehicles crate table

CREATE TABLE UnbookedVehicles (
    vehicle_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    type VARCHAR(50) NOT NULL,
    model INT NOT NULL,
    registration_number VARCHAR(20) UNIQUE NOT NULL,
    rental_price DECIMAL(10,2) NOT NULL,
    status VARCHAR(50) CHECK (status IN ('available', 'rented', 'maintenance'))
);

-- data insert in UnbookedVehicles

INSERT INTO UnbookedVehicles (vehicle_id, name, type, model, registration_number, rental_price, status)
VALUES
(3, 'Yamaha R15', 'bike', 2023, 'GHI-789', 30, 'available'),
(4, 'Ford F-150', 'truck', 2020, 'JKL-012', 100, 'maintenance');


--- Query 3: WHERE create table AvailableCars

CREATE TABLE AvailableCars (
    vehicle_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    type VARCHAR(50) NOT NULL,
    model INT NOT NULL,
    registration_number VARCHAR(20) UNIQUE NOT NULL,
    rental_price DECIMAL(10,2) NOT NULL,
    status VARCHAR(50) CHECK (status IN ('available', 'rented', 'maintenance'))
);


-- data insert

INSERT INTO AvailableCars (vehicle_id, name, type, model, registration_number, rental_price, status)
VALUES
(1, 'Toyota Corolla', 'car', 2022, 'ABC-123', 50, 'available');

--- Query 4: GROUP BY and HAVING VehicleBooking

CREATE TABLE VehicleBooking(
    vehicle_name VARCHAR(100) PRIMARY KEY,
    total_bookings INT NOT NULL
);


-- data insert 
INSERT INTO VehicleBooking(vehicle_name, total_bookings)
VALUES
('Honda Civic', 3);









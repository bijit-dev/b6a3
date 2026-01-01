# Vehicle Rental System - Database Design & SQL Queries

## Database Design & Business Logic

- [ER Diagram Link] https://drawsql.app/teams/bijit-deb/diagrams/b6a3

The system manages:

- **Users**
- **Vehicles**
- **Bookings**

### Business Logic - Database Must Handle

Database design should support these real world scenarios:

#### Users Table Must Store:
- User role (Admin or Customer)
- Name, email, password, phone number
- Each email must be unique (no duplicate accounts)

#### Vehicles Table Must Store:
- Vehicle name, type (car/bike/truck), model
- Registration number (must be unique)
- Rental price per day
- Availability status (available/rented/maintenance)

#### Bookings Table Must Store:
- Which user made the booking (link to Users table)
- Which vehicle was booked (link to Vehicles table)
- Start date and end date of rental
- Booking status (pending/confirmed/completed/cancelled)
- Total cost of the booking
---

## Part 1: ERD Design (Mandatory).

Design an Entity Relationship Diagram (ERD) for the Vehicle Rental System.

### Required Tables

- Users
- Vehicles
- Bookings

### Relationship Requirements

ERD show the relationship:

- **One to Many**: User → Bookings
- **Many to One**: Bookings → Vehicle
- **One to One (logical)**: Each booking connects exactly one user and one vehicle

### ERD Must Include

- Primary Keys (PK)
- Foreign Keys (FK)
- Relationship cardinality
- Status fields (e.g. booking status, vehicle availability)
---

## Part 2: SQL Queries

SQL queries based on this designed schema are follow here.

> **All Queries Answers**: To understand the expected results for each query, please see this **[All Query Results (https://github.com/bijit-dev/b6a3/blob/main/query%20b6a3.sql)** file.
- ** At first Users table created with primary key and all entities properly **
- ** Then Vehicles table created with primary key and all entities **
- ** Now, Bookings table created with maintain foreign key for user and vehicles table **
- ** Finally, data will be inserted to these three tables **
---

## Part 3: Theory Questions

#### drive link
 https://drive.google.com/file/d/19WWXQic-IWBlptBFN2yN_ZJd-ZZAO1Dc/view?usp=sharing
---

# 🚗 Vehicle Rental System – Database Design & SQL Queries

## 📌 Project Overview

This project is a **Vehicle Rental System** database assignment designed to demonstrate understanding of:

-   Relational database design (ERD)
-   Primary Key (PK) and Foreign Key (FK)
-   One-to-One, One-to-Many, and Many-to-One relationships
-   Writing SQL queries using `JOIN`, `EXISTS`, `WHERE`, `GROUP BY`, and `HAVING`

The system is a real‑world vehicle rental business where users can book vehicles for a specific time period.

---

## 🗂️ Database Design

### 📘 Tables Used

The database consists of **three core tables**:

1. **Users**
2. **Vehicles**
3. **Bookings**

---

### 👤 Users Table

Stores all system users including admins and customers.

**Fields:**

-   `user_id` (PK)
-   `role` (Admin / Customer)
-   `name`
-   `email` (Unique)
-   `password`
-   `phone`

**Table Rules:**

-   Each user must have a unique email
-   One user can make multiple bookings

---

### 🚘 Vehicles Table

Stores all vehicles available for rent.

**Fields:**

-   `vehicle_id` (PK)
-   `vehicle_name`
-   `vehicle_type` (car / bike / truck)
-   `model`
-   `registration_number` (Unique)
-   `price_per_day`
-   `availability_status` (available / rented / maintenance)

**Table Rules:**

-   Each vehicle has a unique registration number
-   A vehicle can be booked multiple times (at different dates)

---

### 📅 Bookings Table

Stores booking information that connects users and vehicles.

**Fields:**

-   `booking_id` (PK)
-   `user_id` (FK → Users)
-   `vehicle_id` (FK → Vehicles)
-   `start_date`
-   `end_date`
-   `booking_status` (pending / confirmed / completed / cancelled)
-   `total_cost`

**Table Rules:**

-   Each booking is linked to exactly **one user** and **one vehicle**
-   Acts as a bridge table between Users and Vehicles

---

## 🔗 Entity Relationships (ERD Summary)

-   **One‑to‑Many:** Users → Bookings
-   **Many‑to‑One:** Bookings → Vehicles
-   **Logical One‑to‑One:** Each booking connects one user with one vehicle

📌 _ERD is created using Lucidchart and submitted as a public shareable link as required._

---

## 🧠 SQL Queries Explanation (`queries.sql`)

Below are all required SQL queries along with clear explanations.

---

### 🔹 Query 1: INNER JOIN

**Purpose:**
Retrieve booking details along with customer name and vehicle name.

```sql
SELECT
    bookings.booking_id,
    users.name AS customer_name,
    vehicles.name AS vehicle_name,
    bookings.start_date,
    bookings.end_date,
    bookings.status
FROM bookings
INNER JOIN users ON bookings.user_id = users.user_id
INNER JOIN vehicles ON bookings.vehicle_id = vehicles.vehicle_id;
```

**Explanation:**

-   Uses `INNER JOIN` to combine data from `users`, `vehicles`, and `bookings`
-   Returns only matching records from all tables

---

### 🔹 Query 2: NOT EXISTS

**Purpose:**
Find vehicles that have **never been booked**.

```sql
SELECT *
FROM vehicles
WHERE NOT EXISTS (
    SELECT 1
    FROM bookings
    WHERE bookings.vehicle_id = vehicles.vehicle_id
);
```

**Explanation:**

-   Subquery checks if a vehicle exists in bookings
-   `NOT EXISTS` filters vehicles with no booking history

---

### 🔹 Query 3: WHERE Clause

**Purpose:**
Retrieve all **available vehicles of a specific type** (e.g. cars).

```sql
SELECT *
FROM vehicles
WHERE type = 'car'
AND status = 'available';
```

**Explanation:**

-   Filters vehicles using `WHERE`
-   Ensures only available cars are returned

---

### 🔹 Query 4: GROUP BY & HAVING

**Purpose:**
Find vehicles that have been booked **more than 2 times**.

```sql
SELECT
    vehicles.name AS vehicle_name,
    COUNT(bookings.booking_id) AS total_bookings
FROM bookings
INNER JOIN vehicles ON bookings.vehicle_id = vehicles.vehicle_id
GROUP BY vehicles.name
HAVING COUNT(bookings.booking_id) > 2;
```

**Explanation:**

-   `GROUP BY` groups bookings per vehicle
-   `COUNT()` calculates total bookings
-   `HAVING` filters aggregated results

---

## 🎥 Theory (Viva Preparation)

The following theory questions are answered verbally in a recorded video:

1. What is a foreign key and why it is important
2. Difference between WHERE and HAVING
3. What is a primary key and its characteristics
4. Difference between INNER JOIN and LEFT JOIN

📌 _Answers are recorded in english language thats why it might be possible to have some Ignorance and some untold mistakes please consider this.

---

## ✅ Evaluation Breakdown

| Section        | Weight |
| -------------- | ------ |
| ERD Design     | 60%    |
| SQL Queries    | 20%    |
| Theory Answers | 20%    |

---

## 📂 Files Included

-   `README.md` → Project documentation
-   `queries.sql` → All SQL queries
-   `ERD Link (Lucidchart)` → Submitted separately
-   `Viva Video Link` → Drive Folder Link

---



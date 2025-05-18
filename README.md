Hospital Management System - MySQL Database
Project Title
Hospital Management System Database.
A comprehensive relational database for managing hospital operations including patient care, staff management, and medical records.
Description
This MySQL database provides a complete backend solution for hospital management with:

  Patient management (registration, demographics, emergency contacts)

  Staff management (doctors, nurses with department assignments)

  Appointment scheduling system

  In-patient admission tracking

  Medical records with diagnosis and treatment history

  Medication inventory and prescriptions

  Billing and financial tracking

    Room and bed management

The database enforces referential integrity and business rules through proper constraints, relationships, and validation checks.
Setup Instructions
Prerequisites

    MySQL Server (8.0+ recommended)

    MySQL Workbench or other MySQL client

Installation

    Create the database:
    sql

CREATE DATABASE hospital_management;
USE hospital_management;

Import the SQL file:
bash

mysql -u [username] -p hospital_management < hospital_management.sql

Or use MySQL Workbench's Data Import feature

Verify tables:
sql

    SHOW TABLES;

Alternative Setup

For quick testing, you can:

    Copy the entire SQL script from the repository

    Execute it in your MySQL client

Database Schema (ERD)

Hospital Management System ERD
ERD.png

Key Features

    17 normalized tables covering all hospital operations

    Proper constraints (PK, FK, CHECK, UNIQUE)

    Sample data for quick testing (optional)

    Stored procedures for common operations

    Views for reporting

Usage Examples
sql

-- Find all active patients
SELECT * FROM patients WHERE status = 'Active';

-- View doctor appointments for today
SELECT * FROM appointments 
WHERE DATE(appointment_date) = CURDATE();

-- Check room availability
SELECT * FROM rooms WHERE status = 'Available';


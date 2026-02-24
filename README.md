# UNIVERSITY_COURSE_MANAGEMENT_SYSTEM_SQL(SQL Project)

## 📖 Project Description

The **University Course Management System** is a database management project developed using SQL.
This project is designed to manage and organize university-related academic data such as:

* Students
* Courses
* Instructors
* Enrollments
* Departments

It demonstrates the implementation of important SQL concepts such as:

✔ CRUD Operations
✔ Joins (INNER JOIN, LEFT JOIN)
✔ Aggregate Functions
✔ Subqueries
✔ GROUP BY & HAVING
✔ Date Functions
✔ String Functions
✔ Window Functions
✔ CASE Expression

The goal of this project is to build a structured relational database system that allows efficient data storage, retrieval, filtering, and analysis of academic records.

---

## 🏗️ Database Structure

The system consists of the following **5 main tables**:

### 1️⃣ Students

Stores all student-related information.

| Column Name    | Description        |
| -------------- | ------------------ |
| StudentID      | Unique Student ID  |
| FirstName      | Student First Name |
| LastName       | Student Last Name  |
| Email          | Email Address      |
| BirthDate      | Date of Birth      |
| EnrollmentDate | Enrollment Date    |

---

### 2️⃣ Courses

Stores information about available courses.

| Column Name  | Description          |
| ------------ | -------------------- |
| CourseID     | Unique Course ID     |
| CourseName   | Course Name          |
| DepartmentID | Department Reference |
| Credits      | Course Credit Value  |

---

### 3️⃣ Instructors

Stores instructor details.

| Column Name  | Description          |
| ------------ | -------------------- |
| InstructorID | Unique Instructor ID |
| FirstName    | First Name           |
| LastName     | Last Name            |
| Email        | Email Address        |
| DepartmentID | Department Reference |
| Salary       | Instructor Salary    |

---

### 4️⃣ Enrollments

Manages student-course relationships.

| Column Name    | Description          |
| -------------- | -------------------- |
| EnrollmentID   | Unique Enrollment ID |
| StudentID      | Student Reference    |
| CourseID       | Course Reference     |
| EnrollmentDate | Enrollment Date      |

---

### 5️⃣ Departments

Stores academic department details.

| Column Name    | Description          |
| -------------- | -------------------- |
| DepartmentID   | Unique Department ID |
| DepartmentName | Department Name      |

---

## 🔑 Relationships Between Tables

* A **Student** can enroll in multiple Courses.
* A **Course** belongs to one Department.
* An **Instructor** belongs to one Department.
* The **Enrollments** table connects Students and Courses.

This forms a **Relational Database Model** using:

* Primary Keys
* Foreign Keys
* One-to-Many Relationships

---

## ⚙️ SQL Operations Performed

### 🔹 CRUD Operations

* Insert new student records
* Retrieve student/course information
* Update student details
* Delete records

---

### 🔹 Filtering Data

Retrieve students enrolled after the year 2022 using:

* WHERE Clause

---

### 🔹 Aggregation

Calculate:

* Number of students enrolled in each course
* Average credits of courses
* Maximum salary of instructors

Using:

* COUNT()
* AVG()
* MAX()

---

### 🔹 Group Filtering

Used:

* GROUP BY
* HAVING

To filter grouped results such as courses having more than 5 students.

---

### 🔹 Joins Used

#### INNER JOIN

Retrieves students along with their enrolled courses.

#### LEFT JOIN

Retrieves all students even if they are not enrolled in any course.

---

### 🔹 Subqueries

Used to find:

* Students enrolled in courses having more than 10 enrollments.

---

### 🔹 Date Functions

Extracted year from Enrollment Date using:

* YEAR()

---

### 🔹 String Functions

Concatenated instructor first and last names using:

* CONCAT()

---

### 🔹 Window Function

Calculated running total of students enrolled in courses using:

* COUNT() OVER()

---

### 🔹 CASE Expression

Students were categorized as:

* **Senior** → Enrolled more than 4 years ago
* **Junior** → Enrolled within the last 4 years

---

## 🛠️ Tools & Technologies Used

* SQL
* MySQL Database
* Relational Database Management System (RDBMS)

---


## 📚 Conclusion

The **University Course Management System** successfully demonstrates how SQL can be used to create, manage, and analyze structured academic data using relational database concepts and advanced querying techniques.

This project provides a strong foundation for understanding real-world database management systems used in universities and organizations.

---

⭐ If you like this project, don't forget to star the repository!

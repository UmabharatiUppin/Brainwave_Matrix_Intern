CREATE DATABASE LibraryManagement;
USE LibraryManagement;

-- Create Books table
CREATE TABLE Books (
  book_ID INT(10) PRIMARY KEY,
  Title VARCHAR(100),
  Author VARCHAR(100),
  ISBN VARCHAR(20),
  Genre VARCHAR(50),
  Publisher VARCHAR(50),
  Publication_Date DATE
);

-- Create Branches table
CREATE TABLE Branches (
  Branch_ID INT(10) PRIMARY KEY,
  Branch_Name VARCHAR(50),
  Phone_Number VARCHAR(20),
  Email VARCHAR(50),
  House_No VARCHAR(10),
  Lane VARCHAR(50),
  Address1 VARCHAR(50),
  Address2 VARCHAR(50),
  City VARCHAR(50),
  State VARCHAR(50),
  Pincode VARCHAR(10)
);

-- Create Book_Copies table
CREATE TABLE Book_Copies (
  copy_ID INT(10) PRIMARY KEY,
  Book_ID INT(10),
  Branch_ID INT(10),
  Status VARCHAR(20),
  Due_Date DATE,
  FOREIGN KEY (Book_ID) REFERENCES Books(book_ID),
  FOREIGN KEY (Branch_ID) REFERENCES Branches(Branch_ID)
);

-- Create Members table
CREATE TABLE Members (
  Member_ID INT(10) PRIMARY KEY,
  First_Name VARCHAR(50),
  Last_Name VARCHAR(50),
  Phone_Number VARCHAR(20),
  Email VARCHAR(50),
  House_No VARCHAR(10),
  Lane VARCHAR(50),
  Address1 VARCHAR(50),
  Address2 VARCHAR(50),
  City VARCHAR(50),
  State VARCHAR(50),
  Pincode VARCHAR(10),
  Membership_Expiration_Date DATE
);

-- Create Checkouts table
CREATE TABLE Checkouts (
  checkout_ID INT(10) PRIMARY KEY,
  Member_ID INT(10),
  Copy_ID INT(10),
  Checkout_Date DATE,
  Return_Date DATE,
  Due_Date DATE,
  FOREIGN KEY (Member_ID) REFERENCES Members(Member_ID),
  FOREIGN KEY (Copy_ID) REFERENCES Book_Copies(copy_ID)
);

-- Create Fine table
CREATE TABLE Fine (
  Fine_ID INT(10) PRIMARY KEY,
  Member_ID INT(10),
  Copy_ID INT(10),
  Fine_Amount DECIMAL(10, 2),
  Fine_Date DATE,
  Status VARCHAR(20),
  FOREIGN KEY (Member_ID) REFERENCES Members(Member_ID),
  FOREIGN KEY (Copy_ID) REFERENCES Book_Copies(copy_ID)
);

-- Create Job_Roles table
CREATE TABLE Job_Roles (
  role_ID INT(10) PRIMARY KEY,
  Role_Name VARCHAR(50),
  Salary DECIMAL(10, 2)
);

-- Create Employees table
CREATE TABLE Employees (
  Employee_ID INT(10) PRIMARY KEY,
  Role_ID INT(10),
  First_Name VARCHAR(50),
  Last_Name VARCHAR(50),
  Phone_Number VARCHAR(20),
  Email VARCHAR(50),
  House_No VARCHAR(10),
  Lane VARCHAR(50),
  Address1 VARCHAR(50),
  Address2 VARCHAR(50),
  City VARCHAR(50),
  State VARCHAR(50),
  Pincode VARCHAR(10),
  Date_of_Hire DATE,
  FOREIGN KEY (Role_ID) REFERENCES Job_Roles(role_ID)
);

-- Create Inventory table
CREATE TABLE Inventory (
  Inventory_ID INT(10) PRIMARY KEY,
  Branch_ID INT(10),
  Book_ID INT(10),
  Quantity INT(10),
  Date_Added DATE,
  Date_Modified DATE,
  FOREIGN KEY (Branch_ID) REFERENCES Branches(Branch_ID),
  FOREIGN KEY (Book_ID) REFERENCES Books(book_ID)
);

-- Insert values into Books table
INSERT INTO Books (book_ID, Title, Author, ISBN, Genre, Publisher, Publication_Date)
VALUES 
(1, 'The Great Gatsby', 'F. Scott Fitzgerald', '9780743273565', 'Fiction', 'Scribner', '1925-04-10'),
(2, 'To Kill a Mockingbird', 'Harper Lee', '9780060935467', 'Fiction', 'Harper Perennial', '1960-07-11'),
(3, '1984', 'George Orwell', '9780451524935', 'Dystopian', 'Signet Classics', '1949-06-08');

-- Insert values into Branches table
INSERT INTO Branches (Branch_ID, Branch_Name, Phone_Number, Email, House_No, Lane, Address1, Address2, City, State, Pincode)
VALUES 
(1, 'Central Library', '123-456-7890', 'central@example.com', '123', 'Main St', '123 Main St', 'Suite 100', 'Metropolis', 'NY', '10001'),
(2, 'Westside Branch', '234-567-8901', 'westside@example.com', '456', 'Oak Ave', '456 Oak Ave', '', 'Smallville', 'CA', '90001');

-- Insert values into Book_Copies table
INSERT INTO Book_Copies (copy_ID, Book_ID, Branch_ID, Status, Due_Date)
VALUES 
(1, 1, 1, 'Available', NULL),
(2, 1, 2, 'Checked Out', '2024-09-10'),
(3, 2, 1, 'Available', NULL),
(4, 3, 2, 'Checked Out', '2024-09-15');

-- Insert values into Members table
INSERT INTO Members (Member_ID, First_Name, Last_Name, Phone_Number, Email, House_No, Lane, Address1, Address2, City, State, Pincode, Membership_Expiration_Date)
VALUES 
(1, 'John', 'Doe', '555-1234', 'john.doe@example.com', '789', 'Elm St', '789 Elm St', '', 'Gotham', 'NJ', '07001', '2025-01-01'),
(2, 'Jane', 'Smith', '555-5678', 'jane.smith@example.com', '101', 'Pine St', '101 Pine St', 'Apt 5B', 'Metropolis', 'NY', '10002', '2024-12-31');

-- Insert values into Checkouts table
INSERT INTO Checkouts (checkout_ID, Member_ID, Copy_ID, Checkout_Date, Return_Date, Due_Date)
VALUES 
(1, 1, 2, '2024-08-20', NULL, '2024-09-10'),
(2, 2, 4, '2024-08-25', NULL, '2024-09-15');

-- Insert values into Fine table
INSERT INTO Fine (Fine_ID, Member_ID, Copy_ID, Fine_Amount, Fine_Date, Status)
VALUES 
(1, 1, 2, 5.00, '2024-09-11', 'Unpaid'),
(2, 2, 4, 7.50, '2024-09-16', 'Paid');

-- Insert values into Job_Roles table
INSERT INTO Job_Roles (role_ID, Role_Name, Salary)
VALUES 
(1, 'Librarian', 50000.00),
(2, 'Assistant Librarian', 35000.00);

-- Insert values into Employees table
INSERT INTO Employees (Employee_ID, Role_ID, First_Name, Last_Name, Phone_Number, Email, House_No, Lane, Address1, Address2, City, State, Pincode, Date_of_Hire)
VALUES 
(1, 1, 'Alice', 'Johnson', '555-9876', 'alice.johnson@example.com', '202', 'Birch St', '202 Birch St', '', 'Gotham', 'NJ', '07002', '2020-05-15'),
(2, 2, 'Bob', 'Brown', '555-6543', 'bob.brown@example.com', '303', 'Maple St', '303 Maple St', '', 'Smallville', 'CA', '90002', '2021-03-10');

-- Insert values into Inventory table
INSERT INTO Inventory (Inventory_ID, Branch_ID, Book_ID, Quantity, Date_Added, Date_Modified)
VALUES 
(1, 1, 1, 5, '2024-01-01', '2024-08-20'),
(2, 2, 1, 3, '2024-02-01', '2024-08-20'),
(3, 1, 2, 2, '2024-03-01', '2024-08-20'),
(4, 2, 3, 1, '2024-04-01', '2024-08-25');

-- 1. Retrieve all books available in the "Central Library".
SELECT b.Title, b.Author
FROM Books b
JOIN Book_Copies bc ON b.book_ID = bc.Book_ID
JOIN Branches br ON bc.Branch_ID = br.Branch_ID
WHERE br.Branch_Name = 'Central Library' AND bc.Status = 'Available';

-- 2. Find the total number of copies of each book across all branches.
SELECT b.Title, SUM(i.Quantity) AS Total_Copies
FROM Books b
JOIN Inventory i ON b.book_ID = i.Book_ID
GROUP BY b.Title;

-- 3. List all members who have overdue books.
SELECT m.First_Name, m.Last_Name, c.Due_Date
FROM Members m
JOIN Checkouts c ON m.Member_ID = c.Member_ID
WHERE c.Return_Date IS NULL AND c.Due_Date < CURDATE();

-- 4. Calculate the total fines for a specific member.
SELECT m.First_Name, m.Last_Name, SUM(f.Fine_Amount) AS Total_Fines
FROM Members m
JOIN Fine f ON m.Member_ID = f.Member_ID
WHERE m.First_Name = 'John' AND m.Last_Name = 'Doe';

-- 5. Find all employees who were hired before 2021.
SELECT First_Name, Last_Name, Date_of_Hire
FROM Employees
WHERE Date_of_Hire < '2021-01-01';

-- 6. Retrieve the most recently added books in the library inventory.
SELECT b.Title, b.Author, i.Date_Added
FROM Books b
JOIN Inventory i ON b.book_ID = i.Book_ID
ORDER BY i.Date_Added DESC
LIMIT 5;

-- 7. Find the total number of members in each city.
SELECT City, COUNT(*) AS Total_Members
FROM Members
GROUP BY City;

-- 8. Identify all books checked out by a specific member.
SELECT b.Title, b.Author
FROM Books b
JOIN Book_Copies bc ON b.book_ID = bc.Book_ID
JOIN Checkouts c ON bc.copy_ID = c.Copy_ID
JOIN Members m ON c.Member_ID = m.Member_ID
WHERE m.First_Name = 'Jane' AND m.Last_Name = 'Smith';

-- 9. List all fines that have not been paid yet.
SELECT f.Fine_ID, m.First_Name, m.Last_Name, f.Fine_Amount, f.Fine_Date
FROM Fine f
JOIN Members m ON f.Member_ID = m.Member_ID
WHERE f.Status = 'Unpaid';

-- 10. Find the highest-paid job role in the library.
SELECT Role_Name, Salary
FROM Job_Roles
ORDER BY Salary DESC
LIMIT 1;










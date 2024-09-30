# SQL
The Library Management System is a database-driven application designed to manage the borrowing and lending of books in a library. This project allows users to maintain records of authors, books, borrowers, and borrowed books, facilitating easy access to information and efficient management of library resources.
Database Structure
The project uses the following tables:

Authors

author_id (INT, Primary Key): Unique identifier for each author.
name (VARCHAR): Name of the author.
country (VARCHAR): Country of the author.
Books

book_id (INT, Primary Key): Unique identifier for each book.
title (VARCHAR): Title of the book.
author_id (INT, Foreign Key): Identifier for the author of the book.
publication_year (INT): Year the book was published.
genre (VARCHAR): Genre of the book.
Borrowers

borrower_id (INT, Primary Key): Unique identifier for each borrower.
name (VARCHAR): Name of the borrower.
contact_info (VARCHAR): Contact information for the borrower.
Borrowed_Books

borrowed_book_id (INT, Primary Key): Unique identifier for each borrowed book record.
book_id (INT, Foreign Key): Identifier for the borrowed book.
borrower_id (INT, Foreign Key): Identifier for the borrower.
borrow_date (DATE): Date the book was borrowed.
return_date (DATE): Date the book was returned.
Installation
To set up the Library Management System:

Prerequisites: Ensure you have a SQL Server instance installed.
Database Creation: Run the SQL commands to create the librarymanagement database and the necessary tables.
Insert Sample Data: Use the provided INSERT statements to populate the tables with sample data.
Usage
Execute the SQL queries to manage authors, books, borrowers, and borrowed books.
Use the SELECT queries to retrieve information from the database as needed.
Examples
Here are some example queries you can run:

Get All Authors:
SELECT * FROM Authors;
Get All Books with Author Information:

SELECT Books.title, Authors.name AS author_name
FROM Books
JOIN Authors ON Books.author_id = Authors.author_id;
Get Borrowers Who Have Borrowed Books:

SELECT 
    Borrowers.name AS borrower_name,
    Books.title AS book_title,
    Borrowed_Books.borrow_date,
    Borrowed_Books.return_date
FROM 
    Borrowers
JOIN 
    Borrowed_Books ON Borrowers.borrower_id = Borrowed_Books.borrower_id
JOIN 
    Books ON Borrowed_Books.book_id = Books.book_id;

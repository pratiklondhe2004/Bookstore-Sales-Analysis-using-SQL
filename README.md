# Bookstore-Sales-Analysis-using-SQL
A PostgreSQL-based SQL project for a bookstore management system that handles books, customers, and orders with 20+ analytical queries using joins, aggregations, and filtering.

## Project Overview 

The Bookstore Sales Analysis using SQL project is a PostgreSQL-based system designed to manage and analyze bookstore data including books, customers, and orders. It uses SQL queries to perform sales analysis and generate insights such as revenue, customer behavior, inventory status, and top-selling books. The project demonstrates the use of joins, aggregations, and filtering for data analysis and decision-making.

## project objectives

- To design a relational database for a bookstore using PostgreSQL.
- To manage books, customers, and order data efficiently.
- To perform sales analysis using SQL queries.
- To extract business insights like revenue, top-selling books, and customer behavior.
- To use joins, aggregations, and filtering for data analysis.
- To understand real-world database operations and decision-making using SQL.

## Key Questions (SQL Analysis)

- Which books belong to a specific genre (e.g., Fiction)?
- Which books were published after a certain year (e.g., 1950)?
- Who are the customers from a specific country (e.g., Canada)?
- What are the total orders placed in a given time period?
- What is the total stock of all books available?
- Which is the most expensive book in the store?
- Which customers ordered more than one book?
- Which orders exceed a certain total amount (e.g., $20)?
- What are the different genres available in the bookstore?
- Which book has the lowest stock?
- What is the total revenue generated from all orders?
- Which genre has the highest number of books sold?
- What is the average price of books in a specific genre?
- Which customers placed multiple orders?
- Which book is ordered most frequently?
- What are the top 3 most expensive books in a genre?
- How many books were sold by each author?
- Which cities have high-spending customers?
- Who is the highest spending customer?
- What is the remaining stock after fulfilling all orders?

## Dataset Description

The dataset used in this project represents a bookstore management system designed using PostgreSQL. It consists of three relational tables that store information about books, customers, and orders.

## dataset dictionary

|Table Name |    	Column Name	   |  Data Type    |
|-----------|--------------------|---------------|
|Books	    |       Book_ID	     | SERIAL (PK)   | 
|Books	    |        Title	     | VARCHAR(100)  |
|Books	    |        Author	     | VARCHAR(100)  |
|Books	    |        Genre	     | VARCHAR(100)  |
|Books      |    Published_year	 |    INT        |
|Books	    |        Price	     | NUMERIC(10,2) |
|Books	    |        Stock	     |    INT        |
|Customers	|      Customer_id	 |  SERIAL (PK)  |
|Customers  |         Name	     |  VARCHAR(100) |
|Customers	|         Email	     |  VARCHAR(100) |
|Customers  |         Phone	     |  VARCHAR(15)  |
|Customers  |         City	     |  VARCHAR(100) |
|Customers  |        Country	   |   VARCHAR(100)|
|Orders	    |       Order_id	   |  SERIAL (PK)  |
|Orders	    |        Customer_ID |     INT (FK)  |
|Orders	    |         Book_ID	   |    INT (FK)   |
|Orders	    |         Order_Date |    DATE       |
|Orders	    |          Quantity	 |     INT       |
|Orders	    |      Total_Amount	 | NUMERIC(10,2) |

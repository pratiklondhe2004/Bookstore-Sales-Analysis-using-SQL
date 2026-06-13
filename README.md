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

## SQL Analysis and Queries

### Q1) retrieve all books in the fiction genre

SELECT * FROM Books 
WHERE Genre='Fiction'; 

### Q2) find books published after the year 1950;
SELECT * FROM BOOKS 
WHERE published_year > 1950; 

### Q3) list all the customers from canada
SELECT * FROM CUSTOMERS 
WHERE country='Canada'; 

### Q4) Show orders placed in november 2023 
SELECT * FROM orders 
where Order_date between '01-11-2023' AND '30-11-2023';

### Q5) retrieve the total stock of books available 
SELECT sum(stock) AS Total_stock FROM BOOKS; 

### Q6) find the details of the most expensive book; 
SELECT * FROM BOOKS 
order by price DESC LIMIT 1; 

### Q7) Show all customers who ordered more than 1 quantity of book 
SELECT * FROM Orders 
WHERE quantity>1; 

### Q8) retrieve all the orders where the total amount exceeds $20
SELECT * FROM orders 
where total_amount>20; 

### Q9) list all the genres available in the book table 
SELECT DISTINCT(genre) FROM BOOKS; 

### Q10) find the book with lowest stock 
SELECT * FROM BOOKS 
ORDER BY stock ASC ; 

### Q11) calculate the total revenue generated from all orders
SELECT sum(total_amount) AS total_profit FROM orders; 

### Q12) retrieve the total numbers of books sold for each genre;
SELECT b.genre,sum(o.quantity) FROM ORDERS o 
JOIN BOOKS b on b.book_id=o.book_id 
GROUP BY genre; 

### Q13) find the avg price of books in the 'fantancy' genre 
SELECT AVG(PRICE) AS AVG_PRICE_of_fantasy_genre FROM BOOKS
WHERE genre='Fantasy'; 

### Q14) list customers who placed atleast 2 orders 
SELECT c.name,c.customer_id,COUNT(o.quantity) FROM orders o 
join customers c on c.customer_id=o.customer_id 
GROUP BY c.customer_id,c.name 
HAVING COUNT (o.quantity) >=2;

### Q15)find the most frequently order book 
SELECT book_id,COUNT(order_id) as order_count FROM orders 
GROUP BY book_id 
ORDER BY order_count DESC LIMIT 1;

### Q16) show the top 3 most expensive books of fantasy genre; 
SELECT * FROM BOOKS 
WHERE genre='Fantasy' 
ORDER BY price DESC LIMIT 3; 

### Q17) retrieve the total quantity of book sold by each author 
SELECT b.author,b.title,SUM(o.quantity) FROM orders o 
join books b on b.book_id=o.book_id 
GROUP BY b.author,b.title; 

### Q18) list the cities where customers who spent over $30 are located 
SELECT distinct(c.city),o.total_amount FROM Orders o 
join customers c on c.customer_id=o.customer_id 
WHERE o.total_amount> 30; 

### Q19)find the customer who spent most on orders 

SELECT c.name,c.Customer_id,sum(o.total_amount) as amount_spent FROM orders o 
join customers c on c.customer_id=o.customer_id 
GROUP BY c.name,c.customer_id 
ORDER BY amount_spent DESC; 

### Q20) calculate the stock remaining after fulfilling all orders 
SELECT b.book_id,b.title,b.stock,COALESCE(SUM(o.quantity),0) AS order_quantity, b.stock-COALESCE(SUM(o.quantity),0) AS remaining_stock FROM books b
LEFT JOIN orders o ON b.book_id=o.book_id 
GROUP BY b.book_id
ORDER BY b.book_id;

## Key Insights

- Fiction is one of the most frequently analyzed and popular book genres in the dataset.
- Books published in earlier years are still part of active sales analysis.
- Customer distribution can be analyzed based on country and city.
- Revenue is generated mainly through high-value and frequently ordered books.
- A small number of books contribute to a large portion of total sales.
- Customer purchasing behavior shows that some users place multiple orders.
- Inventory analysis helps identify low-stock and high-demand books.

## conclusion

The Bookstore Sales Analysis using SQL project successfully demonstrates how PostgreSQL can be used to manage and analyze real-world business data. By designing relational tables and executing analytical SQL queries, the project provides valuable insights into sales performance, customer behavior, and inventory management. It highlights the importance of SQL in data analysis and decision-making for business growth.

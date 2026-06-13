CREATE TABLE BOOKS(
  Book_ID serial PRIMARY KEY,
  Title varchar(100),
  Author varchar(100),
  Genre varchar(100),
  Published_year INT,
  Price numeric(10,2),
  Stock INT
);

SELECT * FROM BOOKS;

CREATE TABLE CUSTOMERS(
   Customer_id SERIAL PRIMARY KEY,
   Name varchar(100),
   Email varchar(100),
   Phone varchar(15),
   city varchar(100),
   Country varchar(100)
);

SELECT * FROM CUSTOMERS;

CREATE TABLE ORDERS(
     Order_id SERIAL PRIMARY KEY,
	 Customer_ID INT REFERENCES CUSTOMERS(Customer_id),
	 Book_ID INT REFERENCES BOOKS (Book_id),
	 Order_Date DATE,
	 Quantity INT,
	 Total_Amount NUMERIC(10,2)
);

SELECT * FROM ORDERS;

--  1) retrieve all books in the fiction genre

SELECT * FROM Books
WHERE Genre='Fiction';

-- 2) find books published after the year 1950;

SELECT * FROM BOOKS 
WHERE published_year > 1950;

-- 3) list all the customers from canada

SELECT * FROM CUSTOMERS
WHERE country='Canada';

-- 4) Show orders placed in november 2023

SELECT * FROM orders
where Order_date between '01-11-2023' AND '30-11-2023';
	
-- 5) retrieve the total stock of books available

SELECT sum(stock) AS Total_stock FROM BOOKS;

-- 6) find the details of the most expensive book;

SELECT * FROM BOOKS order by price DESC LIMIT 1;

--7) Show all customers who ordered more than 1 quantity of book

SELECT * FROM Orders 
WHERE quantity>1;

-- 8) retrieve all the orders where the total amount exceeds $20


SELECT * FROM orders 
where total_amount>20;

-- 9) list all the genres available in the book table

SELECT DISTINCT(genre) FROM BOOKS;


-- 10) find the book with lowest stock

SELECT * FROM BOOKS ORDER BY stock ASC ;

-- 11) calculate the total revenue generated from all orders

SELECT sum(total_amount) AS total_profit  FROM orders;

--12) retrieve the total numbers of books sold for each genre;

SELECT b.genre,sum(o.quantity)
FROM ORDERS o
JOIN BOOKS b
on b.book_id=o.book_id
GROUP BY genre;

-- 13) find the avg price of books in the 'fantancy' genre

SELECT AVG(PRICE) AS AVG_PRICE_of_fantasy_genre
FROM BOOKS
WHERE genre='Fantasy';

--14) list customers who placed atleast 2 orders

SELECT c.name,c.customer_id,COUNT(o.quantity)
FROM orders o
join customers c
on c.customer_id=o.customer_id
GROUP BY c.customer_id,c.name
HAVING COUNT (o.quantity) >=2;

--OR
SELECT customer_id,count(quantity)
FROM orders
GROUP BY customer_id
HAVING COUNT(quantity) >=2;

-- 15)find the most frequently order book

SELECT book_id,COUNT(order_id) as order_count
FROM orders
GROUP BY book_id
ORDER BY order_count DESC LIMIT 1;


--OR

SELECT B.title,B.book_id,COUNT(O.order_id) as order_count
FROM orders O
join books B
ON B.book_id=O.book_id
GROUP BY B.book_id,B.title
ORDER BY order_count DESC LIMIT 1;

-- 16) show the top 3 most expensive books of fantasy genre;

SELECT * FROM BOOKS 
WHERE genre='Fantasy'
ORDER BY price DESC LIMIT 3;
 
--17) retrieve the total quantity of book sold by each author

SELECT b.author,b.title,SUM(o.quantity)
FROM orders o
join books b
on b.book_id=o.book_id
GROUP BY b.author,b.title;

--18) list the cities where customers who spent over $30 are located


SELECT distinct(c.city),o.total_amount
FROM Orders o
join customers c
on c.customer_id=o.customer_id
WHERE o.total_amount> 30;

--19)find the customer who spent most on orders 

SELECT c.name,c.Customer_id,sum(o.total_amount) as amount_spent
FROM orders o
join customers c
on c.customer_id=o.customer_id
GROUP BY c.name,c.customer_id
ORDER BY amount_spent DESC; 

--20) calculate the stock remaining after fulfilling all orders 

SELECT b.book_id,b.title,b.stock,COALESCE(SUM(o.quantity),0) AS order_quantity,
   b.stock-COALESCE(SUM(o.quantity),0) AS remaining_stock
FROM books b
LEFT JOIN orders o
ON b.book_id=o.book_id
GROUP BY b.book_id
ORDER BY b.book_id;
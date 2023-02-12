/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 
 select p.name as product, c.name as category from products as p
 inner join categories as c on c.categoryid = p.categoryid
 where c.name = 'computers';
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */

select products.name, products.price, reviews.rating from products
inner join reviews on products.productid = reviews.productid
where rating = 5;

 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */

select e.firstname, e.LastName, sum(s.quantity) as total
from sales as s
inner join employees as e on e.employeeid = s.EmployeeID
group by e.employeeid
order by total desc
limit 2;

/* joins: find the name of the department, and the name of the category for Appliances and Games */

select categories.name, departments.name from departments
inner join categories  on categories.departmentid = departments.DepartmentID
where categories.name = 'appliances' or categories.name = 'games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 
 select p.Name, sum(s.Quantity) as 'total sold', sum(s.quantity * s.priceperunit) as 'total price' from  products as p
 inner join sales as s on s.productid = p.ProductID
 where p.productid = 97;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */

select p.name as product, r.Reviewer as reviewer, r.Rating as rating, r.Comment
from products as p 
inner join reviews as r on r.ProductID = p.ProductID
where p.productid = 857 and r.rating = 1;


-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */

select e.employeeid, e.firstname, e.lastname, p.name, sum(s.quantity) as totalsold from sales as s
inner join employees as e on e.employeeid = s.EmployeeID
inner join products as p on p.ProductID = s.ProductID
group by e.EmployeeID, p.ProductID;

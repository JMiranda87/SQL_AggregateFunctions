-- 1. Find whether the quantity of products, which customers ordered, is odd or even.
SELECT orderNumber, SUM(quantityOrdered) as Qty,
    IF(MOD(SUM(quantityOrdered),2),'Odd', 'Even') as oddOrEven
FROM orderdetails
GROUP BY orderNumber
ORDER BY orderNumber;

-- 2. Use TRUNCATE() function with a positive number of decimal places
SELECT TRUNCATE(1.555,1);

-- 3. Find the average order line item values by product codes
SELECT productCode, AVG(quantityOrdered * priceEach) as avg_order_value
FROM orderDetails
GROUP BY productCode;

-- 4. Round the average values to zero decimal places
SELECT productCode,
  ROUND(AVG(quantityOrdered * priceEach)) as avg_order_item_value
FROM orderDetails
GROUP BY productCode;

-- 5. Compare TRUNCATE() and ROUND() functions
SELECT TRUNCATE(1.999,1), ROUND(1.999,1);

-- 6. Use REPLACE() function to correct a spelling mistake
UPDATE products 
SET productDescription = REPLACE(productDescription,'abuot','about');

-- 7. Calculate the number of days between the required date and shipped date of the orders
SELECT orderNumber, DATEDIFF(requiredDate, shippedDate) as daysLeft
FROM orders
ORDER BY daysLeft DESC;

-- 8. Get all orders whose status is "In Process" and calculate the number of days between the ordered date and the required date
SELECT orderNumber, DATEDIFF(requiredDate, orderDate) as remaining_days
FROM orders
WHERE status = 'In Process'
ORDER BY remaining_days;

-- 9. Calculate an interval in week or month
SELECT 
    orderNumber,
    ROUND(DATEDIFF(requiredDate, orderDate) / 7, 2) as weeks,
    ROUND(DATEDIFF(requiredDate, orderDate) / 30, 2) as months
FROM orders 
WHERE status = 'In Process';

-- 10. Use DATE_FORMAT() function
SELECT 
    orderNumber,
    DATE_FORMAT(orderdate, '%Y-%m-%d') orderDate,
    DATE_FORMAT(requireddate, '%a %D %b %Y') requireddate,
    DATE_FORMAT(shippedDate, '%W %D %M %Y') shippedDate
FROM orders;

-- 11. Use LPAD() function
SELECT firstName, LPAD(firstName,10,'kk'), LPAD(firstName,5,'kk'), LPAD(firstName,4,'kk') 
FROM employees;

-- 12. Use TRIM() function
SELECT TRIM(' SQL TRIM Function ');

-- 13. Use LTRIM() function
SELECT LTRIM('  SQL LTRIM function');

-- 14. Use RTRIM() function
SELECT RTRIM('SQL RTRIM function   ');

-- 15. Use YEAR() function to get the number of orders shipped per year
SELECT YEAR(shippeddate) as year, COUNT(ordernumber) as orderQty
FROM orders 
GROUP BY YEAR(shippeddate)
ORDER BY YEAR(shippeddate);

-- 16. Use DAY() function to return the number of orders by day number in 2004
SELECT DAY(orderdate) as dayofmonth, COUNT(*)
FROM orders 
WHERE YEAR(orderdate) = 2004
GROUP BY dayofmonth
ORDER BY dayofmonth;
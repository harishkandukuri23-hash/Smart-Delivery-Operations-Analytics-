
-- Delivery Delays

-- Q1	Which restaurants are associated with the longest average delivery times?

SELECT
    r.restaurant_name,
    AVG(TIMESTAMPDIFF(MINUTE, o.order_time, o.delivered_time)) AS avg_delivery_time_minutes
FROM order_details o
JOIN restaurant_info r
    ON o.restaurant_id = r.restaurant_id
GROUP BY r.restaurant_id, r.restaurant_name
ORDER BY avg_delivery_time_minutes DESC
limit 1;	


-- Q2	Which delivery partners have the highest average time per order?

SELECT
    p.partner_id,
    AVG(TIMESTAMPDIFF(MINUTE, o.order_time, o.delivered_time)) AS avg_time_per_order
FROM order_details o
JOIN del_par p
    ON p.partner_id = o.partner_id
GROUP BY p.partner_id
ORDER BY avg_time_per_order DESC
limit 1;


-- Q3	Which cities experience the most delivery delays?

SELECT
    r.city,
    AVG(TIMESTAMPDIFF(MINUTE, o.order_time, o.delivered_time)) AS avg_delivery_time_minutes
FROM order_details o
JOIN restaurant_info r
    ON o.restaurant_id = r.restaurant_id
GROUP BY r.city
ORDER BY avg_delivery_time_minutes DESC
limit 1;


-- Q4	Are delivery delays increasing or decreasing over time?

SELECT
    DATE_FORMAT(o.order_time, '%Y-%M') AS month,
    AVG(TIMESTAMPDIFF(MINUTE, o.order_time, o.delivered_time)) AS avg_delivery_time_minutes
FROM order_details o
GROUP BY month
ORDER BY month;


-- Order Cancellations

-- Q1	Which restaurants receive the highest volume of cancellations?

SELECT
    r.restaurant_name,count(*) as count_of_cancellations
FROM order_details o
JOIN restaurant_info r
    ON o.restaurant_id = r.restaurant_id
where o.status='Cancelled'
GROUP BY r.restaurant_name
ORDER BY count_of_cancellations DESC
limit 1;

-- Q2	Which cities have the highest cancellation rates by percentage?

SELECT
    r.city,
    count(case when o.status='Cancelled' then 1 end )*100.0/count(*) as highest_cancellation_percentage
FROM order_details o
JOIN restaurant_info r
    ON o.restaurant_id = r.restaurant_id
GROUP BY r.city
ORDER BY highest_cancellation_percentage DESC
limit 1;

-- Q3	Is there a correlation between delivery delays and cancellations?

SELECT
    restaurant_id,
    AVG(TIMESTAMPDIFF(MINUTE, order_time, delivered_time)) AS avg_delivery_time,
    ROUND(
        100.0 * SUM(CASE WHEN status='Cancelled' THEN 1 ELSE 0 END)
        / COUNT(*), 2
    ) AS cancellation_rate
FROM order_details
GROUP BY restaurant_id;

-- Q4	On which days and at which times do cancellations peak?

SELECT
    DAYNAME(order_time) AS day_of_week,
    HOUR(order_time) AS hour_of_day,
    COUNT(*) AS cancellations
FROM order_details
WHERE status = 'Cancelled'
GROUP BY
    DAYNAME(order_time),
    HOUR(order_time)
ORDER BY cancellations DESC
LIMIT 5;


-- Revenue Optimisation

-- Q1	Which restaurants generate the highest total revenue?

select 
	 r. restaurant_name,
	sum(o.order_amount)as highest_total_revenue
    from order_details o
    JOIN restaurant_info r
    ON o.restaurant_id = r.restaurant_id
    group by r.restaurant_name
    order by highest_total_revenue desc
    limit 1;

    
-- Q2	Which cities contribute the most to overall company revenue?
    
    select 
	 r. city,
	sum(o.order_amount)as  overall_company_revenue
    from order_details o
    JOIN restaurant_info r
    ON o.restaurant_id = r.restaurant_id
    group by r.city
    order by overall_company_revenue desc
    limit 1;
    
    
-- Q3	Which payment methods are most popular and most valuable?
    
select 
	payment_mode, 
	sum(amount) as most_popular_and_valuable from pay
	group by payment_mode
	order by most_popular_and_valuable desc limit 1;

        
-- Q4	What are the monthly revenue trends over the past year?

SELECT
  DATE_FORMAT(order_time, '%Y-%M') AS month,
  SUM(order_amount) AS monthly_revenue
FROM order_details
WHERE order_time >= DATE_SUB('2025-05-20', INTERVAL 1 YEAR)
  AND status = 'Delivered'
GROUP BY month
ORDER BY month;


-- Customer Retention

-- Q1	Who are the top 10 most valuable customers by lifetime spending?

select c.customer_name, sum(o.order_amount) as total_spending
from order_details o
join customers_master c 
on o.customer_id=c.customer_id
group by c.customer_name
order by total_spending desc
limit 10;


-- Q2	Which customers order most frequently, and what is their average order value?

select 
		c.customer_name,avg(o.order_amount) as average_order_value  from customers_master c
        join order_details o
        on c.customer_id=o.customer_id
        group by c.customer_name
        order by count(*) desc limit 1;
     
     
-- Q3	Which customers have gone inactive in the last 90 days?

select * from  customers_master
where customer_id in
	(select customer_id from customer_behave
    where churn_flag=1);
    
    
-- Q4	What behavioural patterns signal that a customer is about to churn?

select* from customers_master m
join customer_behave b
on m.customer_id=b.customer_id
where last_order_days > 60 and last_order_days < 90;


-- Delivery Partner Performance

-- Q1	Who are the fastest delivery partners based on average delivery time?

SELECT
    d.partner_name,
    AVG(TIMESTAMPDIFF(MINUTE, o.order_time, o.delivered_time)) AS avg_delivery
FROM order_details o
JOIN del_par d
    ON d.partner_id = o.partner_id
group by partner_name
ORDER BY avg_delivery 
limit 1;


-- Q2	Which partners handle the highest volume of successful deliveries?

SELECT
     d.partner_name,count(*) as successful_deliveries
FROM order_details o
JOIN del_par d 
ON d.partner_id = o.partner_id
where o.status='Delivered'
GROUP BY  d.partner_name
ORDER BY successful_deliveries DESC
limit 1;


-- Q3	Which partners are associated with the most cancellations or delays?

SELECT
     d.partner_name,count(*) as successful_deliveries
FROM order_details o
JOIN del_par d 
ON d.partner_id = o.partner_id
where o.status in ('Cancelled' , 'Pending')
GROUP BY  d.partner_name
ORDER BY successful_deliveries DESC
limit 1;


-- Q4	What is the average customer rating received per delivery partner?	

select 
	d.partner_name,
    avg(r.customer_rating)as average_customer_rating
from rat r
JOIN order_details o
on  o.order_id=r.order_id
join del_par d
ON d.partner_id = o.partner_id 
group by d.partner_name
order by average_customer_rating desc
limit 1;
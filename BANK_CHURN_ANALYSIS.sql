



CREATE TABLE Bank_churn (
    RowNumber INT,
    CustomerId INT,
    Surname VARCHAR(100),
    CreditScore INT,
    Geography VARCHAR(50),
    Gender VARCHAR(20),
    Age INT,
    Tenure INT,
    Balance NUMERIC(15, 2),
    NumOfProducts INT,
    HasCrCard INT,
    IsActiveMember INT,
    EstimatedSalary NUMERIC(15, 2),
    Exited INT
);


-- checking if the table has been created properly 
SELECT * FROM Bank_churn LIMIT 10;


-- getting insights from aggregate function
SELECT avg(creditscore) as avg_credit,
       min(creditscore) as min_credit,
	   max(creditscore) as max_credit,
	   count(creditscore) as total_count
from bank_churn;


-- summary statistics for the numerical variables in the dataset using SQL
select 
'creditscore' as metric,
min(creditscore) as min_credit,
max(creditscore) as max_credit,
PERCENTILE_CONT(0.25) within group (order by creditscore) as q1_25th,
PERCENTILE_CONT(0.50) within group (order by creditscore) as median_50th,
PERCENTILE_CONT(0.75) within group (order by creditscore) as q3_75th,
avg(creditscore) as avg_credit
from bank_churn
union all 
select 
'balance' as metric,
min(balance) as min_balance,
max(balance) as max_balance,
PERCENTILE_CONT(0.25) within group (order by balance) as q1_25th,
PERCENTILE_CONT(0.50) within group (order by balance) as median_50th,
PERCENTILE_CONT(0.75) within group (order by balance) as q3_75th,
avg(balance) as avg_balance
from bank_churn;




-- using age as a metric 
SELECT 
    CASE 
        WHEN Age < 30 THEN '18-29'
        WHEN Age < 40 THEN '30-39'
        WHEN Age < 50 THEN '40-49'
        ELSE '50+'
    END as age_group,
    COUNT(*) as total_customers,
    SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) as num_churned,
    ROUND(100.0 * SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) as churn_rate_pct
FROM bank_churn
GROUP BY age_group
ORDER BY churn_rate_pct DESC;




select avg(tenure) as avg_ten,
max(tenure) as max_ten,
min(tenure) as min_ten
from bank_churn;


-- using tenure as a metric
select 
case 
when tenure < 2 then '0-1'
when tenure < 4 then '2-3'
when tenure < 6 then '4-5'
else '6+'
end as tenure_bal,
count(*)as total_tenure,
sum(case when Exited =1 then 1 else 0 end) as num_churn,
round(100.0*sum(case when Exited =1 then 1 else 0 end)/count(*)*2)as churn_percent
from bank_churn
group by tenure_bal
order by tenure_bal ;





-- using IsActiveMember as a metric
select 
case 
when IsActiveMember = 1 then 'active_member'
else 'Inactive_member'
end as total_member_activity,
count(*) as total_bal,
sum(case when Exited = 1 then 1 else 0 end) as num_churn,
round(sum(case when Exited =1 then 1 else 0 end )/count(*)*2)as churn_percent
from bank_churn
group by total_member_activity
order by churn_percent desc;




-- using numofproducts as a metric
select 
numofproducts as num_produts,
count(*) as total_product,
sum(case when Exited = 1 then 1 else 0 end)as num_churn,
round(sum(100.0*case when Exited = 1 then 1 else 0 end)/count(*)*2) as churn_percent
from bank_churn
group by num_produts
order by churn_percent desc;



-- using Geography as a metric
select 
Geography as country,
count(*) as total_country,
sum(case when Exited = 1 then 1 else 0 end)as num_churn,
round(sum(100.0*case when Exited = 1 then 1 else 0 end)/count(*)*2) as churn_percent
from bank_churn
group by country
order by churn_percent desc;



select 
customerid,balance,
row_number()over(order by balance desc) as rank
from bank_churn ;


select 
customerid,tenure,balance ,
rank()over(PARTITION  by tenure order by balance desc) as all_total
from bank_churn;



SELECT 
    customerid,
    tenure,
    balance,
    RANK() OVER (PARTITION BY tenure ORDER BY balance DESC) as rank_in_tenure_group,
    RANK() OVER (ORDER BY balance DESC) as overall_rank
FROM bank_churn limit 5;


WITH ranked_customers AS (
    SELECT 
        customerid,
        tenure,
		IsActiveMember,
		creditscore,
        balance,
        DENSE_RANK() OVER (PARTITION BY tenure ORDER BY balance DESC) as rank_in_tenure_group,
        DENSE_RANK() OVER (ORDER BY balance DESC) as overall_rank
    FROM bank_churn
)
SELECT * FROM ranked_customers
WHERE overall_rank <= 10;



WITH Target_Segment AS (
    SELECT 
        customerid,
        tenure,
        isactivemember,
        creditscore,
        balance,
        -- We rank ONLY the people who meet our specific business criteria
        DENSE_RANK() OVER (ORDER BY balance DESC) as priority_rank
    FROM bank_churn
    WHERE isactivemember = 0      -- Criteria 1: They are inactive
      AND creditscore >= 700      -- Criteria 2: They have great credit
)
SELECT * FROM Target_Segment
WHERE priority_rank <= 5;




WITH ranked_customers AS (
    SELECT 
        customerid,
        age,
        tenure,
        isactivemember,
        creditscore,
        balance,
        numofproducts,
        exited,
        DENSE_RANK() OVER (PARTITION BY tenure ORDER BY balance DESC) as rank_in_tenure_group,
        DENSE_RANK() OVER (ORDER BY balance DESC) as overall_rank
    FROM bank_churn
)
SELECT * FROM ranked_customers
WHERE overall_rank <= 10
ORDER BY overall_rank;



-- getting top 5 churn customer
WITH Target_Segment AS (
    SELECT 
        customerid,
        age,
        tenure,
        isactivemember,
        creditscore,
        balance,
        numofproducts,
        exited,
        DENSE_RANK() OVER (ORDER BY balance DESC) as priority_rank
    FROM bank_churn
    WHERE isactivemember = 0
      AND creditscore >= 700
      AND exited = 0
)
SELECT * FROM Target_Segment
WHERE priority_rank <= 5
ORDER BY priority_rank;
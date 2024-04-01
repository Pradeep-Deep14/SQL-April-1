select * from Transactions


--SQL Query to obtain the third transaction of every user--
--User ID,Spend,Transaction Date--


WITH CTE AS
    (SELECT *,
	ROW_NUMBER() OVER (PARTITION BY user_Id ORDER by transaction_date)as RN
	FROM transactions)
Select * from CTE where RN=3
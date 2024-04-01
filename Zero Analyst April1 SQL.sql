select * from employees



--SQL query to retrieve third highest salary--

WITH CTE as
	(SELECT *,
	 DENSE_RANK()OVER(ORDER BY SALARY DESC)AS DRNK
	 FROM employees
	)
SELECT * FROM CTE WHERE DRNK=3


--Employee details who have Highest Salary from Each Department--

WITH CTE AS
	(SELECT *,
	DENSE_RANK()OVER(PARTITION BY DEPARTMENT ORDER BY SALARY DESC)AS DRNK
	FROM EMPLOYEES)
SELECT SALARY,DEPARTMENT,DRNK AS HIGHEST_SALARY_FROM_EACH_DEPARTMENT FROM CTE WHERE DRNK=1
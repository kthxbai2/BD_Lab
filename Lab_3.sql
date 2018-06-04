--Lab_3
--SQL Joins

--Question 1.
	SELECT E.LAST_NAME,
		   DEPARTMENT_ID,
		   D.DEPARTMENT_NAME
	FROM EMPLOYEES E
	NATURAL JOIN DEPARTMENTS D
--Question 2.
	SELECT DISTINCT E.JOB_ID,
					D.LOCATION_ID
	FROM EMPLOYEES E
	INNER JOIN DEPARTMENTS D ON(E.DEPARTMENT_ID = D.DEPARTMENT_ID)
	WHERE D.DEPARTMENT_ID = 80

--Question 3.
	SELECT E.LAST_NAME,
		   D.DEPARTMENT_NAME,
		   D.LOCATION_ID,
		   L.CITY
	FROM EMPLOYEES E
	INNER JOIN DEPARTMENTS D ON(E.DEPARTMENT_ID = D.DEPARTMENT_ID)
	INNER JOIN LOCATIONS L ON(D.LOCATION_ID = L.LOCATION_ID)
	WHERE E.COMMISSION_PCT IS NOT NULL

--Question 4.
	SELECT E.LAST_NAME,
		   D.DEPARTMENT_NAME
	FROM EMPLOYEES E
	INNER JOIN DEPARTMENTS D ON(E.DEPARTMENT_ID = D.DEPARTMENT_ID)
	WHERE E.LAST_NAME LIKE '%a%'

--Question 5.
	SELECT E.LAST_NAME,
		   E.JOB_ID,
		   DEPARTMENT_ID,
		   D.DEPARTMENT_NAME
	FROM EMPLOYEES E
	INNER JOIN DEPARTMENTS D USING(DEPARTMENT_ID)
	INNER JOIN LOCATIONS L USING(LOCATION_ID)
	WHERE L.CITY = 'Toronto'

--Question 6.
	SELECT E.DEPARTMENT_ID,
		   D.LAST_NAME AS EMPLOYEE,
		   E.LAST_NAME AS COLLEAGUE
	FROM EMPLOYEES E
	JOIN EMPLOYEES D ON(E.DEPARTMENT_ID = D.DEPARTMENT_ID)
	WHERE D.LAST_NAME <> E.LAST_NAME
	
--Question 7.
	SELECT E.LAST_NAME,
		   E.HIRE_DATE
	FROM EMPLOYEES E
	JOIN EMPLOYEES D ON(E.HIRE_DATE > D.HIRE_DATE)
	WHERE D.LAST_NAME = 'Davies'

--Question 8.
	SELECT E.LAST_NAME AS EMPLOYEE,
		   E.HIRE_DATE AS "Emp Hired",
		   D.LAST_NAME AS MANAGER,
		   D.HIRE_DATE AS "Mgr Hired"
	FROM EMPLOYEES E
	JOIN EMPLOYEES D ON(E.MANAGER_ID = D.EMPLOYEE_ID)
	WHERE D.HIRE_DATE > E.HIRE_DATE
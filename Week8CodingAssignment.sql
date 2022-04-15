-- Quesiton 1. I want to know how many employees with each title were born after 1965-01-01.

SELECT title AS 'Employee Title',
count(e.birth_date) AS 'Number Of Employees Born After 01-01-1965 In Each Employee Title'
FROM titles t
INNER JOIN employees e
ON e.emp_no = t.emp_no
WHERE birth_date >= '1965-01-01'
GROUP BY  title
;


-- Question 2 I want to know the average salary per title.
SELECT title AS 'Employee Title',
ROUND(AVG(s.salary))AS 'Average Salary Per Title' 
FROM Salaries s
INNER JOIN Titles t
ON s.emp_no = t.emp_no
GROUP BY title
;


-- Question 3 How much money was spent on salary for the marketing department between the years 1990 and 1992?
SELECT dept_name AS 'Department', sum(salary) AS 'Salary Spent From 1990 - 1992'
FROM departments d
INNER JOIN dept_emp de 
ON d.dept_no = de.dept_no
INNER JOIN salaries s
ON s.emp_no = de.emp_no
WHERE s.from_date > '1990-01-01' AND s.to_date <'1993-01-01'
GROUP BY dept_name
Having dept_name = 'Marketing'
;

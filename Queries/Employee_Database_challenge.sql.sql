--Employee_Database_challenge

--The Number of Retiring Employees by Title
--emp_no, first_name, and last_name from Employees table
--title, from_date, and to_date from Titles table

SELECT e.emp_no,
e.first_name,
e.last_name, 
ti.title,
ti.from_date,
ti.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN  titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

SELECT * FROM retirement_titles
DROP TABLE retirement_titles

-- Use Dictinct with Orderby to remove duplicate rows
SELECT e.emp_no,
e.first_name,
e.last_name, 
ti.title,
ti.from_date,
ti.to_date
FROM retirement_titles

SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name, 
rt.title
INTO unique_titles
FROM retirement_titles as rt
WHERE to_date= '9999-01-01'
ORDER BY rt.emp_no, to_date DESC;

SELECT * FROM unique_titles

--retrieve the number of titles from the Unique Titles table
SELECT COUNT(title), 
title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY COUNT DESC;

SELECT * FROM retiring_titles
DROP TABLE retiring_titles

--Mentorship Eligibility table that holds the employees who are eligible to participate in a mentorship program.
--emp_no, first_name, last_name and birth_date from Employees table
--from_date and to_date from Department Employee table
--title from Titles table

SELECT DISTINCT ON (e.emp_no) e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
ti.title
INTO mentorship_eligibilty
FROM employees AS e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (de.to_date = '9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;

SELECT * FROM mentorship_eligibilty
DROP TABLE mentorship_eligibilty
SELECT * FROM employees
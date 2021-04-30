-- Number of Retiring Employees by Title
-- Creating table of employees eligible for retirement with titles
SELECT	e.emp_no,
		e.first_name,
		e.last_name,
		te.title,
		te.from_date,
		te.to_date
INTO retirement_titles
FROM employees as e
	INNER JOIN titles as te
		ON (e.emp_no = te.emp_no)
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rte.emp_no)
		rte.emp_no,
		rte.first_name,
		rte.last_name,
		rte.title
INTO unique_titles
FROM retirement_titles as rte
ORDER BY rte.emp_no, rte.to_date DESC;

-- Number of employees by most recent job title who are to retire
SELECT COUNT(ut.title), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY COUNT(ut.title) DESC;


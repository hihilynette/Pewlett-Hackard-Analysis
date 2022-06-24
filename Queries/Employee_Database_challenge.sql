-- Deliverable 1
--  create a Retirement Titles table that holds all the titles of employees who were born between January 1, 1952 and December 31, 1955. 
SELECT e.emp_no,
	   e.first_name,
	   e.last_name,
	   t.title,
	   t.from_date,
	   t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no, 
	                rt.first_name,
					rt.last_name,
					rt.title
INTO unique_titles
FROM retirement_titles as rt
WHERE (rt.to_date = '9999-01-01')
ORDER BY rt.emp_no ASC, rt.to_date DESC;

-- To retrieve the number of employees by their most recent job title who are about to retire.
SELECT COUNT(ut.title), ut.title
-- INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY COUNT(ut.title) DESC;

-- Deliverable 2
-- create a Mentorship Eligibility table that holds the employees who are eligible to participate in a mentorship program
SELECT DISTINCT ON(e.emp_no) e.emp_no,
	   e.first_name,
	   e.last_name,
	   e.birth_date,
	   de.from_date,
	   de.to_date,
	   t.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no )
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no ASC, de.from_date DESC;

-- Deliverable 3
--  create a Retirement Titles table that holds all the titles of employees who were born between January 1, 1952 and December 31, 1957
SELECT e.emp_no,
	   e.first_name,
	   e.last_name,
	   t.title,
	   t.from_date,
	   t.to_date
INTO silver_tsunami
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1957-12-31')
ORDER BY e.emp_no
	  
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (st.emp_no) st.emp_no, 
	                st.first_name,
					st.last_name,
					st.title
INTO retiring_unique_titles
FROM silver_tsunami as st
WHERE (st.to_date = '9999-01-01')
ORDER BY st.emp_no ASC, st.to_date DESC;

-- titles count in an order
SELECT COUNT(ut.title), ut.title
-- INTO unique_titles_count
FROM retiring_unique_titles AS ut
GROUP BY ut.title
ORDER BY COUNT(ut.title) DESC;

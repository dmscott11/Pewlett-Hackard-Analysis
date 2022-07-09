-- Deliverable 1; Steps 1-7
select e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
--into retirement_titles
from employees as e
inner join titles as t
on (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
order by emp_no desc;

-- Deliverable 1; Steps 8-15
SELECT DISTINCT ON (emp_no), first_name, last_name, title
--INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no asc, to_date DESC;

--Deliverable 1; Steps 16-22
SELECT COUNT(emp_no), title
into retiring_titles
FROM unique_titles
GROUP BY title
order by count desc;

--Delieverable 2; Creating mentoship eligibility table
select distinct on (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date, t.title
into mentorship_eligibility
from employees as e
    inner join dept_emp as de
        on (e.emp_no = de.emp_no)
    inner join titles as t
        on (e.emp_no = t.emp_no)
where e.birth_date BETWEEN '1965-01-01' and '1965-12-31'
order by emp_no asc

--second query
select me.emp_no, me.title, s.salary
from mentorship_eligibility as me
    inner join salaries as s
        on (me.emp_no = s.emp_no)
group by titles

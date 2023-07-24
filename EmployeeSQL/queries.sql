-- List the employee number, last name, first name, sex, and salary of each employee.
select salaries.emp_no,salaries.salary,employees.first_name,employees.last_name,employees.sex
from employees
inner join salaries
on employees.emp_no = salaries.emp_no
order by emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986.
select first_name, last_name, hire_date
from employees
where hire_date >= '1986-01-01 00:00:00'
	and hire_date < '1987-01-01 00:00:00';

-- List the manager of each department along with their department number, department name, employee number,
--  last name, and first name.
select dept_manager.dept_no, dept_manager.emp_no, departments.dept_name, employees.first_name,
         employees.last_name
from employees
join dept_manager
on employees.emp_no = dept_manager.emp_no
join departments
on dept_manager.dept_no = departments.dept_no;
-- List the department number for each employee along with that employee’s employee number, 
-- last name, first name, and department name.
select departments.dept_no, departments.dept_name, employees.emp_no, employees.first_name,
        employees.last_name
from employees
join dept_emp
on employees.emp_no = dept_emp.emp_no
join departments
on dept_emp.dept_no = departments.dept_no;

-- List first name, last name, and sex of each employee whose first name is Hercules 
-- and whose last name begins with the letter B.
select first_name, last_name, sex
from employees
where first_name = 'Hercules'
and last_name like 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name.
select emp_no, first_name, last_name
from employees
where emp_no in
(
    select emp_no
    from dept_emp
    where dept_no in
    (
        select dept_no
        from departments
        where dept_name = 'Sales'   
    )   
);

-- List each employee in the Sales and Development departments, including their employee number,
--  last name, first name, and department name.
select employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
from employees
join dept_emp
on employees.emp_no = dept_emp.emp_no
join departments
on dept_emp.dept_no = departments.dept_no
where employees.emp_no in
(
    select emp_no
    from dept_emp
    where dept_no in
    (
        select dept_no
        from departments
        where dept_name in ('Sales','Development')   
    )   
);

-- List the frequency counts, in descending order, of all the employee last names
--  (that is, how many employees share each last name).
select last_name, count(last_name) as "last name count"
from employees
group by last_name
order by "last name count" desc;
--1. List the employee number, last name, first name, sex, and salary of each employee.
Select emp.emp_no, emp.last_name, emp.first_name, emp.sex, sla.salary
from "Employees" emp
join "Salaries" sla on emp.emp_no=sla.emp_no;

--2. List the first name, last name, and hire date for the employees who were hired in 1986.
Select emp.first_name, emp.last_name, emp.hire_date
from "Employees" emp
where emp.hire_date between '01/01/1986' and '12/31/1986';

--3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
Select  mngr.dept_no, dept.dept_name, mngr.emp_no, emp.last_name, emp.first_name
from "Employees" emp
join "Dept_Mngr" mngr on emp.emp_no=mngr.emp_no
join "Department" dept on dept.dept_no=mngr.dept_no;

--4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
Select dept.dept_no, emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
from "Dept_Emp" de
join "Department" dept on dept.dept_no=de.dept_no
join "Employees" emp on emp.emp_no=de.emp_no;

--5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
Select emp.first_name, emp.last_name, emp.sex 
from "Employees" emp
where emp.first_name = 'Hercules' and left (emp.last_name, 1)= 'B';

--6. List each employee in the Sales department, including their employee number, last name, and first name
Select emp.first_name, emp.last_name, emp.emp_no
from "Employees" emp
join "Dept_Emp" de on emp.emp_no=de.emp_no
join "Department" dept on de.dept_no=dept.dept_no
where dept.dept_name = 'Sales';

--7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
Select emp.emp_no, emp.first_name, emp.last_name, dept.dept_name
from "Employees" emp
join "Dept_Emp" de on emp.emp_no=de.emp_no
join "Department" dept on de.dept_no=dept.dept_no
where dept.dept_name = 'Sales' or dept.dept_name ='Development';

--8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
Select emp.last_name, count (emp.last_name)
from "Employees" emp
group by emp.last_name
order by count (emp.last_name) desc;

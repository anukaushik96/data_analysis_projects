use companydb;

# Print Details of all the Managers from the employee table

select distinct super_ssn from employee
where super_ssn is not null;

select ssn, fname, dno
from employee
where ssn in (
	select distinct super_ssn from employee
	where super_ssn is not null
);

# Print details of employees who are working on a project

select ssn, fname, lname
from employee
where ssn not in (
	select distinct essn from works_on
	where essn is not null
);

# Print max and min avg salaries across all departments

select min(salary), max(salary) 
from employee;

select min(avg_salary), max(avg_salary)
from (
	select dno, avg(salary) avg_salary
	from employee 
	group by dno
) as dept_avg;

# Print all employees who are earning more than the avg salary across all employees

select ssn, fname, salary
from employee
where salary > (
	select avg(salary) as avg_salary from employee
);

# Print Name, deparment and total hours that each has worked

select essn, sum(hours) as total_hours
from works_on 
group by essn;

with employee_hours as (
select essn, sum(hours) as total_hours
from works_on 
group by essn
), 

dno_avg_salary as (
select dno, avg(salary) as avg_salary
from employee
group by dno
)

select * from dno_avg_salary
inner join (
	select ssn, fname, dno, total_hours
	from employee
	inner join employee_hours
	on employee.ssn = employee_hours.essn
) as inner_query
on dno_avg_salary.dno = inner_query.dno;

select * from employee_hours;
use companydb;

# Print all employees which are earning more than their department average

select * from employee;

SELECT 
    ssn, fname, salary, dno
FROM
    employee AS outer_table
WHERE
    salary > (SELECT 
            AVG(salary)
        FROM
            employee
        WHERE
            dno = outer_table.dno
        GROUP BY dno);

select ssn, fname, lname, dno, super_ssn
from employee as outer_table
where exists (
	select 'X' from employee
    where ssn = outer_table.super_ssn
);

create view male_emp_view as (
	select * from employee
    where sex = 'M'
);

select avg(salary) from male_emp_view;

select * from male_emp_view
inner join department
on male_emp_view.dno = department.dnumber;

create view dept_sal_avg as (
	select dno, avg(salary) as avg_sal
	from employee
	group by dno
);

select * from employee
inner join dept_sal_avg
on employee.dno = dept_sal_avg.dno 
where employee.salary > dept_sal_avg.avg_sal;

SELECT 
    *
FROM
    employee
        INNER JOIN
    dept_sal_avg ON employee.dno = dept_sal_avg.dno
        AND employee.salary > dept_sal_avg.avg_sal;
        
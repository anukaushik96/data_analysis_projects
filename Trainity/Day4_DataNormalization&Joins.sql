use companydb;


# Use of Alias

select sum(salary) as Total_Salary from employee;

select sum(salary) as Total_Salary, dno as Department_Number from employee
group by dno;

# Inner Join

select * from employee;

select * from works_on;

select * from works_on
inner join employee
on works_on.essn = employee.ssn;

select * from department;

select fname, lname, dname from employee
right join
department on employee.dno = department.dnumber;

# Cross Join

select * from department;

select * from project;

select * from project
cross join department;

# Inner Join and filtering

select * from employee
inner join department
on employee.dno = department.dnumber and salary > 40000;

select fname, hours, pno
from works_on
inner join employee
on works_on.essn = employee.ssn
where pno > 15;

select * from employee as left_table
inner join employee as right_table
on left_table.super_ssn = right_table.ssn;


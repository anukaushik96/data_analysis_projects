# count function

use companydb;

select * from employee;

select count(*) from employee;

select count(*) - count(super_ssn) as Count_Null_Super_SSN from employee;

select * from employee
where super_ssn is null;

select sum(salary) from employee;

select sum(salary) from employee
where sex = 'F';

select min(salary) as min_salary, max(salary) as max_salary
from employee
where sex = 'M';

select sum(salary)/count(salary) as avg_salary
from employee;

select max(salary), avg(salary) from employee;

select sex, avg(salary) as avg_salary
from employee
group by sex;

select * from works_on;

select essn, sum(hours)
from works_on
group by essn;

# Calculate avg salary for male employee for each department.

select dno, sex, avg(salary)
from employee where sex = 'M'
group by dno;

# FROM -> WHERE -> GROUP BY -> SELECT -> ORDER BY

select dno, sex, avg(salary) as avg_salary
from employee where sex = 'M'
group by dno
order by avg_salary desc;

# Calculate avg salary for each deparmtent and gender

select dno, sex, avg(salary)
from employee
group by dno, sex;

# Print all the unique manager ids

select distinct super_ssn from employee;

select distinct sex, super_ssn from employee;

select count(distinct super_ssn) from employee;

# Calculate avg salary of deparmnents with average more than 32000;

# FROM -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY

select dno, avg(salary) as avg_salary
from employee
group by dno
having avg_salary > 32000;

select * from employee;

select count(*), extract(year from bdate) as year_of_birth,
	extract(month from bdate) as month_of_birth
from employee
group by year_of_birth;

select avg(salary) from employee;

select ssn, salary,
	case
		when salary < 35125
			then "Less"
		when salary = 35125
			then "Equal"
		else "More"
	end as pay_scale
from employee;


# Extras
select * from employee;

select count(*), course_id
from course
group by course_id;

select extract(year from bdate) as _year, extract(month from bdate) as _month
from employee
order by _year, _month;
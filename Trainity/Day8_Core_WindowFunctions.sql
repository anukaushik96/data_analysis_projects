# Window Functions

use companydb;

SELECT 
    AVG(salary) AS avg_sal, SUM(salary) AS sum_sal
FROM
    employee;

select 
	avg(salary) over() as avg_sal,
	sum(salary) over() as sum_sal
from
	employee;

with dept_avg as (
SELECT 
    dno, AVG(salary) AS avg_sal
FROM
    employee
GROUP BY dno
)

select * from employee
inner join dept_avg
on employee.dno = dept_avg.dno;

select
	ssn, salary, dno, sex,
    avg(salary) over(partition by dno) as avg_sal,
    sum(salary) over(partition by sex) as sum_sal
from 
	employee;

# Count number of employees in each department

select 
	ssn, dno, sex,
    count(ssn) over(partition by dno, sex) as total_emp
from
	employee;

select 
	ssn, salary, sex,
    rank() over(order by salary desc) as sal_rank,
    rank() over(partition by sex order by salary desc) as sex_sal_rank
from
	employee;

select 
	ssn, salary, sex,
    dense_rank() over(partition by sex order by salary) as sal_rank
from
	employee;

select
	ssn, salary, sex,
    row_number() over(partition by sex order by salary) as row_num
from employee;

create VIEW temp_table as (
	select
	ssn, salary, sex,
    row_number() over(partition by sex order by salary) as row_num
	from employee
);

select row_number() over() as row_num
from employee;

select salary, rank() over(order by salary) as rank_sal,
	dense_rank() over(order by salary asc, sex desc) as den_rank_sal
from employee;

select avg(salary) over() as over_avg,
	avg(salary) over(partition by dno) as dpt_avg
from employee;


use companydb;

select ssn, dno, salary, salary - lag(salary, 1) over(partition by dno order by salary) as sal_diff
from employee;

select ssn, salary, round(percent_rank() over(order by salary), 2) as perc
from employee;
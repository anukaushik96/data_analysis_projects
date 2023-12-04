use companydb;

select left("MK-001", 2) as dept_id;

select address, left(address, 2) as temp
from employee;

select right("MK-001", 3) as em_id;

select address, right(address, 2) as state_code
from employee;

SELECT 
    address,
    SUBSTR(address, 2, 5) AS substring_,
    SUBSTR(address FROM 2 FOR 5) AS sub_2
FROM
    employee;
    
select * from employee;

select fname, lname, concat(fname, " ", lname) as full_name
from employee;

select cast("1965-01-10" as date);

select * from employee;

select address, position("on" in address) as h_pos
from employee;

select coalesce(null, null, null);
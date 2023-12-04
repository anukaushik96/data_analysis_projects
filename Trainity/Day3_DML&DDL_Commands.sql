use companydb;

SELECT 
    fname, lname
FROM
    employee;

SELECT 
    *
FROM
    employee;

SELECT 
    fname, lname, sex
FROM
    employee
WHERE
    sex = 'M';

SELECT * FROM employee
WHERE salary > 35000;

SELECT * FROM employee
WHERE salary > 35000 AND salary <45000;

SELECT * FROM employee
WHERE salary <35000 OR salary >45000;

SELECT * FROM employee
where sex = 'M' AND salary BETWEEN 30000 AND 40000;

SELECT * FROM employee
where salary = 30000 OR salary = 40000;

SELECT * FROM employee 
WHERE salary NOT IN (30000, 40000);

SELECT * FROM employee
WHERE NOT salary = 30000 AND salary <>40000;




SELECT 
    fname
FROM
    employee
WHERE
    fname LIKE 'a%' OR fname LIKE 'e%'
        OR fname LIKE 'i%';

SELECT 
    fname, lname, dno, sex
FROM
    employee
WHERE
    sex = 'M' AND dno = 5;

SELECT 
    fname, lname, dno, sex
FROM
    employee
WHERE
    sex = 'M' OR dno = 5;

SELECT 
    *
FROM
    employee
WHERE
    salary >= 30000 AND sex <> 'M';

SELECT 
    fname, lname
FROM
    employee
WHERE
    fname LIKE 'J___';

SELECT 
    fname, address
FROM
    employee
WHERE
    address LIKE '%Houston%';

SELECT 
    fname, ssn, salary
FROM
    employee
WHERE
    salary BETWEEN 20000 AND 40000;

SELECT 
    pname, plocation
FROM
    project
WHERE
    plocation = 'Houston'
        OR plocation = 'Stafford'
        OR plocation = 'Bellaire';

SELECT 
    pname, plocation
FROM
    project
WHERE
    plocation IN ('Houston' , 'Stafford', 'Bellaire');
    
SELECT 
    pname, plocation
FROM
    project
WHERE
    plocation NOT IN ('Houston' , 'Stafford');


SELECT 
    fname, super_ssn
FROM
    employee;

SELECT 
    fname, ssn
FROM
    employee
WHERE
    super_ssn IS NULL;

SELECT 
    fname, ssn
FROM
    employee
WHERE
    super_ssn IS NOT NULL;

SELECT 
    fname, salary
FROM
    employee
ORDER BY salary DESC;

SELECT 
    fname, salary
FROM
    employee
WHERE
    sex = 'M'
ORDER BY salary DESC;


# update query
SET SQL_SAFE_UPDATES = 0;

UPDATE employee 
SET 
    super_ssn = '333445555'
WHERE
    super_ssn IS NULL;

SELECT 
    *
FROM
    employee;

DELETE FROM employee 
WHERE
    super_ssn = '333445555';




































CREATE DATABASE project3;
USE project3;
SHOW databases;
CREATE TABLE job_data (
    ds VARCHAR(50),
    job_id INT,
    actor_id INT,
    `event` VARCHAR(50),
    `language` VARCHAR(50),
    time_spent INT,
    org VARCHAR(50)
);
INSERT INTO job_data(ds, job_id ,actor_id ,`event` ,`language` ,time_spent ,org)
VALUES ('44165','21','1001','skip','English','15','A'),
('44165','22','1006','transfer','Arabic','25','B'),
('44164','23','1003','decision','Persian','20','C'),
('44163','23','1005','transfer','Persian','22','D'),
('44163','25','1002','decision','Hindi','11','B'),
('44162','11','1007','decision','French','104','D'),
('44161','23','1004','skip','Persian','56','A'),
('44160','20','1003','transfer','Italian','45','C'),
('44136','11','1004','decision','Hindi','36','A'),
('44144','35','1041','skip','French','42','B'),
('44151','1','1030','transfer','Persian','17','C'),
('44144','11','1008','decision','Italian','82','D'),
('44139','43','1003','skip','Hindi','92','B'),
('44164','29','1004','transfer','French','25','D'),
('44145','6','1009','decision','Persian','84','A'),
('44156','33','1007','skip','Italian','89','C'),
('44160','14','1009','transfer','Hindi','110','A'),
('44161','36','1043','decision','French','74','B'),
('44140','8','1058','skip','Persian','59','C'),
('44153','40','1024','transfer','Italian','55','D'),
('44147','29','1053','decision','Hindi','40','B'),
('44158','49','1019','skip','French','105','D'),
('44151','46','1052','transfer','Persian','44','A'),
('44155','14','1028','decision','Italian','44','C'),
('44141','32','1017','skip','Hindi','74','A'),
('44151','24','1045','transfer','French','89','B'),
('44159','50','1033','decision','Persian','95','C'),
('44155','16','1046','skip','Italian','86','D'),
('44152','23','1025','decision','English','51','B'),
('44154','20','1030','skip','Arabic','37','D'),
('44136','32','1024','decision','Persian','104','C'),
('44161','44','1023','skip','Persian','55','D'),
('44144','26','1036','skip','Hindi','46','B'),
('44159','41','1026','skip','French','90','D'),
('44152','22','1012','decision','Persian','93','A'),
('44165','39','1003','decision','English','77','C'),
('44136','16','1057','decision','Arabic','81','D'),
('44162','11','1045','skip','Persian','100','A'),
('44139','17','1010','decision','English','47','C'),
('44156','35','1012','transfer','Arabic','85','B'),
('44154','21','1058','decision','Persian','80','D'),
('44136','18','1039','transfer','English','14','A'),
('44164','36','1035','decision','Arabic','20','C'),
('44156','39','1009','transfer','Persian','56','A'),
('44156','33','1009','decision','English','41','C'),
('44140','10','1001','transfer','Arabic','67','C'),
('44151','38','1015','decision','Persian','14','A'),
('44156','31','1020','transfer','English','79','C'),
('44152','22','1055','decision','Arabic','77','C'),
('44156','31','1020','transfer','English','79','C'),
('44152','22','1055','decision','Arabic','77','C');



#Jobs reviewed per hour for each day

SELECT 
    ds,
    ROUND((COUNT(job_id) / SUM(time_spent)) * 60 * 60,
            2) AS TOTAL_TIME_EACH_DAY
FROM
    job_data
GROUP BY ds
ORDER BY ds
;

#THROUGHPUT ANALYSIS
#7-day rolling average of throughput (number of events per second)

WITH AVG_EVENTS AS
				(SELECT ds, COUNT(`event`)/SUM(time_spent) AS per_sec_event
FROM job_data
GROUP BY ds)
SELECT ds, ROUND(AVG(per_sec_event)OVER( ROWS BETWEEN 6 preceding AND current ROW),2)
AS Rolling_AVG_7_days
FROM AVG_EVENTS;


#Language Share Analysis

WITH t AS( 
			SELECT COUNT(*) AS Total_records
            FROM job_data)
SELECT language, ROUND((COUNT(language)*100)/ Total_records, 2)
AS Language_Share
FROM t, job_data
GROUP by Language, total_records;

SELECT language, ROUND((COUNT(language)*100)/(SELECT COUNT(*) FROM job_data),2)
AS Langauge_share 
FROM job_data
GROUP BY language;


#Duplicate Rows detection

SELECT ds, job_id ,actor_id ,`event` ,`language` ,time_spent ,org, COUNT(1)
FROM job_data
GROUP BY ds, job_id ,actor_id ,`event` ,`language` ,time_spent ,org
HAVING COUNT(1)> 1;


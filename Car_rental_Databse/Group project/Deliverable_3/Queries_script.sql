
--Student name: Alexander Gutkovsky, Zahra Mirzaei, Enes Karaaslan

USE CAR2GO
GO


/* Create a script file. List at least 10 reasonable query statements (as comments)
in English. Add SQL statements to execute these queries and get the results. At
least 5 queries among the 10 should be complex queries using system functions,
aggregate functions, group by clause, and order by clause. Save this script file as
“Queries script.sql”.
*/

---1--POPULAR CLASS
SELECT COUNT(REQUESTED_CAR_CLASS) AS POPULAR_CAR_CLASS, requested_car_class FROM RENT GROUP BY requested_car_class ORDER BY POPULAR_CAR_CLASS DESC;

---2--HOW MANY DAYS EACH CAR WAS RESERVED
SELECT TOTAL_DAYS, CONCAT(YEAR,' ', MAKE,' ',MODEL) AS CAR FROM RESERVATION R, RENT, CAR C WHERE RENT.rent_id=R.rent_id AND rent.PLATE=C.PLATE ORDER BY TOTAL_DAYS;

---3--ALL PROMO DISCAUNT RATE INCREASE AT 0.05 FOR PERIOD IS 1 MONTH
UPDATE PROMOTION SET DISCOUNT=DISCOUNT+0.05 WHERE (DATEDIFF(DAY, st_date, lt_date))<=31;

---4--WHAT CUSTOMER(NAME) DROP THE CAR IN DIFF LOCATION
SELECT f_name, l_name FROM RENT R, LOCATION_RENT L, CUSTOMER C WHERE R.RENT_ID=L.RENT_ID AND C.driving_license_no=R.driving_license_no AND L.location_final!=L.location_start;

---5-- LONGEST DISTANCE DRIVEN 
SELECT MAX(final_odo-int_odo) AS LONGEST_DISTANCE_TAKEN  FROM RENT;

---6-- SHOW CAR INFO WITH COLOR WHITE
SELECT * FROM CAR WHERE COLOR='WHITE';

---7--UPDATE 
select total_days, avg(price )from RESERVATION group by total_days having avg(price)>=300 order by AVG(price)desc;


---8--ADDING A NEW COLUMN TO CUSTOMER TABLE AND REMOVING AFTER
ALTER TABLE CUSTOMER ADD AGE INT CONSTRAINT CK_AGE CHECK(AGE>=16);
ALTER TABLE CUSTOMER DROP CONSTRAINT CK_AGE, COLUMN AGE;
SELECT * FROM CUSTOMER;


---9--REMOVE A CAR FROM THE LIST DUE TO CRASH
DELETE FROM CAR WHERE PLATE='D45GFD';

--10--STREET_NAME VARCHAR(30) 
ALTER TABLE LOCATION ALTER COLUMN STREET_NAME VARCHAR(60);


-- Description:

--     SQL QUERIES

-- Keep in mind there is usually more than one way to answer these questions. 

-- These questions start off with the basics and then get continually more difficult.

--     1.How can you retrieve all the information from the cd.facilities table?
--Ans:
SELECT * FROM cd.facilities;

--2.You want to print out a list of all of the facilities and their cost to members. 
--How would you retrieve a list of only facility names and costs?
--Ans:
SELECT name, membercost FROM cd.facilities; 


--3.How can you produce a list of facilities that charge a fee to members?
--Ans:
SELECT * FROM cd.facilities;
SELECT * FROM cd.facilities
WHERE membercost > 0;


--4.How can you produce a list of facilities that charge a fee to members,
--and that fee is less than 1/50th of the monthly maintenance cost?
--Return the facid, facility name, member cost, and monthly maintenance of the facilities in question.
--Ans:
SELECT facid,  name, membercost, monthlymaintenance FROM cd.facilities
WHERE membercost > 0 AND membercost < ( monthlymaintenance /50) ;
--OR
SELECT facid, name, membercost, monthlymaintenance
FROM cd.facilities
WHERE membercost > 0 AND (membercost < 0.02 * monthlymaintenance);

--5. How can you produce a list of all facilities with the word 'Tennis' in their name?
--Ans:
SELECT * FROM cd.facilities
WHERE name ILIKE '%TENNIS%';
--OR
SELECT *
FROM cd.facilities
WHERE name ~ 'Tennis';


--6. How can you retrieve the details of facilities with ID 1 and 5?
--Try to do it without using the OR operator.
--Ans:
SELECT * FROM cd.facilities
WHERE facid IN (1,5);

--7. How can you produce a list of members who joined after the start of September 2012?
--Return the memid, surname, firstname, and joindate of the members in question.
--Ans:
SELECT * FROM cd.members;
SELECT  memid, surname, firstname, joindate FROM cd.members
WHERE joindate >= '2012-09-01 00:00:00';

--8.How can you produce an ordered list of thefirst 10 surnames in the members table?
--The list must not contain duplicates.
--Ans:
SELECT Distinct surname  FROM cd.members
ORDER BY surname ASC LIMIT 10;

--9.You'd like to get the signup date of your last member. 
--How can you retrieve this information? 
--Ans:
SELECT MAX(joindate)  FROM cd.members;
--OR
SELECT joindate  FROM cd.members
ORDER BY joindate DESC  LIMIT 1;

--10.Produce a count of the number of facilities that have a cost to guests of 10 or more. 
--Ans:
SELECT * FROM cd.facilities;
SELECT COUNT(*) FROM cd.facilities
WHERE guestcost>=10;

--11. Produce a list of the total number of slots booked per facility in the month of September 2012.
--Produce an output table consisting of facility id and slots, sorted by the number of slots.
--Ans:
SELECT * FROM cd.bookings;
SELECT facid, SUM (slots) as TotalNumberofSlots FROM cd.bookings
WHERE to_char(bookings.starttime , 'MM') = '09' AND to_char(starttime , 'YYYY') = '2012'
GROUP BY facid
ORDER BY SUM(slots);
--OR
SELECT facid, SUM(slots) AS totalnumberofslots FROM cd.bookings
WHERE cd.bookings.starttime BETWEEN '2012-09-01' AND '2012-09-30'
GROUP BY facid
ORDER BY SUM(slots);

--12. Produce a list of facilities with more than 1000 slots booked. 
--Produce an output table consisting of facility id and total slots, sorted by facility id.
--Ans:
SELECT * FROM cd.bookings;
SELECT facid, SUM(slots) FROM cd.bookings
GROUP BY facid
HAVING SUM(slots)>1000
ORDER BY facid;

--13. How can you produce a list of the start times for bookings for tennis courts,
--for the date '2012-09-21'? Return a list of start time and facility name pairings, 
--ordered by the time.
--Ans:
SELECT * FROM cd.facilities;
SELECT starttime , cd.facilities.name FROM cd.bookings
INNER JOIN cd.facilities
ON cd.facilities.facid = cd.bookings.facid
WHERE name ILIKE '%tennis%' AND starttime BETWEEN '2012-09-21' AND '2012-09-22'
ORDER BY starttime; 

--14. How can you produce a list of the start times for bookings by members named 'David Farrell'?
--Ans:
SELECT starttime FROM cd.bookings 
INNER JOIN cd.members 
ON bookings.memid = members.memid
WHERE firstname ILIKE '%DAVID%' AND surname  ILIKE '%Farrell%';

 
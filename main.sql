--Script for Building the Test Table
IF OBJECT_ID('CheckWrite') IS NOT NULL
DROP TABLE CheckWrite;
GO

CREATE TABLE CheckWrite(
   empID INT
   , empName VARCHAR(50)
   , directions VARCHAR(MAX)
   );
GO


INSERT INTO CheckWrite
VALUES 
(101, 'Daisy', 'North on Pike, South on Lee'),
(102, 'Brianna', 'North on Pike, South on Lee'),
(103, 'Sethu', 'North on Pike, South on Lee'),
(104, 'Crystal', 'North on Pike, South on Lee')
;
GO

--Basic Syntax:

--STUFF(string, start, length, replaceWith)

SELECT STUFF('Hello World', 7, 5, 'Everyone');


UPDATE CheckWrite
SET directions = STUFF(directions, 16, 5, 'East') 
WHERE empID = 101;
GO


SELECT * FROM CheckWrite;
GO

-- we will replace each instance of 'T' with a lowercase 'q'.
SELECT REPLACE('SQL Tutorial', 'T', 'Q');


-- we replace the upper and lower case "T" with the lower case "q" in the SQL query below.
SELECT REPLACE('SQL tutorial', 't', 'q');

-- you can replace an entire string using the REPLACE() function with this SELECT statement.
SELECT REPLACE('SQL Tutorial', 'SQL Tutorial', 'MSSQLTIPS Article');


UPDATE CheckWrite
SET directions .WRITE('left', 15, 5)
WHERE empID = 101;
GO

SELECT * FROM CheckWrite;
GO

/**
The .WRITE() function is a little different from the STUFF() and REPLACE() functions. It still places a new string value in a table, but it has a few idiosyncrasies:

Unlike STUFF(), the .WRITE() function only works when a column's data type size is specified as MAX.
The .WRITE() function is zero-based. (more on this later)
The .WRITE() function must be proceeded with a decimal point in the name [.WRITE()].

So, why would I use the SQL .WRITE() function when the STUFF() function performs similarly, only without the MAX restriction? In a nutshell, while there is little or no performance difference in small examples like this article, 
the .WRITE() function will work on large amounts of string values, where the STUFF() function will not.
**/
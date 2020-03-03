    USE Bartech
go
SELECT * FROM [dbo].[Agri Labor Req IDs]
SELECT * FROM [dbo].[Agri Labor Reqs]
SELECT * FROM [dbo].[Dim_MasterDateDim]

SELECT * FROM [dbo].[Ends]
SELECT * FROM [dbo].[Headcount (Full Mth)]


SELECT * FROM [dbo].[Headcount (Full Qtr)]
SELECT * FROM [dbo].[Headcount (QtrEnd)]


SELECT * FROM [dbo].[OLE DB Destination]
SELECT * FROM [dbo].[Renewals]
SELECT * FROM [dbo].[Req Activity]
SELECT * FROM [dbo].[Resumes]
SELECT * FROM [dbo].[Shortlisting Order]
SELECT * FROM [dbo].[Spend]worker
SELECT * FROM [dbo].[Submitted Interviewed Hired]
SELECT * FROM [dbo].[Submitted Inteviewed Hired WOs]
SELECT * FROM [dbo].[Timing]
SELECT * FROM [dbo].[Worker_Details]
select * from [dbo].[vw_ReqA]
select * from [dbo].[vw_Spent]

-select * from  [dbo].[vw_HeadCount_FullMth]
select * from  [dbo].[Ends]
select * from [dbo].[Worker_Details] 
where [Payrolled/Recruited] is null                  --6756 rows with Payrolled/Recruited Null--



SELECT  *   
 from [dbo].[Ends] a
 full outer join[dbo].[Worker_Details] b
 on a.[Security ID] = b.[Security ID]


SELECT  *   
from [dbo].[Ends] a
 Inner join[dbo].[Worker_Details] b
on a.[Security ID] = b.[Security ID]


-- Security ID Duplicate End tbl
SELECT [Security ID], COUNT([Security ID]) as Cnt
 FROM [dbo].[Ends]
 GROUP BY [Security ID]
 HAVING COUNT([Security ID]) > 1                  --(899 duplicate rows affected) Duplicate are there because one contractor can change role multiple time keeping the same-- Security ID
                                                  --( 6765 unique)
                                    
                                   
--Security ID Duplicate Worker tbl

SELECT [Security ID], Count ([Security ID]) as cnt
FROM [dbo].[Worker_Details]                      --(4106 rows with duplicates)-- Duplicates are there because one contractor can change role multiple time keeping the same-- Security ID
		                                         -- 19874 Rows no duplicates)
                                               
GROUP BY [Security ID]
Having Count([Security ID]) >1
-------------------------------------------------------
-- Work order ID Duplicate Ends tbl--
SELECT [Work Order ID], COUNT([Work Order ID])
FROM [dbo].[Ends]
GROUP BY [Work Order ID]                          -- 112 row duplicate--
HAVING Count([Work Order ID]) > 1                 -- 23868 Unique --
--Work order duplicate Worker tbl
SELECT [Work Order ID], COUNT([Work Order ID])
FROM [dbo].[Worker_Details]
GROUP BY [Work Order ID]                           -- no Duplicates
HAVING Count([Work Order ID]) > 1
----------------------------------------------------
--Worker ID Duplicate-- End tbl--

SELECT [Worker ID], COUNT([Worker ID])
FROM [dbo].[Ends]
GROUP BY [Worker ID]                               --112 row duplicate--
HAVING Count([Work Order ID]) > 1                  -- 23868 Unique --

-- Worker ID Duplicate--Workertbl
SELECT [Contractor ID], COUNT([Contractor ID])
FROM  [dbo].[Worker_Details]
GROUP BY [Contractor ID]                           --No duplicate--
HAVING Count([Contractor ID]) > 1

-------------------------------------------------------------


SELECT DISTINCT COLUMN_NAME,Table_Name 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE COLUMN_NAME LIKE '%SECURITY ID%'
AND Table_Name NOT LIKE 'vw%'

--Checking for duplicates and the relationship between the two tables--
--test 1
--Worker : Matsiori, Georgia--

SELECT * FROM [dbo].[Ends]
WHERE  [Security ID] = '01010063MATG'


SELECT * FROM [dbo].[Worker_Details]
WHERE [Security ID] = '01010063MATG'

--------------------------------------------------------
SELECT * FROM [dbo].[Ends]
WHERE  [Work Order ID] = 'MON1WO00014831'


SELECT * FROM [dbo].[Worker_Details]
WHERE [Work Order ID] = 'MON1WO00014831'
----------------------------------------------------------
SELECT * FROM [dbo].[Ends]
WHERE [Worker ID] = 'MON1WK00011806'

SELECT * FROM [dbo].[Worker_Details]
WHERE [Contractor ID] = 'MON1WK00011806'


--Test 2--
--Worker : Bobba, Bhavana

SELECT * FROM [dbo].[Ends]
WHERE  [Security ID] = '04068431BOBB'
                                                        ---  WORKER Has one Security ID and two Work order IDs and two Worker IDs ---
														---  After he switch position he gets assigned another Workd order ID and worker ID based on the new role but keeps the same Security ID--
														--- reason why we have duplicates. THE first role ends with a date and the new role starts with another date--

SELECT * FROM [dbo].[Worker_Details]
WHERE [Security ID] = '04068431BOBB'

--------------------------------------------------------
SELECT * FROM [dbo].[Ends]
WHERE  [Work Order ID] = 'MON1WO00003280'


SELECT * FROM [dbo].[Worker_Details]
WHERE [Work Order ID] = 'MON1WO00003280'
----------------------------------------------------------
SELECT * FROM [dbo].[Ends]
WHERE [Worker ID] = 'MON1WK00001140'

SELECT * FROM [dbo].[Worker_Details]
WHERE [Contractor ID] = 'MON1WK00001140'
 --SELECT *
 --FROM [dbo].[Worker_Details]
 --WHERE [Security ID] = '01010063MATG'

 SELECT DISTINCT  [Payrolled/Recruited] FROM [dbo].[Worker_Details]

 SELECT DISTINCT [Category]  FROM [dbo].[Worker_Details]

 SELECT DISTINCT [Template Title]  from  [dbo].[Worker_Details]

 SELECT DISTINCT [Subdivision]  from  [dbo].[Worker_Details]

 SELECT DISTINCT  [Contractor Type] from  [dbo].[Worker_Details]

 SELECT [Payrolled/Recruited], [Worker Type], [Current Bill Rate (ST/Hr)],[Current Bill Rate (OT/Hr)],[Current Bill Rate (DT/Hr)]
 FROM [dbo].[Worker_Details]
 --WHERE [Payrolled/Recruited] <> '%Null%'

 SELECT DISTINCT  [Worker Type] from  [dbo].[Ends]

 
 
 SELECT [Security ID], DAY([Month]) FROM [dbo].[Ends]

 SELECT  day([Month]) from [dbo].[Ends]


-----------------------------------------------------------------------------------------
select * from [dbo].[vw_Ends]
Select * from [dbo].[vw_Worker]

USE [BakiMealPrep]
GO

--1
SELECT RegionalBranchName, PurchaseDate, [Total Item Purchase] = SUM(MealStock)
FROM RegionalBranch rb
JOIN PurchaseTransaction pt ON pt.RegionalBranchID = rb.RegionalBranchID
JOIN PurchaseDetail pd ON pd.PurchaseID = pt.PurchaseID
JOIN MealPrep mp ON mp.MealID = pd.MealID
WHERE DAY(PurchaseDate) < 20 AND RegionalBranchName LIKE '%Tangerang%'
GROUP BY  RegionalBranchName, PurchaseDate

--2
SELECT StaffName, [SalesDate] = CONVERT(VARCHAR,SalesDate,106), [Total Sales] = SUM(SalesQty)
FROM MsStaff ms
JOIN SalesTransaction st ON st.StaffID = ms.StaffID
JOIN SalesDetail sd ON sd.SalesID =  st.SalesID
WHERE StaffSalary < 5000000 AND DATENAME(MONTH,SalesDate) IN ('October', 'November')
GROUP BY StaffName, SalesDate

--3
SELECT ms.StaffName, [Average Purchase Quantity] = AVG(PurchaseQty), [Total Meal Supplied] = CONCAT(SUM(PurchaseQty), ' Meal')
FROM MsStaff ms
JOIN PurchaseTransaction pt ON pt.StaffID = ms.StaffID
JOIN PurchaseDetail pd ON pd.PurchaseID = pt.PurchaseID
JOIN MealPrep mp ON mp.MealId = pd.MealID
WHERE pd.PurchaseID IN (
    SELECT pd.PurchaseID
    FROM PurchaseDetail pd 
    GROUP BY PurchaseID
    HAVING SUM(PurchaseQty) < 8
)  AND StaffGender = 'Female'
GROUP BY ms.StaffName

--4
SELECT RegionalBranchName,
	[Total Purchase] = AVG(pd.PurchaseQty),
	[Average Purchase Price] = CONCAT('Rp. ', AVG(mp.PurchasePrice))
FROM RegionalBranch rb
JOIN PurchaseTransaction pt ON rb.RegionalBranchID = pt.RegionalBranchID
JOIN PurchaseDetail pd ON pt.PurchaseID = pd.PurchaseID
JOIN MealPrep mp ON pd.MealID = mp.MealID
WHERE LEN(rb.RegionalBranchName) > 15
AND rb.RegionalBranchName LIKE '% % %'
GROUP BY RegionalBranchName

--5
SELECT RegionalBranchName,
	[BranchPhone] = CONCAT(REPLACE(SUBSTRING(RegionalBranchPhone,1,1),'0', '+62' )
	, SUBSTRING(RegionalBranchPhone,2,12) ),
	pt.PurchaseDate,
	ms.StaffName,
	[Quantity] = CONCAT(pd.PurchaseQty,' pcs')
FROM RegionalBranch rb
JOIN PurchaseTransaction pt ON rb.RegionalBranchID = pt.RegionalBranchID
JOIN MsStaff ms ON pt.StaffID = ms.StaffID
JOIN PurchaseDetail pd ON pt.PurchaseID = pd.PurchaseID,(
SELECT [AVGQTY] = AVG(PurchaseQty), PurchaseID
FROM PurchaseDetail
GROUP BY PurchaseID
) avgqtypurchase
WHERE pd.PurchaseQty > avgqtypurchase.AVGQTY
AND MONTH(PurchaseDate) IN (9,12)
GROUP BY RegionalBranchName, CONCAT(REPLACE(SUBSTRING(RegionalBranchPhone,1,1),'0', '+62' ), SUBSTRING(RegionalBranchPhone,2,12) ), pt.PurchaseDate, ms.StaffName, CONCAT(pd.PurchaseQty,' pcs')

--6
SELECT [CustomerID] = 'Customer ' + REVERSE(SUBSTRING(REVERSE(mc.CustomerID),1,3)), [Handle By] = 'Staff ' + SUBSTRING((ms.StaffID),5,5), [Total Meal Prep Sales Price] = CONCAT('Rp. ',SUM(mp.SalesPrice)), mp.MealName, SalesQty
FROM MsCustomer mc
JOIN SalesTransaction st ON st.CustomerID = mc.CustomerID
JOIN MsStaff ms ON ms.StaffID = st.StaffID
JOIN SalesDetail sd ON sd.SalesId = st.SalesID
JOIN MealPrep mp ON mp.MealID = sd.MealId,
(
	SELECT [MaxSales] = MAX(mp.SalesPrice)
	FROM MealPrep mp
) x
WHERE SalesQty > 2 AND SalesPrice >= x.MaxSales
GROUP BY mc.CustomerID, ms.StaffID, MealName, SalesQty

--7
SELECT [Last Name] = RIGHT(ms.StaffName,CHARINDEX(' ',REVERSE(ms.StaffName))), [Total Purchase] = SUM(PurchasePrice), StaffSalary
FROM MsStaff ms
JOIN SalesTransaction st ON st.StaffID = ms.StaffID
JOIN SalesDetail sd ON sd.SalesId = st.SalesID
JOIN MealPrep mp ON mp.MealID = sd.MealId,
(
	SELECT [AVGStaffSalary] = AVG(ms.StaffSalary)
	FROM MsStaff ms
) x
WHERE StaffGender = 'Female' AND ms.StaffSalary < x.AVGStaffSalary
GROUP BY StaffName, StaffSalary

--8
SELECT [Staff Initial] = CONCAT(LEFT(StaffName,1),RIGHT(UPPER(StaffName),1)), st.CustomerID, [Total Sales] = SUM(mp.PurchasePrice),SalesDate
FROM MsStaff ms
JOIN SalesTransaction st ON st.StaffID = ms.StaffID
JOIN SalesDetail sd ON sd.SalesId = st.SalesID
JOIN MealPrep mp ON sd.MealId = mp.MealID,
(
SELECT [MinSalesQty] = MIN(sd.SalesQty)
FROM SalesDetail sd
) x
WHERE MONTH(SalesDate) = 9 AND sd.SalesQty = x.MinSalesQty
GROUP BY StaffName,CustomerID,SalesDate

GO
--9
CREATE VIEW ViewPurchaseTransaction
AS
SELECT StaffEmail, PurchaseDate,
	[Total Purchase Meal Prep] = SUM(PurchasePrice),
	[Total Purchase Transaction] = SUM(PurchaseQty)
FROM MsStaff ms
JOIN PurchaseTransaction pt ON ms.StaffID = pt.StaffID
JOIN PurchaseDetail pd ON pt.PurchaseID = pd.PurchaseID
JOIN MealPrep mp ON pd.MealID = mp.MealID
WHERE StaffEmail LIKE '%@gmail%'
OR StaffEmail LIKE '%@hotmail%'
AND PurchaseQty > 50
GROUP BY StaffEmail, PurchaseDate

GO
--10
CREATE VIEW ViewSalesTransaction
AS
SELECT StaffName, 
	[Sales Date] = CONVERT(varchar, SalesDate, 107),
	[Total Sales Transaction] = SUM(SalesPrice),
	[Total Sales Quantity] = SUM(SalesQty)
FROM MsStaff ms
JOIN SalesTransaction st ON ms.StaffID = st.StaffID
JOIN SalesDetail sd ON st.SalesID = sd.SalesId
JOIN MealPrep mp ON sd.MealId = mp.MealID
WHERE SalesPrice < 450000
GROUP BY StaffName, CONVERT(varchar, SalesDate, 107)

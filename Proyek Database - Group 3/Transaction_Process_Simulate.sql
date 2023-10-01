--CustomerID CS001 melakukan transaksi dengan Staff ST001 untuk membeli PM003 sebanyak 2 buah pada tanggal 10-08-2021 di cabang ALSUT RB001 dengan purchase transaction ID PC030.
--CustomerID CS004 melakukan transaksi dengan Staff ST003 untuk membeli PM005 sebanyak 4 buah pada tanggal 12-08-2021 di cabang PIK RB002 PC032 dengan purchase transaction ID PC032.
--CustomerID CS 010 melakukan transaksi dengan staff ST004 untuk membeli PM 002 sebanyak 6 buah pada tanggal 26-08-2021 di cabang Grogol RB003 dengan purchase transaction ID PC035.

--Transactions processes simulate
USE [BakiMealPrep]
GO

--purchase transaction
INSERT INTO PurchaseTransaction VALUES
('PC030','RB001','ST001','2021-08-10'),
('PC032','RB002','ST003','2021-08-12'),
('PC035','RB003','ST004','2021-08-26')

--Purchase detail
INSERT INTO PurchaseDetail VALUES
('PC030','PM003','2'),
('PC032','PM005','4'),
('PC035','PM002','6')
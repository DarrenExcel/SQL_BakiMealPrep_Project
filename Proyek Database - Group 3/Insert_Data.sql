USE [BakiMealPrep]
GO

INSERT INTO RegionalBranch
 VALUES 
 ('RB001','Baki meal prep Tangerang','0217814784246 ','BAKItangerang@gmail.com','Kota tangerang tengah'),
 ('RB002','Baki meal prep PIK ','0217814784241','BAKIPIK@gmail.com','Jakarta Utara'),
 ('RB003','Baki meal prep grogol ','0217814784242','BAKIGROGOL@gmail.com','Jakarta barat'),
 ('RB004','Baki meal prep BSD ','0217814784243','BAKIBSD@gmail.com','tangerang selatan'),
 ('RB005','Baki meal prep Sunter ','0217814784249','BAKISUNTER@gmail.com','Jakarta Utara')

INSERT INTO MsCustomer
VALUES
 ('CS001','juan Santoso','male','Jakarta Utara','0819902345558','juan@gmail.com'),
 ('CS002','Laurentius','male','Jakarta Selatan','0819902348369','laurentius@gmail.com'),
 ('CS003','Daniel', 'male','Jakarta Barat','0819835345829','daniel@gmail.com'),
 ('CS004','Edrick', 'male','Jakarta Barat','0819906395777','edrick@gmail.com'),
 ('CS005','Joselyn', 'female','Jakarta Barat','0819902345318','joselyn@gmail.com'),
 ('CS006','Rachael', 'female','Jakarta Barat','0819908365444','rachael@gmail.com'),
 ('CS007','Anya Nyan', 'female','Jakarta Barat','0819663459744','anya@gmail.com'),
 ('CS008','Samantha', 'female','Jakarta Barat','0819777354002','samantha@gmail.com'),
 ('CS009','Kevin Sinaga', 'male','Jakarta Timur','0813189352888','agus@gmail.com'),
 ('CS010','Joshua Josafat', 'male','Jakarta Barat','0819946753234','jose@gmail.com')


INSERT INTO  MsStaff
VALUES 
 ('ST001','Kayson Antangin','Jakarta Utara','Male','kayson@gmail.com','0819902345524', 7000000),
 ('ST002','Cristanto Wijaya','Jakarta Selatan','Male','cristanto@gmail.com','0819902348564', 8000000),
 ('ST003','Edward Matthew','Jakarta Barat','Male','edward@gmail.com','0819835345524', 4500000),
 ('ST004','Darren Daviel','Jakarta Barat','Male','darren@gmail.com','0819906395524', 8000000 ),
 ('ST005','Joselyn Chris','Jakarta Barat','Female','joselyn@gmail.com','0819902345825', 6500000),
 ('ST006','Rachael Lana','Jakarta Barat','Female','rachael@gmail.com','0819908365016', 6000000),
 ('ST007','Anya Nyiaaa','Jakarta Barat','Female','anya@gmail.com','0819663455589', 5000000 ),
 ('ST008','Samantha Walana','Jakarta Barat','Female','samantha@gmail.com','0819663455582', 5500000),
 ('ST009','Agustine Darlana','Jakarta Timur','Male','agus@gmail.com','0813189352902', 4500000), 
 ('ST010','Jose Bicarana','Jakarta Barat','Male','jose@gmail.com','0819946751234', 6000000)


INSERT INTO MealPrep
 VALUES
('PM001' ,'BakiSpecialone', 8 , 65000 , '2023-07-18', 65000),
('PM002' ,'BakiSpecialtwo', 9 , 65000 , '2023-06-13', 65000),
('PM003' ,'BakiSpecialthree', 5 , 60000 ,'2022-08-26', 60000),
('PM004' ,'BakiSpecialfour', 4 , 52000 , '2022-12-03', 52000),
('PM005' ,'BakiSpecialfive', 2  , 50000 , '2022-10-07', 51000), 
('PM006' ,'BakiComboone', 5 , 65000 , '2022-10-25', 65000), 
('PM007' ,'Bakicombotwo', 7 , 58000 , '2023-02-02', 58000),
('PM008' ,'BakiCombothree', 9 , 55000 , '2023-09-16', 55000),
('PM009' ,'BakiCombofour', 3 , 62000 , '2023-03-20', 62000),
('PM010' ,'BakiCombofive', 5 , 65000 , '2022-05-09', 65000)

--sales transaction
INSERT INTO SalesTransaction
VALUES
('SS001','CS001','ST001','2021-09-01'),
('SS002','CS002','ST002','2021-09-05'),
('SS003','CS003','ST006','2021-09-06'),
('SS004','CS004','ST006','2021-09-08'),
('SS005','CS005','ST007','2021-09-09'),
('SS006','CS006','ST007','2021-09-11'),
('SS007','CS007','ST001','2021-09-17'),
('SS008','CS008','ST005','2021-09-20'),
('SS009','CS009','ST004','2021-09-25'),
('SS010','CS010','ST002','2021-09-30'),
('SS011','CS001','ST003','2021-10-01'),
('SS012','CS002','ST005','2021-10-03'),
('SS013','CS003','ST002','2021-10-04'),
('SS014','CS004','ST003','2021-10-05'),
('SS015','CS005','ST001','2021-10-06')

--sales detail
INSERT INTO SalesDetail VALUES
('SS001','PM001','5'),
('SS002','PM002','3'),
('SS003','PM004','4'),
('SS004','PM003','2'),
('SS005','PM005','3'),
('SS006','PM003','1'),
('SS007','PM006','1'),
('SS008','PM002','4'),
('SS009','PM006','2'),
('SS010','PM004','3'),
('SS011','PM001','1'),
('SS012','PM003','2'),
('SS013','PM005','3'),
('SS014','PM002','2'),
('SS015','PM001','3')

--purchase transaction
INSERT INTO PurchaseTransaction VALUES
('PC001','RB001','ST001','2021-08-01'),
('PC002','RB003','ST003','2021-08-03'),
('PC003','RB004','ST004','2021-08-05'),
('PC004','RB002','ST002','2021-08-06'),
('PC005','RB005','ST005','2021-08-07'),
('PC006','RB003','ST003','2021-08-09'),
('PC007','RB002','ST002','2021-08-14'),
('PC008','RB001','ST001','2021-08-15'),
('PC009','RB005','ST005','2021-08-17'),
('PC010','RB003','ST003','2021-08-19'),
('PC011','RB004','ST004','2021-08-21'),
('PC012','RB001','ST001','2021-08-24'),
('PC013','RB004','ST004','2021-08-25'),
('PC014','RB003','ST003','2021-08-28'),
('PC015','RB002','ST002','2021-08-30'),
('PC016','RB001','ST001','2021-09-01'),
('PC017','RB004','ST004','2021-09-14'),
('PC018','RB003','ST003','2021-12-16'),
('PC019','RB002','ST002','2021-12-27')

--Purchase detail
INSERT INTO PurchaseDetail VALUES
('PC001','PM001','5'),
('PC002','PM002','3'),
('PC003','PM004','4'),
('PC004','PM003','2'),
('PC005','PM005','3'),
('PC006','PM003','3'),
('PC007','PM006','3'),
('PC008','PM002','4'),
('PC009','PM006','2'),
('PC010','PM004','3'),
('PC011','PM001','1'),
('PC012','PM003','2'),
('PC013','PM005','3'),
('PC014','PM002','2'),
('PC015','PM001','3'),
('PC011','PM003','3'),
('PC012','PM006','3'),
('PC012','PM002','4'),
('PC013','PM006','2'),
('PC012','PM004','3'),
('PC002','PM001','1'),
('PC003','PM003','2'),
('PC005','PM005','3'),
('PC015','PM002','2'),
('PC014','PM001','3'),
('PC016','PM003','2'),
('PC017','PM005','3'),
('PC018','PM002','2'),
('PC019','PM001','3')



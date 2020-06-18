use FakeRealProductSystem

--DATA 18/06/2020 (Edit by 1612210)--

--ProductTypes--
insert into ProductTypes values ('TY001', 'Smartphone'),
								('TY002', 'Laptop'),
								('TY003', 'Watch'),
								('TY004', 'Headphone')

--Branches--
insert into Branches values ('BR001', 'Apple', 'USA'),
							('BR002', 'Samsung', 'Korea'),
							('BR003', 'Huawei', 'China'),
							('BR004', 'VinSmart', 'VietNam'),
							('BR005', 'BKAV', 'VietNam')

--Products--
insert into Products values ('PR001', 'Iphone 11', 'BR001', 'TY001', 'China', 19000000),
							('PR002', 'Apple Airpods Pro', 'BR001', 'TY004', 'China', 5000000),
							('PR003', 'Samsung Galaxy S20 Ultra', 'BR002', 'TY001', 'Korea', 26000000),
							('PR004', 'Huawei Mate 30 Pro', 'BR003', 'TY001', 'China', 17000000),
							('PR005', 'Macbook Pro Touch 2020', 'BR001', 'TY002', 'China', 48000000),
							('PR006', 'Apple Watch Series 3', 'BR001', 'TY003', 'China', 5500000),
							('PR007', 'Vsmart Active 3', 'BR004', 'TY001', 'VietNam', 4000000),
							('PR008', 'Vsmart Joy 3', 'BR004', 'TY001', 'VietNam', 3200000),
							('PR009', 'Vsmart Bee 3', 'BR004', 'TY001', 'VietNam', 1500000),
							('PR010', 'Bphone B86', 'BR005', 'TY001', 'VietNam', 9000000)
							
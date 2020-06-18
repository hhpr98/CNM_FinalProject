use master

if DB_ID('FakeRealProductSystem') is not null drop database FakeRealProductSystem

create database FakeRealProductSystem

use FakeRealProductSystem

create table Products (
	pr_id nvarchar(50) not null,
	pr_name nvarchar(255),
	pr_branch nvarchar(50),
	pr_type nvarchar(50),
	pr_origin nvarchar(255),
	pr_price float,

	primary key(pr_id),
);

create table Branches (
	br_id nvarchar(50) not null,
	br_name nvarchar(255),
	br_headquarter nvarchar(255),

	primary key(br_id),
);

create table ProductTypes (
	ty_id nvarchar(50) not null,
	ty_name nvarchar(255),

	primary key(ty_id),
);

alter table Products
add constraint fk_product_branch
foreign key (pr_branch)
references Branches(br_id)

alter table Products
add constraint fk_product_producttype
foreign key (pr_type)
references ProductTypes(ty_id)


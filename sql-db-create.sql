create database clash
GO

USE [clash]
GO

create table tbl_claninfo
(
claninfo_tag nvarchar(50) NOT NULL Primary Key,
claninfo_name nvarchar(50) NOT NULL,
claninfo_type nvarchar(50) NOT NULL,
claninfo_description nvarchar(500) NOT NULL,
claninfo_location nvarchar(100) NOT NULL,
claninfo_badgeurls nvarchar(500) NOT NULL,
claninfo_warfrequency nvarchar(50) NOT NULL,
claninfo_requiredtrophies int NOT NULL,
claninfo_members int NOT NULL
)

create table tbl_claninfo_temp
(
claninfo_tag nvarchar(50) NOT NULL Primary Key,
claninfo_name nvarchar(50) NOT NULL,
claninfo_type nvarchar(50) NOT NULL,
claninfo_description nvarchar(500) NOT NULL,
claninfo_location nvarchar(100) NOT NULL,
claninfo_badgeurls nvarchar(500) NOT NULL,
claninfo_warfrequency nvarchar(50) NOT NULL,
claninfo_requiredtrophies int NOT NULL,
claninfo_members int NOT NULL
)

create table tbl_clanstats
(
clanstats_id int IDENTITY(1,1) NOT NULL Primary Key,
clanstats_date date NOT NULL,
clanstats_tag nvarchar(50) NOT NULL,
clanstats_clanlevel int NOT NULL,
clanstats_warwins int NOT NULL,
clanstats_warwinstreak int NOT NULL,
clanstats_clanpoints int NOT NULL,
)

create table tbl_memberinfo
(
memberinfo_tag nvarchar(50) NOT NULL Primary Key,
memberinfo_name nvarchar(50) NOT NULL,
memberinfo_role nvarchar(50) NOT NULL,
)

create table tbl_memberinfo_temp
(
memberinfo_tag nvarchar(50) NOT NULL Primary Key,
memberinfo_name nvarchar(50) NOT NULL,
memberinfo_role nvarchar(50) NOT NULL,
)

create table tbl_memberstats
(
memberstats_id int IDENTITY(1,1) NOT NULL Primary Key,
memberstats_date date NOT NULL,
memberstats_tag nvarchar(50) NOT NULL,
memberstats_explevel int NOT NULL,
memberstats_trophies int NOT NULL,
memberstats_clanrank int NOT NULL,
memberstats_prevclankrank int NOT NULL,
memberstats_donations int NOT NULL,
memberstats_donationsrec int NOT NULL
)

Alter table tbl_memberstats add constraint tlb_memberstats_memberstats_tag_fk
Foreign Key (memberstats_tag) references tbl_memberinfo(memberinfo_tag)

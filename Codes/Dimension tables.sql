use master_dw;

drop table if exists `Arrest_Dim`;
create table `Arrest_Dim`(
`Record ID` int primary key,
`Arrest ID` varchar(50), 
`Arrest_Date` varchar(50)
);

drop table if exists `Crime_Dim`;
create table `Crime_Dim`(
`Record ID` int primary key,
`Law Code Category Description` varchar(30),
`Offense Description` varchar(30),
`PD Code Description` varchar(80),
`Bias Motive Description` varchar(30),
`Offense Category` varchar(60),
`Other Motive Description` varchar(30)
);

drop table if exists `Date_Dim`;
create table `Date_Dim`(
`Record Create Date` varchar(60),
`Complaint Year Number` int,
`Month Number` int,
`Arrest Date` varchar(50),
key `fk_01`(`Arrest Date`),
key `fk_02`(`Record Create Date`)
);

drop table if exists `Location_Dim`;
create table `Location_Dim`(
`Patrol Borough Name` varchar(50),
`County` varchar(25)
);

drop table if exists `fact_Dim`;
create table `fact_Dim`(
`Record ID` int auto_increment,
`Record Create Date` varchar(60),
`Arrest ID` varchar(30),
`Arrest Date` varchar(50),
`County` varchar(25),
primary key(`Record ID`),
unique key(`Record Create Date`, `Arrest Date`,`County`),
constraint `fk_Arrest_Dim_fact` foreign key (`Record ID`) references `Arrest_Dim` (`Record ID`),
constraint `fk_Crime_Dim_fact` foreign key (`Record ID`) references `Crime_Dim` (`Record ID`),
constraint `fk_Date_Dim_fact_01` foreign key (`Record Create Date`) references `Date_Dim` (`Record Create Date`),
constraint `fk_Date_Dim_fact_02` foreign key (`Arrest Date`) references `Date_Dim` (`Arrest Date`)
)

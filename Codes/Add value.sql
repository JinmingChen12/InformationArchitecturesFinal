use master_dw;
insert into `Arrest_Dim`(
`Record ID`,
`Arrest ID`,
`Arrest_Date`)(
select `Record ID`,`Arrest Id`, `Arrest Date` 
from master.NYPD
);

insert into `Crime_Dim`(
`Record ID`,
`Law Code Category Description`,
`Offense Description`,
`PD Code Description`,
`Bias Motive Description`,
`Offense Category`,
`Other Motive Description`
)(
select 
`Record ID`,
`Law Code Category Description`,
`Offense Description`,
`PD Code Description`,
`Bias Motive Description`,
`Offense Category`,
`Other Motive Description`
from master.NYPD
);

insert into `Date_Dim`(
`Record Create Date`,
`Complaint Year Number`,
`Month Number`,
`Arrest Date`
)(
select `Record Create Date`,
`Complaint Year Number`,
`Month Number`,
`Arrest Date`
from master.NYPD
);

insert into `Location_Dim`(
`Patrol Borough Name`,
`County`
)(
select `Patrol Borough Name`,
`County`
from master.NYPD
);
 
insert into `fact_Dim`(
`Record ID`,
`Record Create Date`,
`Arrest ID`,
`Arrest Date`,
`County`
)(
select 
`Record ID`,
`Record Create Date`,
`Arrest ID`,
`Arrest Date`,
`County`
from master.NYPD
);
select * from fact_Dim;



create database travelonthego;
use travelonthego;
create table PASSENGER(Passenger_name varchar(50),
Category varchar(50),
Gender varchar(50),
Boarding_City varchar(50),
Destination_City varchar(50),
Distance int,
Bus_Type varchar(50));

create table PRICE(Bus_Type varchar(50),
Distance int,
Price int);


insert into PASSENGER value('Sejal','AC','F','Bengaluru','Chennai',350,'Sleeper');
insert into PASSENGER value('Anmol','Non-AC','M','Mumbai','Hyderabad',700,'Sitting');
insert into PASSENGER value('Pallavi','AC','F','Panaji','Bengaluru',600,'Sleeper');
insert into PASSENGER value('Khusboo','AC','F','Chennai','Mumbai',1500,'Sleeper');
insert into PASSENGER value('Udit','Non-AC','M','Trivandrum','panaji',1000,'Sleeper');
insert into PASSENGER value('Ankur','AC','M','Nagpur','Hyderabad',500,'Sitting');
insert into PASSENGER value('Hemant','Non-AC','M','panaji','Mumbai',700,'Sleeper');
insert into PASSENGER value('Manish','Non-AC','M','Hyderabad','Bengaluru',500,'Sitting');
insert into PASSENGER value('Piyush','AC','M','Pune','Nagpur',700,'Sitting');

insert into PRICE VALUE('Sleeper',350,770);
insert into PRICE VALUE('Sleeper',500,1100);
insert into PRICE VALUE('Sleeper',600,1320);
insert into PRICE VALUE('Sleeper',700,1540);
insert into PRICE VALUE('Sleeper',1000,2200);
insert into PRICE VALUE('Sleeper',1200,2640);
insert into PRICE VALUE('Sleeper',1500,2700);
insert into PRICE VALUE('Sitting',500,620);
insert into PRICE VALUE('Sitting',600,744);
insert into PRICE VALUE('Sitting',700,868);
insert into PRICE VALUE('Sitting',1000,1240);
insert into PRICE VALUE('Sitting',1200,1488);
insert into PRICE VALUE('Sitting',1200,1860);


select Gender,count(Gender) from PASSENGER where Distance >= 600 group by Gender;


select Bus_Type,min(price) as MinFare from PRICE where Bus_Type='Sleeper';


select PASSENGER.Passenger_Name,PASSENGER.Destination_City,PRICE.Bus_Type,PRICE.Price from PASSENGER LEFT join PRICE on
PASSENGER.Distance=PRICE.Distance;


select PASSENGER.Passenger_Name,PRICE.Price from PASSENGER LEFT join PRICE on
PASSENGER.Distance=PRICE.Distance where PRICE.Bus_Type='Sitting' and PRICE.Distance=1000;


select PASSENGER.Passenger_Name,PASSENGER.Destination_City,PRICE.Bus_Type,PRICE.Price from PASSENGER LEFT join PRICE on
PASSENGER.Distance=PRICE.Distance where Passenger_Name='Pallavi';


select distinct Distance from Passenger order by Distance desc;


select Distance,Price,'Expensive' from Price where price > 1000
union
select Distance,Price,'Average Cost' from Price where price between 500 and 1000
union
select Distance,Price,'Cheap Cost' from Price where price < 500 order by Price;




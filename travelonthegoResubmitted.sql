create database travelonthego;
use travelonthego;
/*(1)*/
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

/* (2) */
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

/* (3) */
select Gender,count(Gender) from PASSENGER where Distance >= 600 group by Gender;

/* (4) */
select Bus_Type,min(price) as MinFare from PRICE where Bus_Type='Sleeper';

/* (5) */
select Passenger_Name from passenger where Passenger_name like 'S%';

/* (6) */
select PASSENGER.Passenger_Name, PASSENGER.Boarding_City,PASSENGER.Destination_City,PRICE.Bus_Type,PRICE.Price from PASSENGER LEFT join PRICE on
PASSENGER.Distance=PRICE.Distance and PASSENGER.Bus_Type=PRICE.Bus_Type;

/* (7) */
select PASSENGER.Passenger_name, PRICE.Price from PASSENGER ,Price where 
(PASSENGER.Bus_Type = "Sitting" and PRICE.Bus_Type = "Sitting" and PASSENGER.Distance=700 and PRICE.Distance=700);

/* (8) */
select Price FROM PRICE 
where distance=(SELECT Distance FROM Passenger where passenger_name = "Pallavi");

/* (9) */
select distinct(Distance) FROM PASSENGER order by distance desc;

/* (10) */
with total as ( select sum(distance) as total from Passenger)
    select passenger_Name,(distance / total.total)*100 as percentage_travel from Passenger,total ;

/* (11) */
select Distance,Price,'Expensive' from Price where price > 1000
union
select Distance,Price,'Average Cost' from Price where price between 500 and 1000
union
select Distance,Price,'Cheap Cost' from Price where price < 500 order by Price;

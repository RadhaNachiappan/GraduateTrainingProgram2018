--problemset01 31 july,2018
--submitted by radha.nachiappan.accenture.com

Hotel              (Hotel_No, Name, City)

create table Hotel(Hotel_no text primary key,Name text,City text);

INSERT INTO HOTEL VALUES("H111","EMPIRE HOTEL","NEW YORK");
INSERT INTO HOTEL VALUES("H235","PARK PLACE","NEW YORK");
INSERT INTO HOTEL VALUES("H432","BROWNSTONE HOTEL","TORONTO");
INSERT INTO HOTEL VALUES("H498","JAMES PLAZA","TORONTO");
INSERT INTO HOTEL VALUES("H193","DEVON HOTEL","BOSTON");
INSERT INTO HOTEL VALUES("H437","CLAIRMONT HOTEL","BOSTON");


Room               (Room_No, @Hotel_No, Type, Price)

create table Room(Room_no text,Hotel_no text references Hotel(Hotel_no),Type text,Price numeric,Constraint pk_key PRIMARY KEY(Room_no,Hotel_no));

INSERT INTO ROOM VALUES(313,'H111','S',145.00);
INSERT INTO ROOM VALUES(412,'H111','N',145.00);
INSERT INTO ROOM VALUES(1267,'H235','N',175.00);
INSERT INTO ROOM VALUES(1289,'H235','N',195.00);
INSERT INTO ROOM VALUES(876,'H432','S',124.00);
INSERT INTO ROOM VALUES(898,'H432','S',124.00);
INSERT INTO ROOM VALUES(345,'H498','N',160.00);
INSERT INTO ROOM VALUES(467,'H498','N',180.00);
INSERT INTO ROOM VALUES(1001,'H193','S',150.00);
INSERT INTO ROOM VALUES(1201,'H193','N',175.00);
INSERT INTO ROOM VALUES(257,'H437','N',140.00);
INSERT INTO ROOM VALUES(223,'H437','N',155.00);

Guest              (Guest­_No, Name, City)

create table Guest(Guest_no text primary key,Name text,City text);

INSERT INTO GUEST VALUES('G256','ADAM WAYNE','PITTSBURGH');
INSERT INTO GUEST VALUES('G367','TARA CUMMINGS','BALTIMORE');
INSERT INTO GUEST VALUES('G879','VANESSA PARRY','PITTSBURGH');
INSERT INTO GUEST VALUES('G230','TOM HANCOCK','PHILADELPHIA');
INSERT INTO GUEST VALUES('G467','ROBERT SWIFT','ATLANTA');
INSERT INTO GUEST VALUES('G190','EDWARD CANE','BALTIMORE');

Booking            (@Hotel_No, @Guest_No, Date_From, Date_To, @Room_No)

create table Booking(Hotel_no text references Room(Hotel_no),Guest_no text references Guest(Guest_no),Date_from varchar,Date_to varchar,Room_no text references Room(Room_no),constraint con primary key(Hotel_no,Guest_no,Room_no));

INSERT INTO BOOKING VALUES('H111','G256','10-AUG-99','15-AUG-99',412);
INSERT INTO BOOKING VALUES('H111','G367','18-AUG-99','21-AUG-99',412);
INSERT INTO BOOKING VALUES('H235','G879','05-SEP-99','12-SEP-99',1267);
INSERT INTO BOOKING VALUES('H498','G230','15-SEP-99','18-SEP-99',467);
INSERT INTO BOOKING VALUES('H498','G256','30-NOV-99','02-DEC-99',345);
INSERT INTO BOOKING VALUES('H498','G467','03-NOV-99','05-NOV-99',345);
INSERT INTO BOOKING VALUES('H193','G190','15-NOV-99','19-NOV-99',1001);
INSERT INTO BOOKING VALUES('H193','G367','12-SEP-99','14-SEP-99',1001);
INSERT INTO BOOKING VALUES('H193','G367','01-OCT-99','06-OCT-99',1201);
INSERT INTO BOOKING VALUES('H437','G190','04-OCT-99','06-OCT-99',223);
INSERT INTO BOOKING VALUES('H437','G879','14-SEP-99','17-SEP-99',223);



1.List full details of all hotels.

select h.Hotel_no,h.Name,h.city,r.Room_no,r.type,r.price from Hotel h inner join Room r on h.Hotel_no=r.Hotel_no;

H111|EMPIRE HOTEL|NEW YORK|313|S|145
H111|EMPIRE HOTEL|NEW YORK|412|N|145
H235|PARK PLACE|NEW YORK|1267|N|175
H235|PARK PLACE|NEW YORK|1289|N|195
H432|BROWNSTONE HOTEL|TORONTO|876|S|124
H432|BROWNSTONE HOTEL|TORONTO|898|S|124
H498|JAMES PLAZA|TORONTO|345|N|160
H498|JAMES PLAZA|TORONTO|467|N|180
H193|DEVON HOTEL|BOSTON|1001|S|150
H193|DEVON HOTEL|BOSTON|1201|N|175
H437|CLAIRMONT HOTEL|BOSTON|257|N|140
H437|CLAIRMONT HOTEL|BOSTON|223|N|155

record count-12

2.List full details of all hotels in New York.

select * from Hotel H inner join Room R on H.Hotel_no=R.Hotel_no and H.City='NEW YORK';

H111|EMPIRE HOTEL|NEW YORK|313|H111|S|145
H111|EMPIRE HOTEL|NEW YORK|412|H111|N|145
H235|PARK PLACE|NEW YORK|1267|H235|N|175
H235|PARK PLACE|NEW YORK|1289|H235|N|195

record count-4

3.List the names and cities of all guests, ordered according to their cities.

select *from Guest order by city asc;

G467|ROBERT SWIFT|ATLANTA
G367|TARA CUMMINGS|BALTIMORE
G190|EDWARD CANE|BALTIMORE
G230|TOM HANCOCK|PHILADELPHIA
G256|ADAM WAYNE|PITTSBURGH
G879|VANESSA PARRY|PITTSBURGH

record count-6

4.List all details for non-smoking rooms in ascending order of price.

select h.Hotel_no,h.NAME,r.ROOM_NO,r.Type,r.Price from Room r inner join Hotel h ON r.Hotel_no=h.Hotel_no and r.Type='N' ORDER BY PRICE ASC;

H437|CLAIRMONT HOTEL|257|N|140
H111|EMPIRE HOTEL|412|N|145
H437|CLAIRMONT HOTEL|223|N|155
H498|JAMES PLAZA|345|N|160
H235|PARK PLACE|1267|N|175
H193|DEVON HOTEL|1201|N|175
H498|JAMES PLAZA|467|N|180
H235|PARK PLACE|1289|N|195

record count-8

5.List the number of hotels there are.

select count(Hotel_no) from Hotel;

6

record count-1

6.List the cities in which guests live. Each city should be listed only once.

select distinct(city) from guest;

PITTSBURGH
BALTIMORE
PHILADELPHIA
ATLANTA

record count-4

7.List the average price of a room.

select avg(price) from Room group by Type;

165.625
135.75

record count-2

8.List hotel names, their room numbers, and the type of that room.

select h.Name,r.ROOM_NO,r.TYPE FROM ROOM r inner join Hotel h where h.HOTEL_NO=r.hotel_no;

EMPIRE HOTEL|313|S
EMPIRE HOTEL|412|N
PARK PLACE|1267|N
PARK PLACE|1289|N
BROWNSTONE HOTEL|876|S
BROWNSTONE HOTEL|898|S
JAMES PLAZA|345|N
JAMES PLAZA|467|N
DEVON HOTEL|1001|S
DEVON HOTEL|1201|N
CLAIRMONT HOTEL|257|N
CLAIRMONT HOTEL|223|N

record count-12

9.List the hotel names, booking dates, and room numbers for all hotels in New York.

select h.Name,b.Date_from,b.Date_to from HOTEL h inner join Booking b on h.Hotel_no=b.Hotel_no and h.City='NEW YORK';

EMPIRE HOTEL|10-AUG-99|15-AUG-99
EMPIRE HOTEL|18-AUG-99|21-AUG-99
PARK PLACE|05-SEP-99|12-SEP-99

record count-3

10.What is the number of bookings that started in the month of September?

SELECT count(*) from Booking where date_from like '%sep%';

4

record count-1       

11.List the names and cities of guests who began a stay in New York in August.

select h.Hotel_no,b.Room_no,h.Name,h.City,b.Guest_no,g.Name,g.City,b.Date_from,b.Date_to from Hotel h inner join Booking b inner join Guest g on h.Hotel_no=b.Hotel_no and h.City='NEW YORK' and g.Guest_no=b.Guest_no and Date_from like '%Aug%';

H111|412|EMPIRE HOTEL|NEW YORK|G256|ADAM WAYNE|PITTSBURGH|10-AUG-99|15-AUG-99
H111|412|EMPIRE HOTEL|NEW YORK|G367|TARA CUMMINGS|BALTIMORE|18-AUG-99|21-AUG-99

record count-2

12.List the hotel names and room numbers of any hotel rooms that have not been booked.

select name,R.Room_no from Hotel h inner join Room r on h.Hotel_no=r.Hotel_no  where Room_no not in(select Room_no from Booking);

PARK PLACE|1289
CLAIRMONT HOTEL|257
EMPIRE HOTEL|313
BROWNSTONE HOTEL|876
BROWNSTONE HOTEL|898

record count-5


13.List the hotel name and city of the hotel with the highest priced room.

select h.Hotel_no,h.Name ,max(price) from Room r INNER JOIN Hotel h where r.Hotel_no=h.Hotel_no;

H235|PARK PLACE|195
 
record count-1


14.List hotel names, room numbers, cities, and prices for hotels that have rooms with prices lower than the lowest priced room in a Boston hotel.

select h.Hotel_no,h.Name,h.City,r.Room_no,min(price) from Hotel h inner join Room r on r.Hotel_no=h.Hotel_no and h.City='BOSTON';

H437|CLAIRMONT HOTEL|BOSTON|257|140

record count-1


15.List the average price of a room grouped by city.

select City,AVG(PRICE) from Room r inner join Hotel h on r.Hotel_no=h.Hotel_no group by City;

BOSTON|155.0
NEW YORK|165.0
TORONTO|147.0

record count-3

আসালামু আলাইকুম
নিচে Vehicle Rental System assignment–এর Part 1 (ERD Design) এবং Part 2 (SQL Queries) 

 

Part 1: ERD Design  
Entities (Tables)

মোট ৩টি table থাকবে:
users Table

কেন দরকার?
কারণ user (Admin/Customer) গাড়ি বুক করবে।

Attributes (Columns):

id → Primary Key (PK)

role → Admin / Customer

name

email → UNIQUE

password

phone

Email unique হলে duplicate account হবে না

id দিয়ে অন্য table–এ relation তৈরি হবে

Vehicles Table

 

Attributes

id → Primary Key (PK)

vehicle_name

type → car / bike / truck

model

registration_number → UNIQUE

price_per_day

availability_status → available / rented / maintenance

Bookings Table

 
User কোন vehicle কখন বুক করেছে – সেটা track করতে হবে

Attributes:

id → Primary Key (PK)

user_id → Foreign Key (FK → Users.id)

vehicle_id → Foreign Key (FK → Vehicles.id)

start_date

end_date

booking_status → pending / confirmed / completed / cancelled

total_cost

Relationships (সবচেয়ে গুরুত্বপূর্ণ অংশ)
One-to-Many (User → Bookings)

একজন user অনেক booking করতে পারে
কিন্তু একটি booking শুধুমাত্র একজন user-এর

bookings.user_id → users.id

Many-to-One (Bookings → Vehicles)

অনেক booking একই vehicle-এর হতে পারে
কিন্তু একটি booking শুধু একটি vehicle-এর
 
bookings.vehicle_id → vehicles.id

One-to-One (Logical)

একটি booking একজন user এবং একটি vehicle-এর সাথে যুক্ত

এটা physical table নয়, logical rule
 ERD-এ যেগুলো অবশ্যই দেখাবেন

Primary Key (PK)
Foreign Key (FK)
 Relationship cardinality (1, M)
 Status fields (booking_status, availability_status)

Lucidchart-এ তিনটা box বানাবেন (Users, Vehicles, Bookings)
Line দিয়ে relation দেখাবেন
Crow’s foot notation ব্যবহার করলে bonus impression 
Part 2: SQL Queries ধাপে ধাপে ব্যাখ্যা করা হলঃ 

ধরা যাক table নাম:

users
vehicles
bookings
Query 1: JOIN
Booking info + Customer name + Vehicle name
Concept:

INNER JOIN

3 টা table connect করতে হবে

 SQL:
SELECT 
    users.name AS customer_name,
    vehicles.vehicle_name,
    bookings.start_date,
    bookings.end_date,
    bookings.booking_status
FROM bookings
INNER JOIN users ON bookings.user_id = users.id
INNER JOIN vehicles ON bookings.vehicle_id = vehicles.id;

 

bookings → main table

user_id দিয়ে users connect

vehicle_id দিয়ে vehicles connect

Query 2: EXISTS
 
Concept:

NOT EXISTS

Subquery ব্যবহার

SQL:
SELECT *
FROM vehicles v
WHERE NOT EXISTS (
    SELECT 1
    FROM bookings b
    WHERE b.vehicle_id = v.id
);

          ব্যাখ্যাঃ

প্রতিটা vehicle চেক করা হচ্ছে 

          কারণ  
          

যদি bookings table–এ না থাকে → show করবে
Query 3: WHERE
Available vehicles (type = car)
Concept:

SELECT

WHERE

SQL:
SELECT *
FROM vehicles
WHERE availability_status = 'available'
AND type = 'car';

সহজ কথা:

শুধু available

শুধু car

Query 4: GROUP BY + HAVING
যেসব vehicle-এর booking > 2
Concept:

COUNT

GROUP BY

HAVING

so write for banglish 

ধন্যবাদ 

 


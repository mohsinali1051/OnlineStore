create database onlineStore

use onlineStore

create table Admin
(
email varchar(80) not null primary key,
name varchar(100),
pass varchar(100)
)

select * from Admin
create table User
(
name varchar(100),
email varchar(80) not null primary key,
pass varchar(100),
dob DATE,
gender varchar(50),
blacklisted  TINYINT(1) UNSIGNED NULL
)


select * from User



create table InventoryType
(
Id int not null primary key AUTO_INCREMENT,
Name varchar(70)
)
select * from InventoryType
CREATE TABLE Item (
  itemId INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  quantity INT,
  title VARCHAR(100),
  marketPrice FLOAT,
  costPrice FLOAT,
  margin FLOAT,
  minimumAge INT,
  itemType INT,
  FOREIGN KEY (itemType) REFERENCES InventoryType(Id)
);







select * from Item
CREATE TABLE favourities (
  email VARCHAR(80),
  itemId INT,
  PRIMARY KEY (email, itemId),
  FOREIGN KEY (email) REFERENCES User(email),
  FOREIGN KEY (itemId) REFERENCES Item(itemId)
);
select * from favourities
create table Payment
(
id int not null primary key AUTO_INCREMENT, 
cardNum int NOT NULL,
cardExpiry DATE NOT NULL,
cardName varchar(100) NOT NULL,
paymentStatus  TINYINT(1) UNSIGNED NOT NULL,
paymentDate DATE NOT NULL
)
select * from Payment
create table Orders
(
id int not null primary key AUTO_INCREMENT, 
paymentId int UNIQUE ,
itemId int not null,
userEmail varchar(80),
orderStatus  TINYINT(1) UNSIGNED not null,
dateOfOrder DATE,
Foreign key (userEmail) references User(email),
Foreign key (paymentId) references Payment(id),
Foreign key (itemId) references Item(itemId)

)
select * from Orders

create table queries
(
Id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
itemId int,
queryMsg varchar(800),
foreign key (itemId) references Item (itemId)
)
select * from queries
create table Feedback
(
itemId int,
userEmail varchar(80),
coment varchar(800),
stars TINYINT CHECK (stars >= 0 AND stars <= 5),
foreign key (itemId) references Item (itemId),
foreign key (userEmail) references User(email),
primary key (itemId,userEmail)
)
select * from Feedback
create table replies
(
Id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
queryId int,
replyMsg varchar(800),
foreign key (queryId) references queries (Id)
)
select * from replies


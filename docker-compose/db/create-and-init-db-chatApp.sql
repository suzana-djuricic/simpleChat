USE [master]
GO

IF DB_ID('chatApp') IS NOT NULL
  set noexec on               -- prevent creation when already exists

CREATE DATABASE [chatApp];
GO

USE [chatApp]
GO

CREATE table users(
id bigint not null identity(1,1),
username varchar(30) not null unique,
password varchar(120),
PRIMARY KEY (id)
);
GO

CREATE table messages(
id bigint not null identity(1,1),
sender_id bigint not null,
timestamp datetime not null,
content varchar(4000) not null,
PRIMARY KEY (id),
FOREIGN KEY (sender_id) REFERENCES users(id)
);
GO

INSERT INTO users(username, password)
VALUES('user01', 'plainPassword'),
('user02', 'plainPassword'),
('user03', 'plainPassword'),
('user04', 'plainPassword'),
('user05', 'plainPassword');
GO

INSERT INTO messages(sender_id, timestamp, content)
VALUES (1, GETDATE(), 'Hello from 1');
INSERT INTO messages(sender_id, timestamp, content)
VALUES (2, GETDATE(), 'Hello from 2');
INSERT INTO messages(sender_id, timestamp, content)
VALUES (3, GETDATE(), 'Hello from 3');
INSERT INTO messages(sender_id, timestamp, content)
VALUES (4, GETDATE(), 'Hello from 4');
INSERT INTO messages(sender_id, timestamp, content)
VALUES (5, GETDATE(), 'Hello from 5');
INSERT INTO messages(sender_id, timestamp, content)
VALUES (1, GETDATE(), 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.');
INSERT INTO messages(sender_id, timestamp, content)
VALUES (1, GETDATE(), 'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.');
INSERT INTO messages(sender_id, timestamp, content)
VALUES (3, GETDATE(), 'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.');
INSERT INTO messages(sender_id, timestamp, content)
VALUES (2, GETDATE(), 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.');
GO

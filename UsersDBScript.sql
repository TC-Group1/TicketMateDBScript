CREATE DATABASE TicketMate;

USE TicketMate;

CREATE TABLE Users (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Guid CHAR(36) UNIQUE NOT NULL,
    Username NVARCHAR(50) NOT NULL,
    PasswordHash VARCHAR(100),
    UNIQUE KEY unique_username (Username)
);

Create Table Roles (
	Id INT Auto_Increment Primary Key Not Null,
    Name Nvarchar(32) Not Null
);
    
Create Table UserRoles (
	Id Int Auto_Increment Primary Key Not Null,
	UserId Int not null,
	RoleId Int not null,
	Foreign key (UserId) References User(Id),
	Foreign key (RoleId) References Roles(Id)
);
	
INSERT INTO Roles (Name) 
VALUES 
	('User'), 
	('Admin')
;

INSERT INTO Users (Guid, Username, PasswordHash) 
VALUES
	('123456', 'testuser1', 'hash1'),
	('789012', 'testuser2', 'hash2')
;

INSERT INTO UserRoles (UserId, RoleId) 
VALUES
	(1, 1),
	(2, 2)
;
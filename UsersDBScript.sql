CREATE DATABASE IF NOT EXISTS TicketMate;

USE TicketMate;

CREATE TABLE IF NOT EXISTS Users (
    Id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Guid CHAR(36) UNIQUE NOT NULL,
    Username NVARCHAR(50) NOT NULL,
    PasswordHash VARCHAR(100),
    UNIQUE KEY unique_username (Username)
);

CREATE TABLE IF NOT EXISTS Roles (
	Id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Name NVARCHAR(32) NOT NULL
);
    
CREATE TABLE IF NOT EXISTS UserRoles (
	Id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	UserId INT NOT NULL,
	RoleId INT NOT NULL,
	FOREIGN KEY (UserId) REFERENCES Users(Id),
	FOREIGN KEY (RoleId) REFERENCES Roles(Id)
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
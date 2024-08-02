create database quan_ly_tai_chinh;
use quan_ly_tai_chinh;

CREATE TABLE User
(
    UserId   INT AUTO_INCREMENT PRIMARY KEY,
    Email    VARCHAR(50) UNIQUE NOT NULL,
    Password VARCHAR(255)       NOT NULL,
    Name     VARCHAR(255)       NOT NULL,
    Age      INT,
    Phone    INT,
    Address  VARCHAR(50)
);

CREATE TABLE SocialAccounts
(
    Social_Accounts_Id INT AUTO_INCREMENT PRIMARY KEY,
    User_Id            INT,
    Provider           VARCHAR(50)  NOT NULL,
    Provider_User_Id   VARCHAR(255) NOT NULL,
    Create_At          DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT FK_SocialAccounts_User FOREIGN KEY (User_Id)
        REFERENCES User (UserId)
        ON DELETE CASCADE
);

CREATE TABLE Wallet
(
    Wallet_Id   INT AUTO_INCREMENT PRIMARY KEY,
    User_Id     INT,
    Name        VARCHAR(100) NOT NULL,
    Description TEXT,
    Create_At   DATETIME DEFAULT CURRENT_TIMESTAMP,
    Update_At   DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT FK_Wallet_User FOREIGN KEY (User_Id)
        REFERENCES User (UserId)
        ON DELETE CASCADE
);

CREATE TABLE Transaction
(
    Transaction_Id   INT AUTO_INCREMENT PRIMARY KEY,
    User_Id          INT,
    Wallet_Id        INT,
    Category_Id      INT,
    Amount           DECIMAL(10, 2)             NOT NULL,
    Note             TEXT,
    Transaction_Type ENUM ('income', 'expense') NOT NULL,
    Transaction_Date DATETIME DEFAULT CURRENT_TIMESTAMP,
    Create_At        DATETIME DEFAULT CURRENT_TIMESTAMP,
    Update_At        DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT FK_Transaction_User FOREIGN KEY (User_Id)
        REFERENCES User (UserId)
        ON DELETE CASCADE,
    CONSTRAINT FK_Transaction_Wallet FOREIGN KEY (Wallet_Id)
        REFERENCES Wallet (Wallet_Id)
        ON DELETE CASCADE,
    CONSTRAINT FK_Transaction_Categories FOREIGN KEY (Category_Id)
        REFERENCES Categories (Category_Id)
        ON DELETE SET NULL
);

CREATE TABLE Categories
(
    Category_Id INT AUTO_INCREMENT PRIMARY KEY,
    User_Id     INT,
    Name        VARCHAR(100) NOT NULL,
    Note        TEXT,
    Create_At   DATETIME DEFAULT CURRENT_TIMESTAMP,
    Update_At   DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT FK_Categories_User FOREIGN KEY (User_Id)
        REFERENCES User (UserId)
        ON DELETE CASCADE                                                       
);


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
    Wallet_Id   INT AUTO_INCREMENT PRIMARY KEY,                                 -- wallet_id
    User_Id     INT,                                                            -- user_id
    Name        VARCHAR(100) NOT NULL,                                          -- name
    Description TEXT,                                                           -- description
    Create_At   DATETIME DEFAULT CURRENT_TIMESTAMP,                             -- created_at
    Update_At   DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- updated_at
    CONSTRAINT FK_Wallet_User FOREIGN KEY (User_Id)
        REFERENCES User (UserId)
        ON DELETE CASCADE
);

CREATE TABLE Transaction
(
    Transaction_Id   INT AUTO_INCREMENT PRIMARY KEY,                                 -- transaction_id
    User_Id          INT,                                                            -- user_id
    Wallet_Id        INT,                                                            -- wallet_id
    Category_Id      INT,                                                            -- category_id
    Amount           DECIMAL(10, 2)             NOT NULL,                            -- amount
    Note             TEXT,                                                           -- note
    Transaction_Type ENUM ('income', 'expense') NOT NULL,                            -- transaction_type ('income', 'expense')
    Transaction_Date DATETIME DEFAULT CURRENT_TIMESTAMP,                             -- transaction_date
    Create_At        DATETIME DEFAULT CURRENT_TIMESTAMP,                             -- created_at
    Update_At        DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- updated_at
    CONSTRAINT FK_Transaction_User FOREIGN KEY (User_Id)
        REFERENCES User (UserId)
        ON DELETE CASCADE,                                                           -- Xóa giao dịch khi xóa người dùng
    CONSTRAINT FK_Transaction_Wallet FOREIGN KEY (Wallet_Id)
        REFERENCES Wallet (Wallet_Id)
        ON DELETE CASCADE,                                                           -- Xóa giao dịch khi xóa ví tiền
    CONSTRAINT FK_Transaction_Categories FOREIGN KEY (Category_Id)
        REFERENCES Categories (Category_Id)
        ON DELETE SET NULL                                                           -- Đặt danh mục thành NULL khi xóa danh mục
);

CREATE TABLE Categories
(
    Category_Id INT AUTO_INCREMENT PRIMARY KEY,                                 -- category_id
    User_Id     INT,                                                            -- user_id
    Name        VARCHAR(100) NOT NULL,                                          -- name
    Note         TEXT,                                                           -- note
    Create_At   DATETIME DEFAULT CURRENT_TIMESTAMP,                             -- created_at
    Update_At   DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- updated_at
    CONSTRAINT FK_Categories_User FOREIGN KEY (User_Id)
        REFERENCES User (UserId)
        ON DELETE CASCADE                                                       -- Xóa danh mục khi xóa người dùng
);


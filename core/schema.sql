DROP TABLE IF EXISTS userAccount;
DROP TABLE IF EXISTS bankAccount;
DROP TABLE IF EXISTS transactionRecord;


CREATE TABLE userAccount
(
    id          INTEGER PRIMARY KEY AUTOINCREMENT,
    username    TEXT UNIQUE NOT NULL,
    password    TEXT        NOT NULL,
    firstName   TEXT        NOT NULL,
    lastName    TEXT        NOT NULL,
    SSN         TEXT UNIQUE NOT NULL,
    phoneNumber TEXT        NOT NULL,
    address     TEXT        NOT NULL
);

CREATE TABLE bankAccount
(
    id            INTEGER PRIMARY KEY AUTOINCREMENT,
    userAccountId INTEGER        NOT NULL,
    balance       DECIMAL(16, 2) NOT NULL,
    FOREIGN KEY (userAccountId) REFERENCES userAccount (id)
);

CREATE TABLE transactionRecord
(
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    bankAccountId   INTEGER NOT NULL,
    transactionTime TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    amount          DECIMAL(16, 2) NOT NULL,
    memo            TEXT,
    FOREIGN KEY (bankAccountId) REFERENCES bankAccount (id)
);



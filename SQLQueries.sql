-- ============================================================
--       BANK MANAGEMENT SYSTEM - COMPLETE SQL SCRIPT
--       Includes: Schema, Bulk Inserts, CRUD, 10 SQL Questions
-- ============================================================

CREATE DATABASE BankManagementSystem;
USE BankManagementSystem;

-- ============================================================
--  TABLE CREATION
-- ============================================================

CREATE TABLE Branches (
    BranchID    INT PRIMARY KEY IDENTITY(1,1),
    BranchName  VARCHAR(100),
    City        VARCHAR(50),
    Address     VARCHAR(255),
    CreatedDate DATETIME DEFAULT GETDATE()
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    BranchID   INT FOREIGN KEY REFERENCES Branches(BranchID),
    FullName   VARCHAR(100),
    Role       VARCHAR(50),
    Username   VARCHAR(50),
    Email      VARCHAR(100)
);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FullName   VARCHAR(100),
    NationalID VARCHAR(14) UNIQUE,
    Phone      VARCHAR(15),
    Email      VARCHAR(100),
    City       VARCHAR(50),
    JoinDate   DATETIME DEFAULT GETDATE()
);

CREATE TABLE Accounts (
    AccountNo   INT PRIMARY KEY,
    CustomerID  INT FOREIGN KEY REFERENCES Customers(CustomerID),
    BranchID    INT FOREIGN KEY REFERENCES Branches(BranchID),
    AccountType VARCHAR(20),   -- Savings, Current
    Balance     DECIMAL(18,2) DEFAULT 0.00,
    Status      VARCHAR(20),   -- Active, Inactive, Closed
    OpenedOn    DATETIME DEFAULT GETDATE()
);

CREATE TABLE Transactions (
    TxnID       INT PRIMARY KEY IDENTITY(1,1),
    AccountNo   INT FOREIGN KEY REFERENCES Accounts(AccountNo),
    EmployeeID  INT FOREIGN KEY REFERENCES Employees(EmployeeID),
    TxnType     VARCHAR(20),   -- Credit, Debit
    Amount      DECIMAL(18,2),
    TxnDateTime DATETIME DEFAULT GETDATE(),
    Description VARCHAR(250)
);

CREATE TABLE BankServices (
    ServiceID   INT PRIMARY KEY IDENTITY(1,1),
    ServiceName VARCHAR(50)
);

CREATE TABLE ServiceSubscriptions (
    SubscriptionID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID     INT FOREIGN KEY REFERENCES Customers(CustomerID),
    ServiceID      INT FOREIGN KEY REFERENCES BankServices(ServiceID),
    Status         VARCHAR(20),  -- Active, Inactive, Pending
    RequestDate    DATETIME DEFAULT GETDATE()
);

-- ============================================================
--  BULK INSERTS
-- ============================================================

INSERT INTO Branches (BranchName, City, Address) VALUES
('Nasr City Branch',  'Cairo',      'Makram Ebeid'),
('Heliopolis Branch', 'Cairo',      'El Hegaz St'),
('Dokki Branch',      'Giza',       'Tahrir St'),
('Maadi Branch',      'Cairo',      'Road 9'),
('Alex Branch',       'Alexandria', 'Stanley');

INSERT INTO Employees (BranchID, FullName, Role, Username, Email) VALUES
(1,'Ahmed Ali',         'Teller',           'ahmed1',    'ahmed@bank.com'),
(1,'Mona Samy',         'Customer Service', 'mona1',     'mona@bank.com'),
(2,'Hassan Omar',       'Manager',          'hassan1',   'hassan@bank.com'),
(2,'Sara Adel',         'Teller',           'sara1',     'sara@bank.com'),
(3,'Omar Khaled',       'Customer Service', 'omar1',     'omar@bank.com'),
(3,'Nour Hassan',       'Teller',           'nour1',     'nour@bank.com'),
(4,'Ali Mostafa',       'Manager',          'ali1',      'ali@bank.com'),
(4,'Hana Ahmed',        'Teller',           'hana1',     'hana@bank.com'),
(5,'Khaled Samy',       'Customer Service', 'khaled1',   'khaled@bank.com'),
(5,'Yara Ali',          'Teller',           'yara1',     'yara@bank.com'),
(1,'Hany Shaker',       'Teller',           'hany.s',    'hany.s@bank.com'),
(1,'Laila Elwi',        'Customer Service', 'laila.e',   'laila.e@bank.com'),
(1,'Yassin Hamed',      'Teller',           'yassin.h',  'yassin.h@bank.com'),
(1,'Amira Raafat',      'Customer Service', 'amira.r',   'amira.r@bank.com'),
(1,'Ziad Walid',        'Teller',           'ziad.w',    'ziad.w@bank.com'),
(1,'Noura Selim',       'Teller',           'noura.s',   'noura.s@bank.com'),
(1,'Hossam Ashour',     'Manager',          'hossam.a',  'hossam.a@bank.com'),
(1,'Dina Fouad',        'Teller',           'dina.f',    'dina.f@bank.com'),
(2,'Magdy Yacoub',      'Manager',          'magdy.y',   'magdy.y@bank.com'),
(2,'Sahar Nasr',        'Customer Service', 'sahar.n',   'sahar.n@bank.com'),
(2,'Tarek Shawky',      'Teller',           'tarek.s',   'tarek.s@bank.com'),
(2,'Rania Al-Mashat',   'Customer Service', 'rania.m',   'rania.m@bank.com'),
(2,'Mohamed Zaki',      'Teller',           'mohamed.z', 'mohamed.z@bank.com'),
(2,'Fatma Hegazy',      'Teller',           'fatma.h',   'fatma.h@bank.com'),
(2,'Sherif Ismail',     'Teller',           'sherif.i',  'sherif.i@bank.com'),
(2,'Heba Ahmed',        'Teller',           'heba.a',    'heba.a@bank.com'),
(3,'Bassem Youssef',    'Teller',           'bassem.y',  'bassem.y@bank.com'),
(3,'Engy Ali',          'Customer Service', 'engy.a',    'engy.a@bank.com'),
(3,'Khaled El-Nabawy',  'Manager',          'khaled.n',  'khaled.n@bank.com'),
(3,'Mona Zaki',         'Teller',           'mona.z',    'mona.z@bank.com'),
(3,'Ahmed Helmy',       'Teller',           'ahmed.h',   'ahmed.h@bank.com'),
(3,'Yasmin Abdelaziz',  'Customer Service', 'yasmin.a',  'yasmin.a@bank.com'),
(3,'Karim Abdelaziz',   'Teller',           'karim.a',   'karim.a@bank.com'),
(3,'Nelly Karim',       'Teller',           'nelly.k',   'nelly.k@bank.com'),
(4,'Amr Diab',          'Manager',          'amr.d',     'amr.d@bank.com'),
(4,'Sherine Abdelwahab','Customer Service', 'sherine.a', 'sherine.a@bank.com'),
(4,'Tamer Hosny',       'Teller',           'tamer.h',   'tamer.h@bank.com'),
(4,'Angham Mohamed',    'Teller',           'angham.m',  'angham.m@bank.com'),
(4,'Mohamed Hamaki',    'Customer Service', 'hamaki.m',  'hamaki.m@bank.com'),
(4,'Assala Nasri',      'Teller',           'assala.n',  'assala.n@bank.com'),
(4,'Nancy Ajram',       'Teller',           'nancy.a',   'nancy.a@bank.com'),
(4,'Elissa Zakaria',    'Teller',           'elissa.z',  'elissa.z@bank.com'),
(5,'Mohamed Salah',     'Manager',          'salah.m',   'salah.m@bank.com'),
(5,'Trezeguet Hassan',  'Teller',           'trez.h',    'trez.h@bank.com'),
(5,'Elneny Mohamed',    'Customer Service', 'elneny.m',  'elneny.m@bank.com'),
(5,'Marmoush Omar',     'Teller',           'omar.m',    'omar.m@bank.com'),
(5,'Mostafa Mohamed',   'Customer Service', 'mostafa.m', 'mostafa.m@bank.com'),
(5,'Shenawy Mohamed',   'Teller',           'shenawy.m', 'shenawy.m@bank.com'),
(5,'Zizo Ahmed',        'Teller',           'zizo.a',    'zizo.a@bank.com'),
(5,'Afsha Mohamed',     'Teller',           'afsha.m',   'afsha.m@bank.com');

INSERT INTO Customers (FullName, NationalID, Phone, Email, City) VALUES
('Ali Hassan',          '29811011234567', '01011111111', 'ali@mail.com',       'Cairo'),
('Mona Ahmed',          '29912021234567', '01022222222', 'mona@mail.com',      'Giza'),
('Sara Mohamed',        '29713031234567', '01033333333', 'sara@mail.com',      'Alex'),
('Omar Ali',            '29614041234567', '01044444444', 'omar@mail.com',      'Cairo'),
('Hana Adel',           '29515051234567', '01055555555', 'hana@mail.com',      'Giza'),
('Khaled Samy',         '29416061234567', '01066666666', 'khaled@mail.com',    'Alex'),
('Nour Hassan',         '29317071234567', '01077777777', 'nour@mail.com',      'Cairo'),
('Yara Ahmed',          '29218081234567', '01088888888', 'yara@mail.com',      'Giza'),
('Mostafa Ali',         '29119091234567', '01099999999', 'mostafa@mail.com',   'Cairo'),
('Salma Omar',          '29110101234567', '01100000000', 'salma@mail.com',     'Alex'),
('Ahmed Fathy',         '28911011234567', '01111111111', 'ahmed@mail.com',     'Cairo'),
('Mai Adel',            '28812021234567', '01122222222', 'mai@mail.com',       'Giza'),
('Karim Hassan',        '28713031234567', '01133333333', 'karim@mail.com',     'Alex'),
('Nada Ali',            '28614041234567', '01144444444', 'nada@mail.com',      'Cairo'),
('Tamer Samy',          '28515051234567', '01155555555', 'tamer@mail.com',     'Giza'),
('Heba Omar',           '28416061234567', '01166666666', 'heba@mail.com',      'Alex'),
('Mahmoud Adel',        '28317071234567', '01177777777', 'mahmoud@mail.com',   'Cairo'),
('Rana Ali',            '28218081234567', '01188888888', 'rana@mail.com',      'Giza'),
('Youssef Hassan',      '28119091234567', '01199999999', 'youssef@mail.com',   'Cairo'),
('Laila Ahmed',         '28110101234567', '01200000000', 'laila@mail.com',     'Alex'),
('Omar El-Farouk',      '29511011234568', '01211111111', 'omar.f@mail.com',    'Cairo'),
('Fatma El-Zahraa',     '29812021234568', '01222222222', 'fatma.z@mail.com',   'Giza'),
('Mahmoud El-Khateeb',  '29513031234568', '01233333333', 'khatib@mail.com',    'Cairo'),
('Amira Hassan',        '29914041234568', '01244444444', 'amira.h@mail.com',   'Alex'),
('Youssef El-Sherif',   '29415151234568', '01255555555', 'youssef.s@mail.com', 'Cairo'),
('Zainab Ali',          '29516161234568', '01266666666', 'zainab.a@mail.com',  'Giza'),
('Hossam Ghaly',        '29617171234568', '01277777777', 'ghaly@mail.com',     'Cairo'),
('Dina El-Sherbiny',    '29718181234568', '01288888888', 'dina.s@mail.com',    'Alex'),
('Kareem Afifi',        '29819191234568', '01299999999', 'kareem.a@mail.com',  'Cairo'),
('Rana Raeis',          '29911111234568', '01500000000', 'rana.r@mail.com',    'Giza'),
('Tarek Sabry',         '28111011234569', '01511111111', 'tarek.sa@mail.com',  'Cairo'),
('Nourhan Ahmed',       '28112121234569', '01522222222', 'nourhan@mail.com',   'Alex'),
('Sherif Mounir',       '28213131234569', '01533333333', 'sherif.m@mail.com',  'Cairo'),
('Laila Zaher',         '28314141234569', '01544444444', 'laila.z@mail.com',   'Giza'),
('Ahmed Amin',          '28415151234569', '01555555555', 'amin.a@mail.com',    'Cairo'),
('Mayan El-Sayed',      '28516161234569', '01566666666', 'mayan@mail.com',     'Alex'),
('Eyad Nassar',         '28617171234569', '01577777777', 'eyad@mail.com',      'Cairo'),
('Asser Yassin',        '28718181234569', '01588888888', 'asser@mail.com',     'Cairo'),
('Hend Sabry',          '28819191234569', '01599999999', 'hend@mail.com',      'Giza'),
('Maged El-Kedwany',    '28911111234569', '01000001111', 'maged@mail.com',     'Cairo'),
('Mohamed Henedy',      '27111011234570', '01012345671', 'henedy@mail.com',    'Cairo'),
('Ahmed Helmy',         '26112021234571', '01012345672', 'helmy.a@mail.com',   'Cairo'),
('Mona Zaki',           '28513131234572', '01012345673', 'mona.z@mail.com',    'Giza'),
('Karim Abdelaziz',     '27514141234573', '01012345674', 'karim.ab@mail.com',  'Alex'),
('Donia Samir Ghanem',  '28815151234574', '01012345675', 'donia.s@mail.com',   'Cairo'),
('Amir Karara',         '27716161234575', '01012345676', 'karara@mail.com',    'Giza');

INSERT INTO Accounts (AccountNo, CustomerID, BranchID, AccountType, Balance, Status) VALUES
(1001,  1,  1, 'Savings',  5000.00, 'Active'),
(1002,  2,  2, 'Current',  3000.00, 'Active'),
(1003,  3,  3, 'Savings',  7000.00, 'Active'),
(1004,  4,  1, 'Current',  2500.00, 'Active'),
(1005,  5,  4, 'Savings',  9000.00, 'Active'),
(1006,  6,  5, 'Current',  1500.00, 'Active'),
(1007,  7,  2, 'Savings',  6000.00, 'Active'),
(1008,  8,  3, 'Current',  4000.00, 'Active'),
(1009,  9,  4, 'Savings',  8000.00, 'Active'),
(1010, 10,  1, 'Current',  2000.00, 'Active'),
(1011, 11,  2, 'Savings',  3500.00, 'Active'),
(1012, 12,  3, 'Current',  4500.00, 'Active'),
(1013, 13,  4, 'Savings',  6500.00, 'Active'),
(1014, 14,  5, 'Current',  5500.00, 'Active'),
(1015, 15,  1, 'Savings',  7200.00, 'Active'),
(1016, 16,  2, 'Current',  6200.00, 'Active'),
(1017, 17,  3, 'Savings',  8200.00, 'Active'),
(1018, 18,  4, 'Current',  9200.00, 'Active'),
(1019, 19,  5, 'Savings',  4200.00, 'Active'),
(1020, 20,  1, 'Current',  3200.00, 'Active'),
(1021, 21,  1, 'Savings',  4500.00, 'Active'),
(1022, 22,  2, 'Current', 12000.00, 'Active'),
(1023, 23,  3, 'Savings',  3200.00, 'Active'),
(1024, 24,  4, 'Current',   850.00, 'Active'),
(1025, 25,  5, 'Savings', 15000.00, 'Active'),
(1026, 26,  1, 'Current',  2100.00, 'Active'),
(1027, 27,  2, 'Savings',  6700.00, 'Active'),
(1028, 28,  3, 'Current',  9000.00, 'Active'),
(1029, 29,  4, 'Savings',  1100.00, 'Active'),
(1030, 30,  5, 'Current',  5400.00, 'Active'),
(1031, 31,  1, 'Savings', 13000.00, 'Active'),
(1032, 32,  2, 'Current',  4200.00, 'Active'),
(1033, 33,  3, 'Savings',  2500.00, 'Active'),
(1034, 34,  4, 'Current',  7800.00, 'Active'),
(1035, 35,  5, 'Savings',   190.00, 'Inactive'),
(1036, 36,  1, 'Current',  6600.00, 'Active'),
(1037, 37,  2, 'Savings',   300.00, 'Active'),
(1038, 38,  3, 'Current', 11500.00, 'Active'),
(1039, 39,  4, 'Savings',  8800.00, 'Active'),
(1040, 40,  5, 'Current', 20000.00, 'Active'),
(1041, 41,  1, 'Savings',  5500.00, 'Active'),
(1042, 42,  2, 'Current',  9300.00, 'Active'),
(1043, 43,  3, 'Savings',  1200.00, 'Active'),
(1044, 44,  4, 'Current',  4700.00, 'Active'),
(1045, 45,  5, 'Savings',  3600.00, 'Active'),
(1046, 46,  1, 'Current',  8000.00, 'Active');

INSERT INTO BankServices (ServiceName) VALUES
('Loan'),
('Insurance'),
('Bill Payment'),
('Credit Card'),
('Debit Card'),
('Mortgage'),
('Car Loan'),
('Student Loan'),
('Savings Account'),
('Current Account'),
('Fixed Deposit'),
('Foreign Currency Exchange'),
('Money Transfer'),
('Western Union'),
('Mobile Payment'),
('Internet Banking'),
('ATM Service'),
('Checkbook'),
('Investment Fund'),
('Treasury Bills'),
('Safe Deposit Box'),
('Pension Service'),
('Government Payments'),
('Zakat Payment'),
('Charity Donation');

INSERT INTO ServiceSubscriptions (CustomerID, ServiceID, Status) VALUES
(1,  1, 'Active'),
(2,  2, 'Active'),
(3,  3, 'Pending'),
(4,  1, 'Active'),
(5,  2, 'Pending'),
(6,  3, 'Active'),
(7,  1, 'Active'),
(8,  2, 'Pending'),
(9,  3, 'Active'),
(10, 1, 'Active'),
(11, 4, 'Active'),
(12, 5, 'Pending'),
(13, 6, 'Active'),
(14, 7, 'Active'),
(15, 8, 'Pending'),
(16, 9, 'Active'),
(17,10, 'Inactive'),
(18,11, 'Active'),
(19,12, 'Pending'),
(20,13, 'Active'),
(21,14, 'Active'),
(22,15, 'Pending'),
(23,16, 'Active'),
(24,17, 'Active'),
(25,18, 'Inactive'),
(26,19, 'Active'),
(27,20, 'Pending'),
(28, 1, 'Active'),
(29, 2, 'Active'),
(30, 3, 'Pending'),
(31, 4, 'Active'),
(32, 5, 'Active'),
(33, 6, 'Pending'),
(34, 7, 'Active'),
(35, 8, 'Inactive'),
(36, 9, 'Active'),
(37,10, 'Active'),
(38,11, 'Pending'),
(39,12, 'Active'),
(40,13, 'Active'),
(41,14, 'Pending'),
(42,15, 'Active'),
(43,16, 'Active'),
(44,17, 'Inactive'),
(45,18, 'Active'),
(46,19, 'Pending'),
-- Extra subscriptions to support Q8 (customers with 2+ active services)
(1,  4, 'Active'),
(2,  6, 'Active'),
(3,  7, 'Active'),
(4,  9, 'Active'),
(5,  4, 'Active'),
(7,  5, 'Active'),
(9,  7, 'Active'),
(10, 3, 'Active'),
(11, 2, 'Active'),
(28, 4, 'Active');

INSERT INTO Transactions (AccountNo, EmployeeID, TxnType, Amount, TxnDateTime, Description) VALUES
-- Recent transactions (last 90 days) for analytics queries
(1001,  1, 'Credit', 1000.00, DATEADD(DAY,-2,  GETDATE()), 'Cash deposit'),
(1002,  3, 'Credit', 2000.00, DATEADD(DAY,-5,  GETDATE()), 'Incoming transfer'),
(1003,  6, 'Credit',  500.00, DATEADD(DAY,-10, GETDATE()), 'Check deposit'),
(1004,  1, 'Credit', 1500.00, DATEADD(DAY,-15, GETDATE()), 'Cash deposit'),
(1005,  7, 'Credit', 3000.00, DATEADD(DAY,-20, GETDATE()), 'Salary'),
(1006, 10, 'Credit',  750.00, DATEADD(DAY,-22, GETDATE()), 'Cash deposit'),
(1007,  4, 'Credit', 1200.00, DATEADD(DAY,-25, GETDATE()), 'Incoming transfer'),
(1008,  6, 'Credit',  800.00, DATEADD(DAY,-28, GETDATE()), 'Check deposit'),
(1009,  8, 'Credit', 2500.00, DATEADD(DAY,-30, GETDATE()), 'Grant'),
(1010,  2, 'Credit',  400.00, DATEADD(DAY,-33, GETDATE()), 'Cash deposit'),
(1011,  3, 'Credit', 1600.00, DATEADD(DAY,-35, GETDATE()), 'Incoming transfer'),
(1012,  5, 'Credit',  900.00, DATEADD(DAY,-40, GETDATE()), 'Cash deposit'),
(1013,  7, 'Credit', 1100.00, DATEADD(DAY,-45, GETDATE()), 'Insurance premium'),
(1014,  9, 'Credit', 1300.00, DATEADD(DAY,-50, GETDATE()), 'Check deposit'),
(1015,  1, 'Credit',  700.00, DATEADD(DAY,-55, GETDATE()), 'Cash deposit'),
(1016,  4, 'Debit',   500.00, DATEADD(DAY,-3,  GETDATE()), 'Cash withdrawal'),
(1017,  6, 'Debit',  1200.00, DATEADD(DAY,-6,  GETDATE()), 'ATM withdrawal'),
(1018,  8, 'Debit',   350.00, DATEADD(DAY,-9,  GETDATE()), 'Card purchase'),
(1019, 10, 'Debit',  2200.00, DATEADD(DAY,-12, GETDATE()), 'Outgoing transfer'),
(1020,  2, 'Debit',   450.00, DATEADD(DAY,-18, GETDATE()), 'Cash withdrawal'),
(1021,  3, 'Debit',   800.00, DATEADD(DAY,-21, GETDATE()), 'Bill payment'),
(1022,  5, 'Debit',  1500.00, DATEADD(DAY,-24, GETDATE()), 'Cash withdrawal'),
(1023,  7, 'Debit',   275.00, DATEADD(DAY,-27, GETDATE()), 'Purchase'),
(1024,  9, 'Debit',   950.00, DATEADD(DAY,-31, GETDATE()), 'Outgoing transfer'),
(1025,  1, 'Debit',   600.00, DATEADD(DAY,-36, GETDATE()), 'Cash withdrawal'),
(1026,  4, 'Debit',  1800.00, DATEADD(DAY,-42, GETDATE()), 'Loan payment'),
(1027,  6, 'Debit',   420.00, DATEADD(DAY,-48, GETDATE()), 'Phone bills'),
(1028,  8, 'Debit',  1300.00, DATEADD(DAY,-54, GETDATE()), 'Cash withdrawal'),
(1029,  2, 'Debit',   700.00, DATEADD(DAY,-60, GETDATE()), 'Online purchase'),
(1030,  5, 'Debit',   550.00, DATEADD(DAY,-65, GETDATE()), 'Cash withdrawal'),
(1031,  9, 'Credit', 5000.00, DATEADD(DAY,-70, GETDATE()), 'Personal loan'),
(1032,  3, 'Debit',  1200.00, DATEADD(DAY,-75, GETDATE()), 'Loan repayment'),
(1033,  7, 'Credit', 3000.00, DATEADD(DAY,-80, GETDATE()), 'Incoming transfer'),
(1034,  1, 'Debit',   850.00, DATEADD(DAY,-85, GETDATE()), 'Electricity bill'),
(1035,  5, 'Debit',   190.00, DATEADD(DAY,-88, GETDATE()), 'Service fee'),
(1036,  8, 'Credit', 2500.00, DATEADD(DAY,-1,  GETDATE()), 'Cash deposit'),
(1037,  2, 'Debit',   300.00, DATEADD(DAY,-4,  GETDATE()), 'Cash withdrawal'),
(1038,  4, 'Credit', 1500.00, DATEADD(DAY,-7,  GETDATE()), 'Incoming transfer'),
(1039,  6, 'Debit',  2000.00, DATEADD(DAY,-11, GETDATE()), 'Bill payment'),
(1040, 10, 'Credit', 5000.00, DATEADD(DAY,-14, GETDATE()), 'Salary'),
-- Older transactions (beyond 90 days) for 12-month monthly summaries
(1001,  1, 'Credit', 2000.00, DATEADD(DAY,-100, GETDATE()), 'Salary'),
(1002,  3, 'Debit',   800.00, DATEADD(DAY,-110, GETDATE()), 'Cash withdrawal'),
(1003,  6, 'Credit', 3500.00, DATEADD(DAY,-120, GETDATE()), 'Incoming transfer'),
(1004,  1, 'Debit',   600.00, DATEADD(DAY,-130, GETDATE()), 'Bill payment'),
(1005,  7, 'Credit', 1500.00, DATEADD(DAY,-140, GETDATE()), 'Salary'),
(1006, 10, 'Debit',   400.00, DATEADD(DAY,-150, GETDATE()), 'ATM withdrawal'),
(1007,  4, 'Credit', 2200.00, DATEADD(DAY,-160, GETDATE()), 'Incoming transfer'),
(1008,  6, 'Debit',   950.00, DATEADD(DAY,-170, GETDATE()), 'Card purchase'),
(1009,  8, 'Credit', 4000.00, DATEADD(DAY,-180, GETDATE()), 'Savings'),
(1010,  2, 'Debit',  1100.00, DATEADD(DAY,-190, GETDATE()), 'Loan payment'),
(1011,  3, 'Credit', 1800.00, DATEADD(DAY,-200, GETDATE()), 'Cash deposit'),
(1012,  5, 'Debit',   750.00, DATEADD(DAY,-210, GETDATE()), 'Cash withdrawal'),
-- Suspicious / large transactions for Q10
(1040,  10, 'Debit', 95000.00, DATEADD(DAY,-1,  GETDATE()), 'Large outgoing wire'),
(1025,   1, 'Debit', 88000.00, DATEADD(DAY,-2,  GETDATE()), 'Unusual withdrawal'),
(1031,   9, 'Credit',75000.00, DATEADD(DAY,-3,  GETDATE()), 'Large cash deposit');

-- ============================================================
--  QUICK VERIFICATION SELECTS
-- ============================================================
SELECT AccountNo, Amount, TxnDateTime, Description
FROM Transactions
ORDER BY TxnDateTime DESC;


SELECT * FROM Branches;
SELECT * FROM Employees;
SELECT * FROM Customers;
SELECT * FROM Accounts;
SELECT * FROM Transactions;
SELECT * FROM BankServices;
SELECT * FROM ServiceSubscriptions;

-- ============================================================
--  CRUD OPERATIONS
-- ============================================================

-- CRUD: Customers ------------

-- CREATE (prevent duplicate NationalID)
INSERT INTO Customers (FullName, NationalID, Phone, Email, City)
SELECT 'Sara Ahmed', '30202012345678', '01055555555', 'sara@email.com', 'Cairo'
WHERE NOT EXISTS (
    SELECT 1 FROM Customers WHERE NationalID = '30202012345678'
);

-- READ (each customer with their total account count)
SELECT
    C.CustomerID,  -- عرض كل عميل مع عدد العمليات اللي عملها حتي لو معملش اي عمليه يعرض بيانات العميل
    C.FullName,
    C.City,
    COUNT(A.AccountNo) AS TotalAccounts
FROM Customers C
LEFT JOIN Accounts A ON C.CustomerID = A.CustomerID
GROUP BY C.CustomerID, C.FullName, C.City;

-- UPDATE (change phone number, scoped to Cairo)
UPDATE Customers
SET    Phone = '01122223333'
WHERE  CustomerID = 1 AND City = 'Cairo';

-- DELETE (soft delete: mark city as Inactive instead of removing row)
UPDATE Customers                          --  Inactive  بدل ما امسحه عملت حالته 
SET    City = 'Inactive'
WHERE  CustomerID = 5;


SELECT *
FROM Customers
WHERE CustomerID = 5;



------------ CRUD: Accounts ------------

-- CREATE
INSERT INTO Accounts (AccountNo, CustomerID, BranchID, AccountType, Balance, Status)
VALUES (4003, 1, 1, 'Savings', 3000, 'Active');

-- READ (account with customer and branch names)
SELECT
    A.AccountNo,
    C.FullName,
    B.BranchName,                          --(عرض الحساب مع اسم العميل والفرع)
    A.AccountType,
    A.Balance
FROM Accounts A
JOIN Customers C ON A.CustomerID = C.CustomerID
JOIN Branches  B ON A.BranchID   = B.BranchID;

-- UPDATE (top-up balance)
UPDATE Accounts
SET    Balance = Balance + 500
WHERE  AccountNo = 1001;

-- DELETE (soft delete: close the account)
UPDATE Accounts
SET    Status = 'Closed'
WHERE  AccountNo = 4003;

------------ CRUD: Transactions ------------

-- CREATE (wrapped in transaction to keep balance in sync)
BEGIN TRANSACTION;

INSERT INTO Transactions (AccountNo, EmployeeID, TxnType, Amount, Description)
VALUES (1001, 4, 'Credit', 1000, 'Cash Deposit');

UPDATE Accounts
SET    Balance = Balance + 1000
WHERE  AccountNo = 1001;

COMMIT;

-- READ (transaction with customer and account info)
SELECT
    T.TxnID,
    C.FullName,
    A.AccountNo,
    T.TxnType,
    T.Amount,
    T.TxnDateTime
FROM Transactions T
JOIN Accounts   A ON T.AccountNo  = A.AccountNo
JOIN Customers  C ON A.CustomerID = C.CustomerID;

-- UPDATE (fix description)
UPDATE Transactions
SET    Description = 'ATM Withdrawal'
WHERE  TxnID = 3;

-- DELETE (remove an incorrect test record)
DELETE FROM Transactions
WHERE  TxnID = 10;

-- ============================================================
-- Q1) Customer Master View
-- ============================================================
CREATE VIEW vw_CustomerMaster AS
SELECT
    c.CustomerID,
    c.FullName,
    c.NationalID,
    c.Phone,
    c.Email,
    c.City,
    COUNT(DISTINCT a.AccountNo)   AS TotalAccounts,
    ISNULL(SUM(a.Balance), 0)     AS TotalBalance
FROM Customers c
LEFT JOIN Accounts a ON a.CustomerID = c.CustomerID
GROUP BY c.CustomerID, c.FullName, c.NationalID, c.Phone, c.Email, c.City;
GO

-- Top 20 customers by TotalBalance
SELECT TOP 20 *
FROM vw_CustomerMaster
ORDER BY TotalBalance DESC;



-- ============================================================
-- Q2) Account Portfolio View (Status + Branch)
-- ============================================================
CREATE VIEW vw_AccountPortfolio AS
SELECT
    a.AccountNo,
    c.FullName      AS CustomerName,
    b.BranchName,
    a.AccountType,
    a.OpenedOn,
    a.Status,
    a.Balance
FROM Accounts a
JOIN Customers c ON c.CustomerID = a.CustomerID
JOIN Branches  b ON b.BranchID   = a.BranchID;
GO

-- All Inactive / Closed accounts
SELECT *
FROM vw_AccountPortfolio
WHERE Status IN ('Inactive', 'Closed')
ORDER BY OpenedOn DESC;



-- ============================================================
-- Q3) Monthly Transaction Summary (Credits / Debits / Net)
-- ============================================================
SELECT
    FORMAT(t.TxnDateTime, 'yyyy-MM')                                         AS YearMonth,
    SUM(CASE WHEN t.TxnType = 'Credit' THEN t.Amount ELSE 0 END)             AS TotalCreditAmount,
    SUM(CASE WHEN t.TxnType = 'Debit'  THEN t.Amount ELSE 0 END)             AS TotalDebitAmount,
    SUM(CASE WHEN t.TxnType = 'Credit' THEN t.Amount ELSE -t.Amount END)     AS NetFlow,
    COUNT(*)                                                                  AS TransactionsCount
FROM Transactions t
WHERE t.TxnDateTime >= DATEADD(MONTH, -12, GETDATE())
GROUP BY FORMAT(t.TxnDateTime, 'yyyy-MM')
ORDER BY YearMonth DESC;



-- ============================================================
-- Q4) Customer Statement View (Transaction History)
-- ============================================================
CREATE VIEW vw_CustomerStatement AS
SELECT
    c.CustomerID,
    c.FullName      AS CustomerName,
    a.AccountNo,
    t.TxnDateTime,
    t.TxnType,
    t.Amount,
    t.Description
FROM Transactions t
JOIN Accounts  a ON a.AccountNo  = t.AccountNo
JOIN Customers c ON c.CustomerID = a.CustomerID;
GO

-- Statement for a specific customer and date range
DECLARE @CustomerID INT  = 1;
DECLARE @StartDate  DATE = '2024-01-01';
DECLARE @EndDate    DATE = '2024-12-31';

SELECT *
FROM vw_CustomerStatement
WHERE CustomerID = @CustomerID
  AND CAST(TxnDateTime AS DATE) BETWEEN @StartDate AND @EndDate
ORDER BY TxnDateTime;



-- ============================================================
-- Q5) Top Customers by Activity (Last 90 Days) with Ranking
-- ============================================================
SELECT TOP 10
    c.CustomerID,
    c.FullName,
    COUNT(t.TxnID)                                                        AS TransactionCount,
    SUM(CASE WHEN t.TxnType = 'Credit' THEN t.Amount ELSE 0 END)         AS TotalCredit,
    SUM(CASE WHEN t.TxnType = 'Debit'  THEN t.Amount ELSE 0 END)         AS TotalDebit,
    SUM(CASE WHEN t.TxnType = 'Credit' THEN t.Amount ELSE -t.Amount END) AS NetFlow,
    ROW_NUMBER() OVER (ORDER BY COUNT(t.TxnID) DESC)                     AS ActivityRank
FROM Customers c
JOIN Accounts     a ON a.CustomerID = c.CustomerID
JOIN Transactions t ON t.AccountNo  = a.AccountNo
WHERE t.TxnDateTime >= DATEADD(DAY, -90, GETDATE())
GROUP BY c.CustomerID, c.FullName
ORDER BY TransactionCount DESC;
GO


-- ============================================================
-- Q6) Branch Performance View (Last 30 Days)
-- ============================================================
CREATE VIEW vw_BranchPerformance AS
SELECT
    b.BranchName,
    COUNT(DISTINCT a.CustomerID)                                                   AS CustomersCount,
    COUNT(t.TxnID)                                                                 AS TransactionsCount,
    ISNULL(SUM(t.Amount), 0)                                                       AS TotalTransactionValue,
    ISNULL(SUM(CASE WHEN t.TxnType='Credit' THEN t.Amount ELSE -t.Amount END), 0) AS NetFlow
FROM Branches b
LEFT JOIN Accounts     a ON a.BranchID  = b.BranchID
LEFT JOIN Transactions t ON t.AccountNo = a.AccountNo
    AND t.TxnDateTime >= DATEADD(DAY, -30, GETDATE())
GROUP BY b.BranchID, b.BranchName;
GO

SELECT *
FROM vw_BranchPerformance
ORDER BY NetFlow DESC;



-- ============================================================
-- Q7) Employee Activity Report - Top 10 (Last 30 Days)
-- ============================================================
SELECT TOP 10
    e.EmployeeID,
    e.FullName      AS EmployeeName,
    e.Role,
    b.BranchName,
    COUNT(t.TxnID)  AS TransactionsHandled,
    SUM(t.Amount)   AS TotalValueHandled
FROM Employees e
JOIN Branches     b ON b.BranchID   = e.BranchID
JOIN Transactions t ON t.EmployeeID = e.EmployeeID
WHERE t.TxnDateTime >= DATEADD(DAY, -30, GETDATE())
GROUP BY e.EmployeeID, e.FullName, e.Role, b.BranchName
ORDER BY TransactionsHandled DESC;



-- ============================================================
-- Q8) Service Adoption & Cross-Sell View
-- ============================================================
CREATE VIEW vw_ServiceAdoption AS
SELECT
    c.CustomerID,
    c.FullName                       AS CustomerName,
    COUNT(ss.SubscriptionID)         AS ActiveServicesCount,
    STRING_AGG(bs.ServiceName, ', ') AS ServiceNames
FROM Customers c
LEFT JOIN ServiceSubscriptions ss ON ss.CustomerID = c.CustomerID
    AND ss.Status = 'Active'
LEFT JOIN BankServices         bs ON bs.ServiceID  = ss.ServiceID
GROUP BY c.CustomerID, c.FullName;
GO

-- Customers with 2 or more active services
SELECT *
FROM vw_ServiceAdoption
WHERE ActiveServicesCount >= 2
ORDER BY ActiveServicesCount DESC;



-- ============================================================
-- Q9) Inactive Accounts - No Transactions in Last 60 Days
-- ============================================================
SELECT
    a.AccountNo,
    c.FullName                                    AS CustomerName,
    b.BranchName,
    a.Balance,
    MAX(t.TxnDateTime)                            AS LastTxnDate,
    DATEDIFF(DAY, MAX(t.TxnDateTime), GETDATE())  AS DaysSinceLastTxn
FROM Accounts a
JOIN Customers  c ON c.CustomerID = a.CustomerID
JOIN Branches   b ON b.BranchID   = a.BranchID
LEFT JOIN Transactions t ON t.AccountNo = a.AccountNo
WHERE a.Status = 'Active'
GROUP BY a.AccountNo, c.FullName, b.BranchName, a.Balance
HAVING MAX(t.TxnDateTime) < DATEADD(DAY, -60, GETDATE())
    OR MAX(t.TxnDateTime) IS NULL
ORDER BY DaysSinceLastTxn DESC;


-- ============================================================
-- Q10) Suspicious Transaction Detection (Rule-Based)
-- Flags transactions exceeding AVG + 3*STDDEV per branch
-- ============================================================
WITH BranchStats AS (
    SELECT
        a.BranchID,
        AVG(t.Amount)   AS AvgAmount,
        STDEV(t.Amount) AS StdAmount
    FROM Transactions t
    JOIN Accounts a ON a.AccountNo = t.AccountNo
    GROUP BY a.BranchID
)
SELECT
    t.TxnID,
    a.AccountNo,
    c.FullName                                             AS CustomerName,
    b.BranchName,
    t.TxnType,
    t.Amount,
    t.TxnDateTime,
    CAST(bs.AvgAmount AS DECIMAL(18,2))                    AS BranchAvgAmount,
    CAST(bs.AvgAmount + 3*bs.StdAmount AS DECIMAL(18,2))   AS SuspiciousThreshold,
    'Exceeds AVG + 3 x STDDEV for branch'                  AS FlagReason
FROM Transactions t
JOIN Accounts    a  ON a.AccountNo  = t.AccountNo
JOIN Customers   c  ON c.CustomerID = a.CustomerID
JOIN Branches    b  ON b.BranchID   = a.BranchID
JOIN BranchStats bs ON bs.BranchID  = a.BranchID
WHERE t.Amount > (bs.AvgAmount + 3 * bs.StdAmount)
ORDER BY t.Amount DESC;

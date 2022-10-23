USE bank_system;

INSERT INTO bank 
VALUES
('prior'),
('belinvest'),
('belarus'),
('BSB')

INSERT INTO city
VALUES 
('minsk'),
('gomel'),
('brest'),
('kiev'),
('pinsk')

INSERT INTO branch
VALUES
(1,1),
(1,1),
(2,2),
(2,1),
(3,3)

INSERT INTO social_status
VALUES
('disabled person'),
('persioner'),
('student'),
('homeless'),
('unemployed')

INSERT INTO client
VALUES
('sasha', 3),
('tom', 4),
('bob', 2),
('joe', 5),
('vika', 1)

INSERT INTO account
VALUES
(1000,1,5),
(2000,2,4),
(123,3,3),
(5000,4,2),
(200,5,1)

INSERT INTO card
VALUES
(100, 1),
(600, 2),
(50, 3),
(2000,4),
(15,5)
USE bank_system;

INSERT INTO bank 
VALUES
('prior'),
('belinvest'),
('belarus'),
('BSB'),
('alpha')

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
('pensioner'),
('student'),
('homeless'),
('unemployed'),
('no client for status')

INSERT INTO client
VALUES
('sasha', 3),
('tom', 4),
('bob', 2),
('joe', 5),
('vika', 1),
('no account client', 3)

INSERT INTO account
VALUES
(1000,1,5),
(2000,2,4),
(123,3,3),
(5000,4,2),
(200,5,1),  --5
(200,1,1),  --6
(0,2,3),
(1234,3,4),
(3000,4,5),
(130, 5,1) --10

INSERT INTO card
VALUES
(100, 1),
(600, 2),
(50, 3),
(2000,4),
(15,5),
(500, 6),
(1500, 9),
(50,10),
(90, 1),
(530, 2),
(50, 3),
(400,4),
(37,5),
(260, 6),
(300, 9),
(50,10),
(50,0)

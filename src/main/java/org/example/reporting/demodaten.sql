INSERT INTO Kunde (Kunden_ID, Vorname, Nachname, Groesse_cm, Geburtsdatum, Geschlecht) VALUES
(1, 'Anna', 'Mueller', 165, '1990-01-01', 'weiblich'),
(2, 'Hans', 'Schmidt', 180, '1985-05-12', 'maennlich'),
(3, 'Maria', 'Fischer', 155, '1988-07-20', 'weiblich'),
(4, 'Peter', 'Bauer', 170, '1983-02-14', 'maennlich'),
(5, 'Sofia', 'Klein', 160, '1987-06-01', 'weiblich'),
(6, 'Max', 'Meyer', 190, '1982-11-23', 'maennlich'),
(7, 'Laura', 'Huber', 165, '1989-03-12', 'weiblich'),
(8, 'Julia', 'Wagner', 175, '1987-08-17', 'weiblich'),
(9, 'Philipp', 'Schneider', 185, '1986-04-22', 'maennlich'),
(10, 'Lena', 'Richter', 150, '1991-09-30', 'weiblich'),
(11, 'Leon', 'Gross', 180, '1984-01-11', 'maennlich'),
(12, 'Anna', 'Becker', 160, '1988-05-21', 'weiblich'),
(13, 'Tim', 'Werner', 170, '1983-07-01', 'maennlich'),
(14, 'Sara', 'Koch', 165, '1987-02-14', 'weiblich'),
(15, 'Lukas', 'Neumann', 180, '1985-09-23', 'maennlich'),
(16, 'Lea', 'Schubert', 155, '1989-12-31', 'weiblich'),
(17, 'Martin', 'Lang', 190, '1982-06-30', 'maennlich'),
(18, 'Johanna', 'Schmid', 160, '1988-04-15', 'weiblich'),
(19, 'Tobias', 'Mueller', 170, '1983-08-11', 'maennlich'),
(20, 'Laura', 'Fischer', 165, '1987-01-01', 'weiblich'),
(21, 'Matthias', 'Bauer', 180, '1986-07-12', 'maennlich'),
(22, 'Sophie', 'Klein', 155, '1989-05-20', 'weiblich'),
(23, 'Jan', 'Meyer', 190, '1982-02-14', 'maennlich'),
(24, 'Elena', 'Huber', 160, '1987-06-01', 'weiblich'),
(25, 'Maximilian', 'Wagner', 170, '1983-11-23', 'maennlich'),
(26, 'Leah', 'Schneider', 175, '1988-03-12', 'weiblich'),
(27, 'Thomas', 'Richter', 180, '1985-04-22', 'maennlich');



INSERT INTO Prozess (Prozess_ID, Kunden_ID, Status, Trainingsvariante_aktuell) VALUES
('12345678-1234-1234-1234-123456789012', 1, 'aktiv', 'Kraft-Zirkel'),
('23456789-1234-1234-1234-123456789012', 2, 'aktiv', 'Kraft-Zirkel'),
('34567890-1234-1234-1234-123456789012', 3, 'aktiv', 'Kraft-Ausdauer-Zirkel'),
('45678901-1234-1234-1234-123456789012', 4, 'aktiv', 'Kraft-Zirkel'),
('56789012-1234-1234-1234-123456789012', 5, 'aktiv', 'Kraft-Ausdauer-Zirkel'),
('67890123-1234-1234-1234-123456789012', 6, 'aktiv', 'Kraft-Zirkel'),
('78901234-1234-1234-1234-123456789012', 7, 'aktiv', 'Kraft-Ausdauer-Zirkel'),
('89012345-1234-1234-1234-123456789012', 8, 'aktiv', 'Kraft-Zirkel'),
('90123456-1234-1234-1234-123456789012', 9, 'aktiv', 'Kraft-Ausdauer-Zirkel'),
('01234567-1234-1234-1234-123456789012', 10, 'aktiv', 'Kraft-Zirkel'),
('12345678-1234-1234-1234-123456789013', 11, 'aktiv', 'Kraft-Ausdauer-Zirkel'),
('23456789-1234-1234-1234-123456789013', 12, 'aktiv', 'Kraft-Zirkel'),
('34567890-1234-1234-1234-123456789013', 13, 'aktiv', 'Kraft-Ausdauer-Zirkel'),
('45678901-1234-1234-1234-123456789013', 14, 'aktiv', 'Kraft-Zirkel'),
('56789012-1234-1234-1234-123456789013', 15, 'aktiv', 'Kraft-Ausdauer-Zirkel'),
('67890123-1234-1234-1234-123456789013', 16, 'aktiv', 'Kraft-Zirkel'),
('78901234-1234-1234-1234-123456789013', 17, 'aktiv', 'Kraft-Ausdauer-Zirkel'),
('89012345-1234-1234-1234-123456789013', 18, 'aktiv', 'Kraft-Zirkel'),
('90123456-1234-1234-1234-123456789013', 19, 'aktiv', 'Kraft-Ausdauer-Zirkel'),
('01234567-1234-1234-1234-123456789014', 20, 'aktiv', 'Kraft-Zirkel'),
('12345678-1234-1234-1234-123456789014', 21, 'aktiv', 'Kraft-Ausdauer-Zirkel'),
('23456789-1234-1234-1234-123456789014', 22, 'aktiv', 'Kraft-Zirkel'),
('34567890-1234-1234-1234-123456789014', 23, 'aktiv', 'Kraft-Ausdauer-Zirkel'),
('45678901-1234-1234-1234-123456789014', 24, 'aktiv', 'Kraft-Zirkel'),
('56789012-1234-1234-1234-123456789014', 25, 'aktiv', 'Kraft-Ausdauer-Zirkel'),
('67890123-1234-1234-1234-123456789014', 26, 'aktiv', 'Kraft-Zirkel'),
('78901234-1234-1234-1234-123456789014', 27, 'aktiv', 'Kraft-Ausdauer-Zirkel');


INSERT INTO Untersuchung (Untersuchung_ID, Prozess_ID, Typ, Testtag_zeit, Gewicht_kg, Skelettmuskelmasse_kg, Koerperfettmassekg, BMI, KoerperfettProz)
VALUES
(87, '12345678-1234-1234-1234-123456789012', '1', '2022-10-03', 78, 43, 16, 20, 15),
(88, '23456789-1234-1234-1234-123456789012', '1', '2022-10-06', 78, 43, 16, 20, 15),
(89, '34567890-1234-1234-1234-123456789012', '1', '2022-10-08', 78, 43, 16, 20, 15),
(90, '45678901-1234-1234-1234-123456789012', '1', '2022-10-10', 78, 43, 16, 20, 15),
(91, '56789012-1234-1234-1234-123456789012', '1', '2022-10-20', 78, 43, 16, 20, 15),
(92, '67890123-1234-1234-1234-123456789012', '1', '2022-10-24', 78, 43, 16, 20, 15),
(93, '78901234-1234-1234-1234-123456789012', '1', '2022-11-06', 78, 43, 16, 20, 15),
(94, '89012345-1234-1234-1234-123456789012', '1', '2022-11-08', 78, 43, 16, 20, 15),
(95, '90123456-1234-1234-1234-123456789012', '1', '2022-11-14', 78, 43, 16, 20, 15),
(96, '01234567-1234-1234-1234-123456789012', '1', '2022-11-17', 78, 43, 16, 20, 15),
(97, '12345678-1234-1234-1234-123456789013', '1', '2022-11-22', 78, 43, 16, 20, 15),
(98, '23456789-1234-1234-1234-123456789013', '1', '2022-11-30', 78, 43, 16, 20, 15),
(99, '34567890-1234-1234-1234-123456789013', '1', '2022-12-01', 78, 43, 16, 20, 15),
(100, '45678901-1234-1234-1234-123456789013', '1', '2022-12-02', 78, 43, 16, 20, 15),
(101, '56789012-1234-1234-1234-123456789013', '1', '2022-12-04', 78, 43, 16, 20, 15),
(102, '67890123-1234-1234-1234-123456789013', '1', '2022-10-25', 78, 43, 16, 20, 15),
(103, '78901234-1234-1234-1234-123456789013', '1', '2022-10-04', 78, 43, 16, 20, 15),
(104, '89012345-1234-1234-1234-123456789013', '1', '2022-10-03', 78, 43, 16, 20, 15),
(105, '90123456-1234-1234-1234-123456789012', '1', '2022-12-07', 78, 43, 16, 20, 15),
(106, '01234567-1234-1234-1234-123456789014', '1', '2022-12-07', 78, 43, 16, 20, 15),
(107, '12345678-1234-1234-1234-123456789014', '1', '2022-12-07', 78, 43, 16, 20, 15),
(108, '23456789-1234-1234-1234-123456789014', '1', '2022-12-08', 78, 43, 16, 20, 15),
(109, '34567890-1234-1234-1234-123456789014', '1', '2022-12-10', 78, 43, 16, 20, 15),
(110, '45678901-1234-1234-1234-123456789014', '1', '2022-10-11', 78, 43, 16, 20, 15),
(111, '56789012-1234-1234-1234-123456789014', '1', '2022-12-15', 78, 43, 16, 20, 15),
(112, '67890123-1234-1234-1234-123456789014', '1', '2022-12-17', 78, 43, 16, 20, 15),
(113, '78901234-1234-1234-1234-123456789014', '1', '2022-10-12', 78, 43, 16, 20, 15);



insert into Training (Prozess_ID, Trainingsdatum, Trainingsvariante, Unterschrift_Trainer, Unterschrift_Kunde)
VALUES
('12345678-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('12345678-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('12345678-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('12345678-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('12345678-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('12345678-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('12345678-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('12345678-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('12345678-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('12345678-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('12345678-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('12345678-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('12345678-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('12345678-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('12345678-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('12345678-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('12345678-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('12345678-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('12345678-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),


('23456789-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('23456789-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('23456789-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('23456789-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('23456789-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('23456789-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('23456789-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('23456789-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('23456789-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('23456789-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('23456789-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('23456789-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('23456789-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('23456789-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('23456789-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('23456789-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('23456789-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('23456789-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),


('34567890-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('34567890-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('34567890-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('34567890-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('34567890-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('34567890-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('34567890-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('34567890-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('34567890-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('34567890-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('34567890-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('34567890-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('34567890-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('34567890-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('34567890-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('34567890-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('34567890-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('34567890-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('34567890-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('34567890-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),

('45678901-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('45678901-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('45678901-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('45678901-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('45678901-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('45678901-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('45678901-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('45678901-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('45678901-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('45678901-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('45678901-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('45678901-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('45678901-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('45678901-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('45678901-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('45678901-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('45678901-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('45678901-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('45678901-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),


('56789012-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('56789012-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('56789012-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('56789012-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('56789012-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('56789012-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('56789012-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('56789012-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('56789012-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('56789012-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('56789012-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('56789012-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('56789012-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('56789012-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('56789012-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('56789012-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('56789012-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),

('67890123-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('67890123-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('67890123-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('67890123-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('67890123-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('67890123-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('67890123-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('67890123-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('67890123-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('67890123-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('67890123-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('67890123-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('67890123-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('67890123-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),

('78901234-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('78901234-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('78901234-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('78901234-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('78901234-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('78901234-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('78901234-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('78901234-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('78901234-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('78901234-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('78901234-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('78901234-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('78901234-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('78901234-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('78901234-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('78901234-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),

('89012345-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('89012345-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('89012345-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('89012345-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('89012345-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('89012345-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('89012345-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('89012345-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('89012345-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),



('90123456-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('90123456-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('90123456-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('90123456-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('90123456-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),
('90123456-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Zirkel', NULL, NULL),


('01234567-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('01234567-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('01234567-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('01234567-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('01234567-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('01234567-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('01234567-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('01234567-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('01234567-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('01234567-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('01234567-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('01234567-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('01234567-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('01234567-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('01234567-1234-1234-1234-123456789012', '2022-11-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),

('12345678-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Zirkel', NULL, NULL),
('12345678-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Zirkel', NULL, NULL),
('12345678-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Zirkel', NULL, NULL),
('12345678-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Zirkel', NULL, NULL),
('12345678-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Zirkel', NULL, NULL),
('12345678-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Zirkel', NULL, NULL),
('12345678-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Zirkel', NULL, NULL),
('12345678-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Zirkel', NULL, NULL),
('12345678-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Zirkel', NULL, NULL),
('12345678-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Zirkel', NULL, NULL),
('12345678-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Zirkel', NULL, NULL),

('23456789-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('23456789-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('23456789-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('23456789-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('23456789-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('23456789-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('23456789-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),


('34567890-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Zirkel', NULL, NULL),
('34567890-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Zirkel', NULL, NULL),
('34567890-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Zirkel', NULL, NULL),
('34567890-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Zirkel', NULL, NULL),
('34567890-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Zirkel', NULL, NULL),
('34567890-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Zirkel', NULL, NULL),
('34567890-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Zirkel', NULL, NULL),
('34567890-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Zirkel', NULL, NULL),
('34567890-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Zirkel', NULL, NULL),
('34567890-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Zirkel', NULL, NULL),

('45678901-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('45678901-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('45678901-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('45678901-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('45678901-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('45678901-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('45678901-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),

('56789012-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Zirkel', NULL, NULL),
('56789012-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Zirkel', NULL, NULL),
('56789012-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Zirkel', NULL, NULL),
('56789012-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Zirkel', NULL, NULL),
('56789012-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Zirkel', NULL, NULL),
('56789012-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Zirkel', NULL, NULL),
('56789012-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Zirkel', NULL, NULL),
('56789012-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Zirkel', NULL, NULL),

('67890123-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('67890123-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('67890123-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('67890123-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('67890123-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('67890123-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('67890123-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('67890123-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),

('78901234-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Zirkel', NULL, NULL),
('78901234-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Zirkel', NULL, NULL),
('78901234-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Zirkel', NULL, NULL),
('78901234-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Zirkel', NULL, NULL),
('78901234-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Zirkel', NULL, NULL),
('78901234-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Zirkel', NULL, NULL),
('78901234-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Zirkel', NULL, NULL),
('78901234-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Zirkel', NULL, NULL),



('89012345-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('89012345-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('89012345-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('89012345-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('89012345-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('89012345-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('89012345-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('89012345-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),

('90123456-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Zirkel', NULL, NULL),
('90123456-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Zirkel', NULL, NULL),
('90123456-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Zirkel', NULL, NULL),
('90123456-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Zirkel', NULL, NULL),
('90123456-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Zirkel', NULL, NULL),
('90123456-1234-1234-1234-123456789013', '2022-12-14', 'Kraft-Zirkel', NULL, NULL),

('01234567-1234-1234-1234-123456789014', '2022-12-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('01234567-1234-1234-1234-123456789014', '2022-12-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('01234567-1234-1234-1234-123456789014', '2022-12-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('01234567-1234-1234-1234-123456789014', '2022-12-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('01234567-1234-1234-1234-123456789014', '2022-12-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('01234567-1234-1234-1234-123456789014', '2022-12-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('01234567-1234-1234-1234-123456789014', '2022-12-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),

('12345678-1234-1234-1234-123456789014', '2022-12-14', 'Kraft-Zirkel', NULL, NULL),
('12345678-1234-1234-1234-123456789014', '2022-12-14', 'Kraft-Zirkel', NULL, NULL),
('12345678-1234-1234-1234-123456789014', '2022-12-14', 'Kraft-Zirkel', NULL, NULL),
('12345678-1234-1234-1234-123456789014', '2022-12-14', 'Kraft-Zirkel', NULL, NULL),
('12345678-1234-1234-1234-123456789014', '2022-12-14', 'Kraft-Zirkel', NULL, NULL),

('23456789-1234-1234-1234-123456789014', '2022-12-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('23456789-1234-1234-1234-123456789014', '2022-12-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('23456789-1234-1234-1234-123456789014', '2022-12-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('23456789-1234-1234-1234-123456789014', '2022-12-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),

('34567890-1234-1234-1234-123456789014', '2022-12-14', 'Kraft-Zirkel', NULL, NULL),
('34567890-1234-1234-1234-123456789014', '2022-12-14', 'Kraft-Zirkel', NULL, NULL),
('34567890-1234-1234-1234-123456789014', '2022-12-14', 'Kraft-Zirkel', NULL, NULL),

('45678901-1234-1234-1234-123456789014', '2022-12-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('45678901-1234-1234-1234-123456789014', '2022-12-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),
('45678901-1234-1234-1234-123456789014', '2022-12-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),

('56789012-1234-1234-1234-123456789014', '2022-12-14', 'Kraft-Zirkel', NULL, NULL),
('56789012-1234-1234-1234-123456789014', '2022-12-14', 'Kraft-Zirkel', NULL, NULL),

('67890123-1234-1234-1234-123456789014', '2022-12-14', 'Kraft-Ausdauer-Zirkel', NULL, NULL),

('78901234-1234-1234-1234-123456789014', '2022-12-14', 'Kraft-Zirkel', NULL, NULL);
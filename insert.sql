-- Vkládání dat do tabulky Klient
INSERT INTO Klient (jmeno, prijmeni, email, telefon) VALUES
('Jan', 'Novák', 'jan.novak@example.com', '123456789'),
('Petra', 'Dvořáková', 'petra.dvorakova@example.com', '987654321'),
('Lukáš', 'Svoboda', 'lukas.svoboda@example.com', '111222333'),
('Eva', 'Kučerová', 'eva.kucerova@example.com', '444555666'),
('Tomáš', 'Král', 'tomas.kral@example.com', '777888999'),
('Marie', 'Bartošová', 'marie.bartosova@example.com', '000111222'),
('Ondřej', 'Havel', 'ondrej.havel@example.com', '333444555');

-- Vkládání dat do tabulky Zajezd
INSERT INTO Zajezd (nazev, destinace, datum_odjezdu, datum_prijezdu, cena) VALUES
('Letní Itálie', 'Itálie', '2025-06-10', '2025-06-20', 15990.00),
('Zimní Alpy', 'Rakousko', '2025-01-15', '2025-01-22', 18990.00),
('Poznávací Paříž', 'Francie', '2025-04-01', '2025-04-06', 12990.00),
('Exotický Egypt', 'Egypt', '2025-11-05', '2025-11-15', 19990.00),
('Adventura v Norsku', 'Norsko', '2025-08-01', '2025-08-10', 22990.00),
('Víkend v Budapešti', 'Maďarsko', '2025-05-10', '2025-05-12', 5990.00),
('Silvestr v Římě', 'Itálie', '2025-12-28', '2026-01-02', 14990.00);

-- Vkládání dat do tabulky Rezervace
INSERT INTO Rezervace (id_klienta, id_zajezdu, datum_rezervace, pocet_osob, stav) VALUES
(1, 1, '2025-04-01', 2, 'Potvrzeno'),
(2, 2, '2024-12-01', 1, 'Zaplaceno'),
(3, 3, '2025-02-20', 3, 'Storno'),
(4, 4, '2025-06-15', 2, 'Potvrzeno'),
(5, 5, '2025-05-05', 4, 'Zaplaceno'),
(6, 6, '2025-03-03', 2, 'Potvrzeno'),
(7, 7, '2025-11-01', 1, 'Zaplaceno');

-- Vkládání dat do tabulky Ubytovani
INSERT INTO Ubytovani (nazev, typ, adresa, hodnoceni, kontakt) VALUES
('Hotel Riviera', 'Hotel', 'Via Roma 10, Itálie', 4.5, 'info@riviera.it'),
('Alpský resort', 'Penzion', 'Hochstraße 22, Rakousko', 4.8, 'contact@alpsresort.at'),
('Hostel Paris', 'Hostel', 'Rue de la République 45, Francie', 3.9, 'paris@hostel.fr'),
('Resort Luxor', 'Hotel', 'El Salam St, Egypt', 4.2, 'info@luxorresort.eg'),
('Cabin Fjord', 'Chata', 'Oslo Fjord, Norsko', 4.7, 'booking@fjord.no'),
('Hotel Budapest', 'Hotel', 'Andrássy út 60, Maďarsko', 4.0, 'hotel@budapest.hu'),
('Villa Roma', 'Apartmán', 'Piazza Venezia, Itálie', 4.6, 'villa@roma.it');

-- Vkládání dat do tabulky UbytovaniNaZajezdu
INSERT INTO UbytovaniNaZajezdu (id_zajezdu, id_ubytovani, pocet_noci, pokoj) VALUES
(1, 1, 10, 'Dvojlůžkový'),
(2, 2, 7, 'Jednolůžkový'),
(3, 3, 5, 'Společný'),
(4, 4, 10, 'Luxusní apartmán'),
(5, 5, 9, 'Chata 2+2'),
(6, 6, 2, 'Standardní'),
(7, 7, 5, 'Rodinný pokoj');

-- Vkládání dat do tabulky Pruvodce
INSERT INTO Pruvodce (jmeno, prijmeni, jazyk, telefon, email) VALUES
('Karel', 'Malý', 'Angličtina', '123321123', 'karel.maly@example.com'),
('Anna', 'Horáková', 'Francouzština', '456654456', 'anna.horakova@example.com'),
('Jiří', 'Pokorný', 'Němčina', '789987789', 'jiri.pokorny@example.com'),
('Lucie', 'Bláhová', 'Arabština', '147258369', 'lucie.blahova@example.com'),
('David', 'Novotný', 'Norština', '321654987', 'david.novotny@example.com'),
('Veronika', 'Doležalová', 'Maďarština', '741852963', 'veronika.dolezalova@example.com'),
('Pavel', 'Sedlák', 'Italština', '852963741', 'pavel.sedlak@example.com');

-- Vkládání dat do tabulky PruvodceNaZajezdu
INSERT INTO PruvodceNaZajezdu (id_pruvodce, id_zajezdu, role) VALUES
(1, 1, 'Hlavní průvodce'),
(2, 3, 'Místní průvodce'),
(3, 2, 'Horský průvodce'),
(4, 4, 'Delegát'),
(5, 5, 'Expediční vůdce'),
(6, 6, 'Turistický průvodce'),
(7, 7, 'Historický výklad');

-- Vkládání dat do tabulky Recenze
INSERT INTO Recenze (id_klienta, id_zajezdu, hodnoceni, text, datum) VALUES
(1, 1, 5, 'Skvělá dovolená, doporučuji!', '2025-06-21'),
(2, 2, 4, 'Výborné služby, jen sníh chyběl.', '2025-01-23'),
(3, 3, 3, 'Bylo to ok, ale nic extra.', '2025-04-07'),
(4, 4, 5, 'Nejlepší dovolená vůbec.', '2025-11-16'),
(5, 5, 4, 'Krásná příroda, trochu drahé.', '2025-08-11'),
(6, 6, 3, 'Kratké, ale fajn.', '2025-05-13'),
(7, 7, 5, 'Řím je nádherný!', '2026-01-03');

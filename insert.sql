-- Vkládání dat do tabulky Klient
INSERT INTO Klient (jmeno, prijmeni, email, telefon) VALUES
('Jan', 'Souhrada', 'jan.souhrada@wompstuff.com', '123456789'),
('David', 'Frýbert', 'david.frybert@wompstuff.com', '987654321'),
('Pavel', 'Jiran', 'pavel.jiran@wompstuff.com', '111222333'),
('Stanislav', 'Kodr', 'stanislav.kodr@wompstuff.com', '444555666'),
('Kateřina', 'Šiková', 'katerina.sikova@wompstuff.com', '777888999'),
('Tomáš', 'Černý', 'tomas.cerny@wompstuff.com', '000111222'),
('Zdeněk', 'Pulec', 'zdenek.pulec@wompstuff.com', '333444555');

-- Vkládání dat do tabulky Zajezd
INSERT INTO Zajezd (nazev, destinace, datum_odjezdu, datum_prijezdu, cena) VALUES
('Třebešínské moře', 'Třebešínský bazén', '2025-06-10', '2025-06-20', 333.00),
('Okružní cesta Třebešínem', 'SPŠ Třebešín', '2025-01-15', '2025-01-22', 6000.00),
('Degustační menu na cestě z Třebešína', 'Bufet u Květy', '2025-04-01', '2025-04-06', 444.00),
('Německá exotika', 'Kabinet němčiny', '2025-11-05', '2025-11-15', 999.00),
('Adventura u tabule', 'libovolná třída', '2025-08-01', '2025-08-10', 666.00),
('Úvod do marketingu v Třebešínském Maďarsku', 'Studovna', '2025-05-10', '2025-05-12', 888.00),
('Komentovaná prohlídka dílen', 'Třebešínské dílny', '2025-12-28', '2026-01-02', 1899.00);

-- Vkládání dat do tabulky Rezervace
INSERT INTO Rezervace (id_klienta, id_zajezdu, datum_rezervace, pocet_osob, stav) VALUES
(1, 1, '2025-04-01', 2, 'Potvrzeno'),
(2, 2, '2024-12-01', 1, 'Zaplaceno'),
(3, 3, '2025-02-20', 3, 'Zaplaceno'),
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
('Wilma', 'Fagersten', 'Němčina', '123321123', 'wilma.fagersten@wompstuff.com'),
('Lukáš', 'Trš', 'Němčina', '456654456', 'lukas.trs@wompstuff.com'),
('Jan', 'Kuchařík', 'Japonština', '789987789', 'jan.kucharik@wompstuff.com'),
('Daniel', 'Dibelka', 'Arabština', '147258369', 'daniel.dibelka@wompstuff.com'),
('Michal', 'Slačík', 'Polština', '321654987', 'michal.slacik@wompstuff.com'),
('Timotej', 'Beňo', 'Maďarština', '741852963', 'timotej.beno@wompstuff.com'),
('Tereza', 'Valentová', 'Italština', '852963741', 'tereza.valentova@wompstuff.com');

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

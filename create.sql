-- Vytvoření tabulky Klient
CREATE TABLE Klient (
    id_klienta INT PRIMARY KEY AUTO_INCREMENT,
    jmeno VARCHAR(50) NOT NULL,
    prijmeni VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefon VARCHAR(20)
);

-- Vytvoření tabulky Zajezd
CREATE TABLE Zajezd (
    id_zajezdu INT PRIMARY KEY AUTO_INCREMENT,
    nazev VARCHAR(100) NOT NULL,
    destinace VARCHAR(100) NOT NULL,
    datum_odjezdu DATE NOT NULL,
    datum_prijezdu DATE NOT NULL,
    cena DECIMAL(10,2) NOT NULL
);

-- Vytvoření tabulky Rezervace
CREATE TABLE Rezervace (
    id_rezervace INT PRIMARY KEY AUTO_INCREMENT,
    id_klienta INT NOT NULL,
    id_zajezdu INT NOT NULL,
    datum_rezervace DATE NOT NULL,
    pocet_osob INT NOT NULL,
    stav VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_klienta) REFERENCES Klient(id_klienta),
    FOREIGN KEY (id_zajezdu) REFERENCES Zajezd(id_zajezdu)
);

-- Vytvoření tabulky Ubytovani
CREATE TABLE Ubytovani (
    id_ubytovani INT PRIMARY KEY AUTO_INCREMENT,
    nazev VARCHAR(100) NOT NULL,
    typ VARCHAR(50),
    adresa VARCHAR(200),
    hodnoceni DECIMAL(3,2),
    kontakt VARCHAR(100)
);

-- Vytvoření identifikačně závislé tabulky UbytovaniNaZajezdu
CREATE TABLE UbytovaniNaZajezdu (
    id_zajezdu INT,
    id_ubytovani INT,
    pocet_noci INT NOT NULL,
    pokoj VARCHAR(50),
    PRIMARY KEY (id_zajezdu, id_ubytovani),
    FOREIGN KEY (id_zajezdu) REFERENCES Zajezd(id_zajezdu),
    FOREIGN KEY (id_ubytovani) REFERENCES Ubytovani(id_ubytovani)
);

-- Vytvoření tabulky Pruvodce
CREATE TABLE Pruvodce (
    id_pruvodce INT PRIMARY KEY AUTO_INCREMENT,
    jmeno VARCHAR(50) NOT NULL,
    prijmeni VARCHAR(50) NOT NULL,
    jazyk VARCHAR(50),
    telefon VARCHAR(20),
    email VARCHAR(100)
);

-- Vytvoření spojovací tabulky PruvodceNaZajezdu
CREATE TABLE PruvodceNaZajezdu (
    id_pruvodce INT,
    id_zajezdu INT,
    role VARCHAR(50),
    PRIMARY KEY (id_pruvodce, id_zajezdu),
    FOREIGN KEY (id_pruvodce) REFERENCES Pruvodce(id_pruvodce),
    FOREIGN KEY (id_zajezdu) REFERENCES Zajezd(id_zajezdu)
);

-- Vytvoření tabulky Recenze
CREATE TABLE Recenze (
    id_recenze INT PRIMARY KEY AUTO_INCREMENT,
    id_klienta INT NOT NULL,
    id_zajezdu INT NOT NULL,
    hodnoceni INT CHECK (hodnoceni >= 1 AND hodnoceni <= 5),
    text TEXT,
    datum DATE NOT NULL,
    FOREIGN KEY (id_klienta) REFERENCES Klient(id_klienta),
    FOREIGN KEY (id_zajezdu) REFERENCES Zajezd(id_zajezdu)
);

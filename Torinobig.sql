CREATE DATABASE Torino;
USE Torino;

-- Indsæt kunder
INSERT INTO Kunder (Navn, Adresse, Telefonnummer, Email)
VALUES 
('Maria Hansen', 'Baker Street 221B', '12345678', 'maria@example.com'),
('Peter Nielsen', 'Rosenvej 12', '87654321', 'peter@example.com');

-- Indsæt pizzaer
INSERT INTO Menu (Navn, Beskrivelse, Pris)
VALUES
('Margherita', 'Tomatsauce, Mozzarella, Basilikum', 65.00),
('Pepperoni', 'Tomatsauce, Mozzarella, Pepperoni', 75.00),
('Vegetar', 'Tomatsauce, Mozzarella, Grøntsager', 70.00);

-- Indsæt ordrer
INSERT INTO Ordrer (KundeID, Leveringsadresse, TotalPris)
VALUES 
(1, 'Baker Street 221B', 140.00),
(2, 'Rosenvej 12', 75.00);

-- Indsæt ordredetaljer
INSERT INTO OrdreDetaljer (OrdreID, PizzaID, Tilpasning, Antal)
VALUES 
(1, 1, 'Ekstra ost', 1),
(1, 3, NULL, 1),
(2, 2, NULL, 1);

CREATE TABLE Kunder (
    KundeID INT AUTO_INCREMENT PRIMARY KEY,
    Navn VARCHAR(100) NOT NULL,
    Adresse VARCHAR(255),
    Telefonnummer VARCHAR(15),
    Email VARCHAR(100)
);

CREATE TABLE Menu (
    PizzaID INT AUTO_INCREMENT PRIMARY KEY,
    Navn VARCHAR(100) NOT NULL,
    Beskrivelse TEXT,
    Pris DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Ordrer (
    OrdreID INT AUTO_INCREMENT PRIMARY KEY,
    KundeID INT NOT NULL,
    Leveringsadresse VARCHAR(255),
    TotalPris DECIMAL(10, 2),
    OrdreDato DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (KundeID) REFERENCES Kunder(KundeID)
);

CREATE TABLE OrdreDetaljer (
    OrdreDetaljeID INT AUTO_INCREMENT PRIMARY KEY,
    OrdreID INT NOT NULL,
    PizzaID INT NOT NULL,
    Tilpasning TEXT,
    Antal INT NOT NULL,
    FOREIGN KEY (OrdreID) REFERENCES Ordrer(OrdreID),
    FOREIGN KEY (PizzaID) REFERENCES Menu(PizzaID)
);

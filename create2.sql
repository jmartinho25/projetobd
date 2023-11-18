CREATE TABLE Ranking_Final (
    rankingFinalID INT PRIMARY KEY,
    Posicao INT,
    NMedalhas INT
);

CREATE TABLE Clube (
    ClubeID INT PRIMARY KEY,
    NomeClube VARCHAR(255),
    DataFundacao DATE,
    Morada VARCHAR(255),
    rankingFinalID INT,
    FOREIGN KEY (rankingFinalID) REFERENCES Ranking_Final(rankingFinalID)
);

CREATE TABLE Nadador (
    NadadorID INT PRIMARY KEY,
    NomeNadador VARCHAR(255),
    DataNascimento DATE,
    GeneroNadador VARCHAR(10),
    Nacionalidade VARCHAR(255),
    ClubeID INT,
    EscalaoID INT,
    FOREIGN KEY (ClubeID) REFERENCES Clube(ClubeID),
    FOREIGN KEY (EscalaoID) REFERENCES Escalao(EscalaoID),
    UNIQUE (NadadorID, ClubeID)
);

CREATE TABLE Escalao (
    EscalaoID INT PRIMARY KEY,
    NomeEscalao VARCHAR(255),
    IdadeMin INT,
    IdadeMax INT
);

CREATE TABLE Prova (
    ProvaID INT PRIMARY KEY,
    GeneroProva VARCHAR(10),
    EscalaoID INT,
    DistanciaID INT,
    EstiloID INT,
    CompeticaoID INT,
    FOREIGN KEY (EscalaoID) REFERENCES Escalao(EscalaoID),
    FOREIGN KEY (DistanciaID) REFERENCES Distancia(DistanciaID),
    FOREIGN KEY (EstiloID) REFERENCES Estilo(EstiloID),
    FOREIGN KEY (CompeticaoID) REFERENCES Competicao(CompeticaoID),
    CHECK (GeneroProva = (SELECT GeneroNadador FROM Nadador WHERE NadadorID = NadadorID)
        AND EscalaoID = (SELECT EscalaoID FROM Nadador WHERE NadadorID = NadadorID))
);

CREATE TABLE Prova_Estafetas (
    ProvaID INT,
    EstafetasID INT,
    Equipas VARCHAR(255),
    PRIMARY KEY (ProvaID, EstafetasID),
    FOREIGN KEY (ProvaID) REFERENCES Prova(ProvaID),
    CHECK (
        (SELECT Comprimento FROM Distancia WHERE DistanciaID = (SELECT DistanciaID FROM Prova WHERE ProvaID = ProvaID)) >= 100
        AND
        (
            (SELECT DistanciaPiscina FROM Piscina WHERE PiscinaID = (SELECT PiscinaID FROM Competicao WHERE CompeticaoID = (SELECT CompeticaoID FROM Prova WHERE ProvaID = ProvaID))) = 25
            AND
            (SELECT Comprimento FROM Distancia WHERE DistanciaID = (SELECT DistanciaID FROM Prova WHERE ProvaID = ProvaID)) >= 100
        )
        OR
        (
            (SELECT DistanciaPiscina FROM Piscina WHERE PiscinaID = (SELECT PiscinaID FROM Competicao WHERE CompeticaoID = (SELECT CompeticaoID FROM Prova WHERE ProvaID = ProvaID))) = 50
            AND
            (SELECT Comprimento FROM Distancia WHERE DistanciaID = (SELECT DistanciaID FROM Prova WHERE ProvaID = ProvaID)) >= 200
        )
    )
);

CREATE TABLE Prova_Individual (
    ProvaID INT,
    IndividualID INT,
    PRIMARY KEY (ProvaID, IndividualID),
    FOREIGN KEY (ProvaID) REFERENCES Prova(ProvaID)
);

CREATE TABLE SplitEstafetas (
    NadadorID INT,
    EstafetasID INT,
    TempoSplit TIME,
    DistanciaSplit INT,
    PRIMARY KEY (NadadorID, EstafetasID),
    FOREIGN KEY (NadadorID) REFERENCES Nadador(NadadorID),
    FOREIGN KEY (EstafetasID) REFERENCES Prova_Estafetas(EstafetasID)
);

CREATE TABLE SplitIndividuais (
    NadadorID INT,
    IndividuaisID INT,
    TempoSplit TIME,
    DistanciaSplit INT,
    PRIMARY KEY (NadadorID, IndividuaisID),
    FOREIGN KEY (NadadorID) REFERENCES Nadador(NadadorID),
    FOREIGN KEY (IndividuaisID) REFERENCES Prova_Individual(IndividualID)
);

CREATE TABLE Estilo (
    EstiloID INT PRIMARY KEY,
    Crawl BOOLEAN,
    Mariposa BOOLEAN,
    Brucos BOOLEAN,
    Costas BOOLEAN,
    Livre BOOLEAN
);

CREATE TABLE Distancia (
    DistanciaID INT PRIMARY KEY,
    Comprimento INT
);

CREATE TABLE Competicao (
    CompeticaoID INT PRIMARY KEY,
    NomeCompeticao VARCHAR(255),
    Data DATE CHECK (YEAR(Data) = 2022),
    PiscinaID INT,
    FOREIGN KEY (PiscinaID) REFERENCES Piscina(PiscinaID)
);

CREATE TABLE Piscina (
    PiscinaID INT PRIMARY KEY,
    DistanciaPiscina INT CHECK (DistanciaPiscina IN (25,50)),
    Localizacao VARCHAR(255)
);

CREATE TABLE Patrocinios (
    PatrociniosID INT PRIMARY KEY,
    Patrocinador VARCHAR(255),
    TipoPatrocinio VARCHAR(255)
);

CREATE TABLE Patrocina (
    PatrociniosID INT,
    CompeticaoID INT,
    PRIMARY KEY (PatrociniosID, CompeticaoID),
    FOREIGN KEY (PatrociniosID) REFERENCES Patrocinios(PatrociniosID),
    FOREIGN KEY (CompeticaoID) REFERENCES Competicao(CompeticaoID)
);


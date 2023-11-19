PRAGMA	foreign_keys	=	ON;

INSERT INTO Ranking_Final (rankingFinalID, Posicao, NMedalhas) VALUES (1,1,15);

INSERT INTO Clube (ClubeID, NomeClube, DataFundacao, Morada, rankingFinalID) VALUES (101,'Clube A', '2020-01-01', 'Rua A, Cidade A', 1);  

INSERT INTO Escalao (EscalaoID, NomeEscalao, IdadeMin, IdadeMax) VALUES 
(120, 'Infantil', 8, 10),
(121, 'Juvenil', 11, 14),
(122, 'Júnior', 15, 17),
(123, 'Sénior', 18, 25);

INSERT INTO Nadador (NadadorID, NomeNadador, DataNascimento, GeneroNadador, Nacionalidade, ClubeID, EscalaoID) VALUES 
(1001, 'Nadador1','2012-01-15', 'Masculino', 'Nacionalidade21', 101, 120),
(1003, 'Nadador3','2005-06-30', 'Masculino', 'Nacionalidade23', 101, 122),
(1007, 'Nadador7','2005-09-05', 'Masculino', 'Nacionalidade27', 101, 122),
(1201, 'Nadador201','2005-05-25', 'Masculino', 'Nacionalidade201', 101, 122),
(1202, 'Nadador202','2005-05-25', 'Masculino', 'Nacionalidade201', 101, 122);

INSERT INTO Estilo (EstiloID, Crawl, Mariposa, Brucos, Costas, Livre) VALUES
(30, TRUE, FALSE, FALSE, FALSE, FALSE),--CRAWL
(31, FALSE, TRUE, FALSE, FALSE, FALSE),--MARIPOSA
(32, FALSE, FALSE, TRUE, FALSE, FALSE),--BRUÇOS
(33, FALSE, FALSE, FALSE, TRUE, FALSE),--COSTAS
(34, FALSE, FALSE, FALSE, FALSE, TRUE);--LIVRE

INSERT INTO Distancia(DistanciaID, Comprimento) VALUES
(70, 25), 
(71, 50), 
(72, 100), 
(73, 200), 
(74, 400), 
(75, 800);

INSERT INTO Piscina (PiscinaID, DistanciaPiscina, Localizacao)
VALUES
(80, 25, 'Localizacao1'),
(81, 50, 'Localizacao2');

INSERT INTO Competicao (CompeticaoID, NomeCompeticao, Data, PiscinaID) VALUES 
(150, 'Competicao1', '2022-05-15', 80),
(151, 'Competicao2', '2022-07-20', 81);

INSERT INTO Patrocinios (PatrociniosID, Patrocinador, TipoPatrocinio) VALUES (201, 'Empresa1', 'Main Sponsor');

INSERT INTO Patrocina (PatrociniosID, CompeticaoID) VALUES (201, 150);

INSERT INTO Prova (ProvaID, GeneroProva, EscalaoID, DistanciaID, EstiloID, CompeticaoID) VALUES 
--Competição 1
(200, 'Masculino', 121, 70, 31, 150),
(201, 'Feminino', 120, 71, 32, 150),
(202, 'Masculino', 122, 72, 33, 150),
(203, 'Feminino', 123, 73, 34, 150),
(204, 'Masculino', 120, 74, 30, 150),
(205, 'Feminino', 121, 75, 31, 150),
(206, 'Masculino', 123, 70, 32, 150),
(207, 'Feminino', 122, 71, 33, 150),
(208, 'Masculino', 120, 72, 34, 150),
(209, 'Feminino', 121, 73, 30, 150),
(210, 'Masculino', 122, 74, 31, 150),
(211, 'Feminino', 123, 75, 32, 150),
(212, 'Masculino', 120, 70, 33, 150),
(213, 'Feminino', 121, 71, 34, 150),
(214, 'Masculino', 122, 72, 30, 150),
--Competição 2
(215, 'Masculino', 121, 73, 31, 151),
(216, 'Feminino', 120, 74, 32, 151),
(217, 'Masculino', 122, 75, 33, 151),
(218, 'Feminino', 123, 71, 34, 151),
(219, 'Masculino', 120, 71, 30, 151),
(220, 'Feminino', 121, 72, 31, 151),
(221, 'Masculino', 123, 73, 32, 151),
(222, 'Feminino', 122, 74, 33, 151),
(223, 'Masculino', 120, 75, 34, 151),
(224, 'Feminino', 121, 71, 30, 151),
(225, 'Masculino', 122, 71, 31, 151),
(226, 'Feminino', 123, 72, 32, 151),
(227, 'Masculino', 120, 73, 33, 151),
(228, 'Feminino', 121, 74, 34, 151),
(229, 'Masculino', 122, 75, 30, 151);



INSERT INTO Prova_Estafetas (ProvaID, EstafetasID, Equipas)
VALUES
(202, 700, 'Equipa 1'),
(202, 701, 'Equipa 2'),
(202, 702, 'Equipa 3'),
(202, 703, 'Equipa 4'),
(202, 704, 'Equipa 5'),
(202, 705, 'Equipa 6'),
(202, 706, 'Equipa 7'),
(202, 707, 'Equipa 8'),
(202, 708, 'Equipa 9'),
(202, 709, 'Equipa 10');

INSERT INTO SplitEstafetas (NadadorID, EstafetasID, TempoSplit, DistanciaSplit) VALUES
--Clube1
(1003, 700, '00:39:50', 25),
(1007, 700, '00:39:40', 25),
(1201, 700, '00:40:00', 25),
(1202, 700, '00:39:50', 25);

INSERT INTO Prova_Individual (ProvaID, IndividualID) VALUES 
--Competição 1
(200, 800),
(201, 801),
(203, 802),
(204, 803),
(205, 804),
(206, 805),
(207, 806),
(208, 807),
(209, 808),
(210, 809),
(211, 810),
(212, 811),
(213, 812),
(214, 813),
--Competição 2
(215, 814),
(216, 815),
(218, 816),
(219, 817),
(220, 818),
(221, 819),
(222, 820),
(223, 821),
(224, 822),
(225, 823),
(226, 824),
(227, 825),
(228, 826),
(229, 827);

INSERT INTO SplitIndividuais (NadadorID, IndividualID, TempoSplit, DistanciaSplit) VALUES

--Clube 101--
    --Competição1
        --Prova4
(1001, 803, '00:40:10', 25),
(1001, 803, '10:41:38', 400),
        --Prova8
(1001, 807, '00:40:08', 25),
(1001, 807, '02:40:34', 100),

    --Competiçao2
        --Prova4
(1001, 817, '01:20:20', 50),
        --Prova8
(1001, 821, '01:20:16', 50),
(1001, 821, '21:32:10', 800),
        --Prova12
(1001, 825, '01:20:10', 50),
(1001, 825, '05:22:04', 200);

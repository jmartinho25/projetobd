PRAGMA	foreign_keys	=	ON;

INSERT INTO Ranking_Final (Ranking_FinalID, Posicao, NMedalhas) VALUES (1,1,15);

INSERT INTO Clube (ClubeID, NomeClube, DataFundacao, Morada, Ranking_FinalID) VALUES (101,'Clube A', '2020-01-01', 'Rua A, Cidade A', 1);  

INSERT INTO Escalao (EscalaoID, NomeEscalao, IdadeMin, IdadeMax) VALUES (120, 'Infantil', 8, 10);

INSERT INTO Nadador (NadadorID, NomeNadador, DataNascimento, GeneroNadador, Nacionalidade, ClueID, EscalaoID) VALUES (1001, 'Nadador1', '2009-02-15', 'Masculino', 'Nacionalidade1', 101, 121);

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
(81, 50, 'Localizacao2'),
(82, 25, 'Localizacao3'),
(83, 50, 'Localizacao4'),
(84, 25, 'Localizacao5'),
(85, 50, 'Localizacao6');

INSERT INTO Competicao (CompeticaoID, NomeCompeticao, Data, PiscinaID) VALUES (150, 'Competicao1', '2022-05-15', 80);

INSERT INTO Patrocinios (PatrociniosID, Patrocinador, TipoPatrocinio) VALUES (201, 'Empresa1', 'Main Sponsor');

INSERT INTO Patrocina (PatrociniosID, CompeticaoID) VALUES (201, 150);

INSERT INTO Prova (ProvaID, GeneroProva, EscalaoID, DistanciaID, EstiloID, CompeticaoID) VALUES (200, 'Masculino', 120, 70, 30, 150);

INSERT INTO Prova_Estafetas (ProvaID, EstafetasID, Equipas)
VALUES
(202, 701, '1,2,3,4'),
(203, 702, '5,6,7,8'),
(204, 703, '9,10,11,12'),
(205, 704, '13,14,15,16'),
(208, 705, '17,18,19,20'),
(209, 706, '21,22,23,24'),
(210, 707, '25,26,27,28'),
(211, 708, '29,30,31,32'),
(214, 709, '33,34,35,36'),
(215, 710, '37,38,39,40'),
(216, 711, '41,42,43,44'),
(217, 712, '45,46,47,48'),
(221, 713, '49,50,51,52'),
(222, 714, '53,54,55,56'),
(223, 715, '57,58,59,60'),
(227, 716, '61,62,63,64'),
(228, 717, '65,66,67,68'),
(229, 718, '69,70,71,72'),
(232, 719, '73,74,75,76'),
(233, 720, '77,78,79,80'),
(234, 721, '81,82,83,84'),
(235, 722, '85,86,87,88'),
(238, 723, '89,90,91,92'),
(239, 724, '93,94,95,96'),
(240, 725, '97,98,99,100');

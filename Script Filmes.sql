CREATE DATABASE Filmes;
USE Filmes;

CREATE TABLE Atores (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    PrimeiroNome VARCHAR(20),
    UltimoNome VARCHAR(20),
    Genero VARCHAR(1)
);

CREATE TABLE ElencoFilme (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    IdAtor INT NOT NULL,
    IdFilme INT,
    Papel VARCHAR(30),
    FOREIGN KEY (IdAtor) REFERENCES Atores(Id),
    FOREIGN KEY (IdFilme) REFERENCES Filmes(Id)
);

CREATE TABLE Filmes (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50),
    Ano INT,
    Duracao INT
);

CREATE TABLE FilmesGenero (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    IdGenero INT,
    IdFilme INT,
    FOREIGN KEY (IdFilme) REFERENCES Filmes(Id),
    FOREIGN KEY (IdGenero) REFERENCES Generos(Id)
);

CREATE TABLE Generos (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Genero VARCHAR(20)
);

INSERT INTO Atores (PrimeiroNome, UltimoNome, Genero) VALUES 
('James', 'Stewart', 'M'),
('Deborah', 'Kerr', 'F'),
('Peter', 'OToole', 'M'),
('Robert', 'DeNiro', 'M'),
('Harrison', 'Ford', 'M'),
('Stephen', 'Baldwin', 'M'),
('Jack', 'Nicholson', 'M'),
('Mark', 'Wahlberg', 'M'),
('Woody', 'Allen', 'M'),
('Claire', 'Danes', 'F'),
('Tim', 'Robbins', 'M'),
('Kevin', 'Spacey', 'M'),
('Kate', 'Winslet', 'F'),
('Robin', 'Williams', 'M'),
('Jon', 'Voight', 'M'),
('Ewan', 'McGregor', 'M'),
('Christian', 'Bale', 'M'),
('Maggie', 'Gyllenhaal', 'F'),
('Dev', 'Patel', 'M'),
('Sigourney', 'Weaver', 'F'),
('David', 'Aston', 'M'),
('Ali', 'Astin', 'F');

INSERT INTO ElencoFilme (IdAtor, IdFilme, Papel) VALUES 
(1, 1, 'John Scottie Ferguson'),
(2, 2, 'Miss Giddens'),
(3, 3, 'T.E. Lawrence'),
(4, 4, 'Michael'),
(6, 6, 'Rick Deckard'),
(7, 8, 'McManus'),
(9, 10, 'Eddie Adams'),
(10, 11, 'Alvy Singer'),
(11, 12, 'San'),
(12, 13, 'Andy Dufresne'),
(13, 14, 'Lester Burnham'),
(14, 15, 'Rose DeWitt Bukater'),
(15, 16, 'Sean Maguire'),
(16, 17, 'Ed'),
(17, 18, 'Renton'),
(19, 20, 'Elizabeth Darko'),
(20, 21, 'Older Jamal'),
(21, 22, 'Ripley'),
(13, 23, 'Bobby Darin'),
(8, 9, 'J.J. Gittes'),
(18, 19, 'Alfred Borden');

INSERT INTO Filmes (Nome, Ano, Duracao) VALUES 
('Um Corpo que Cai', 1958, 128),
('Os Inocentes', 1961, 100),
('Lawrence da Arábia', 1962, 216),
('O Franco Atirador', 1978, 183),
('Amadeus', 1984, 160),
('Blade Runner', 1982, 117),
('De Olhos Bem Fechados', 1999, 159),
('Os Suspeitos', 1995, 106),
('Chinatown', 1974, 130),
('Boogie Nights - Prazer Sem Limites', 1997, 155),
('Noivo Neurótico, Noiva Nervosa', 1977, 93),
('Princesa Mononoke', 1997, 134),
('Um Sonho de Liberdade', 1994, 142),
('Beleza Americana', 1999, 122),
('Titanic', 1997, 194),
('Gênio Indomável', 1997, 126),
('Amargo pesadelo', 1972, 109),
('Trainspotting - Sem Limites', 1996, 94),
('O Grande Truque', 2006, 130),
('Donnie Darko', 2001, 113),
('Quem Quer Ser um Milionário?', 2008, 120),
('Aliens, O Resgate', 1986, 137),
('Uma Vida sem Limites', 2004, 118),
('Avatar', 2009, 162),
('Coração Valente', 1995, 178),
('Os Sete Samurais', 1954, 207),
('A Viagem de Chihiro', 2001, 125),
('De Volta para o Futuro', 1985, 116);

INSERT INTO FilmesGenero (IdGenero, IdFilme) VALUES 
(1, 22),
(2, 17),
(2, 3),
(3, 12),
(5, 11),
(6, 8),
(6, 13),
(7, 26),
(7, 28),
(7, 18),
(7, 21),
(8, 2),
(9, 23),
(10, 7),
(10, 27),
(10, 1),
(11, 14),
(12, 6),
(13, 4);

INSERT INTO Generos (Genero) VALUES 
('Ação'),
('Aventura'),
('Animação'),
('Biografia'),
('Comédia'),
('Crime'),
('Drama'),
('Horror'),
('Musical'),
('Mistério'),
('Romance'),
('Suspense'),
('Guerra');

-- 01
SELECT Nome, Ano FROM Filmes;

-- 02
SELECT Nome, Ano FROM Filmes ORDER BY Ano ASC;

-- 03
SELECT Nome, Ano, Duracao FROM Filmes WHERE Nome = 'De Volta para o Futuro';

-- 04
SELECT Nome, Ano FROM Filmes WHERE Ano = 1997;

-- 05
SELECT Nome, Ano FROM Filmes WHERE Ano > 2000;

-- 06
SELECT Nome, Duracao FROM Filmes WHERE Duracao > 100 AND Duracao < 150 ORDER BY Duracao ASC;

-- 07
SELECT Ano, COUNT(*) AS Quantidade_Filmes FROM Filmes GROUP BY Ano ORDER BY Quantidade_Filmes DESC;

-- 08
SELECT PrimeiroNome, UltimoNome FROM Atores WHERE Genero = 'M';

-- 09
SELECT PrimeiroNome, UltimoNome FROM Atores WHERE Genero = 'F' ORDER BY PrimeiroNome;

-- 10
SELECT Filmes.Nome, Generos.Genero
FROM Filmes
INNER JOIN FilmesGenero ON Filmes.Id = FilmesGenero.IdFilme
INNER JOIN Generos ON FilmesGenero.IdGenero = Generos.Id;

-- 11
SELECT Filmes.Nome, Generos.Genero
FROM Filmes
INNER JOIN FilmesGenero ON Filmes.Id = FilmesGenero.IdFilme
INNER JOIN Generos ON FilmesGenero.IdGenero = Generos.Id
WHERE Generos.Genero = 'Mistério';

-- 12
SELECT Filmes.Nome, Atores.PrimeiroNome, Atores.UltimoNome, ElencoFilme.Papel
FROM Filmes
INNER JOIN ElencoFilme ON Filmes.Id = ElencoFilme.IdFilme
INNER JOIN Atores ON ElencoFilme.IdAtor = Atores.Id;
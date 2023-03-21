-- Descomente e altere as linhas abaixo:

DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE planos
(
plano_id INT PRIMARY KEY AUTO_INCREMENT,
tipo_plano VARCHAR(20),
valor_plano DECIMAL(10,2)
);

CREATE TABLE pessoa_usuaria
(
pessoa_usuaria_id INT PRIMARY KEY AUTO_INCREMENT,
nome_pessoa_usuaria VARCHAR(30),
idade INT,
plano_id INT,
data_assinatura VARCHAR(75),
FOREIGN KEY (plano_id) REFERENCES planos(plano_id)
);

CREATE TABLE artista
(
artista_id INT PRIMARY KEY AUTO_INCREMENT,
artista_nome VARCHAR(55)
);

CREATE TABLE album
(
album_id INT PRIMARY KEY AUTO_INCREMENT,
album VARCHAR(55),
ano_lancamento INT
);

CREATE TABLE cancao
(
cancao_id INT PRIMARY KEY AUTO_INCREMENT,
cancao VARCHAR(55),
duracao_segundos INT
);

CREATE TABLE cancao_album_artista
(
cancao_album_artista_id INT PRIMARY KEY AUTO_INCREMENT,
cancao_id INT,
album_id INT,
artista_id INT,
FOREIGN KEY (album_id) REFERENCES album(album_id),
FOREIGN KEY (artista_id) REFERENCES artista(artista_id),
FOREIGN KEY (cancao_id) REFERENCES cancao(cancao_id)
);

CREATE TABLE historico
(
historico_id INT PRIMARY KEY AUTO_INCREMENT,
pessoa_usuaria_id INT,
cancao_id INT,
data_de_reproducao VARCHAR(75),
FOREIGN KEY (pessoa_usuaria_id) REFERENCES pessoa_usuaria(pessoa_usuaria_id),
FOREIGN KEY (cancao_id) REFERENCES cancao(cancao_id)
);

CREATE TABLE seguindo_artistas
(
seguindo_artistas_id INT PRIMARY KEY AUTO_INCREMENT,
pessoa_usuaria_id INT,
artista_id INT,
FOREIGN KEY (pessoa_usuaria_id) REFERENCES pessoa_usuaria(pessoa_usuaria_id),
FOREIGN KEY (artista_id) REFERENCES artista(artista_id)
);

INSERT INTO planos (tipo_plano, valor_plano) VALUES
	('gratuito', 0.00),
	('universitário', 5.99),
	('pessoal', 6.99),
	('familiar', 7.99);
    
INSERT INTO pessoa_usuaria (nome_pessoa_usuaria, idade, plano_id, data_assinatura) VALUES
	('Barbara Liskov', '82', '1', '2019-10-20'),
	('Robert Cecil Martin', '58', '1', '2017-01-06'),
	('Ada Lovelace', '37', '4', '2017-12-30'),
	('Martin Fowler', '46', '4', '2017-01-17'),
	('Sandi Metz', '58', '4', '2018-04-29'),
	('Paulo Freire', '19', '2', '2018-02-14'),
	('Bell Hooks', '26', '2', '2018-01-05'),
	('Christopher Alexander', '85', '3', '2019-06-05'),
	('Judith Butler', '45', '3', '2020-05-13'),
	('Jorge Amado', '58', '3', '2017-02-17');
    
INSERT INTO artista (artista_nome) VALUES
	('Beyoncé'),
	('Queen'),
	('Elis Regina'),
	('Baco Exu do Blues'),
	('Blind Guardian'),
	('Nina Simone');

INSERT INTO album (album, ano_lancamento) VALUES
	('Renaissance', '2022'),
	('Jazz', '1978'),
	('Hot Space', '1982'),
	('Falso Brilhante', '1998'),
	('Vento de Maio', '2001'),
	('QVVJFA?', '2003'),
	('Somewhere Far Beyond', '2007'),
	('I Put A Spell On You', '2012');

INSERT INTO cancao (cancao, duracao_segundos) VALUES
	('"BREAK MY SOUL"', '279'),
	('"VIRGO\'S GROOVE"', '369'),
	('"ALIEN SUPERSTAR"', '116'),
	('"Don\'t Stop Me Now"', '203'),
	('"Under Pressure"', '152'),
	('"Como Nossos Pais"', '105'),
	('"O Medo de Amar é o Medo de Ser Livre"', '207'),
	('"Samba em Paris"', '267'),
	('"The Bard\'s Song"', '244'),
	('"Feeling Good"', '100');

INSERT INTO cancao_album_artista (cancao_id, album_id, artista_id) VALUES
	('1', '1', '1'),
	('2', '1', '1'),
	('3', '1', '1'),
	('4', '2', '2'),
	('5', '3', '2'),
	('6', '4', '3'),
	('7', '5', '3'),
	('8', '6', '4'),
	('9', '7', '5'),
	('10', '8', '6');

INSERT INTO historico (pessoa_usuaria_id, cancao_id, data_de_reproducao) VALUES
	('1', '8', '"2022-02-28 10:45:55"'),
	('1', '2', '"2020-05-02 05:30:35"'),
	('1', '10', '"2020-03-06 11:22:33"'),
	('2', '10', '"2022-08-05 08:05:17"'),
	('2', '7', '"2020-01-02 07:40:33"'),
	('3', '10', '"2020-11-13 16:55:13"'),
	('3', '2', '"2020-12-05 18:38:30"'),
	('4', '8', '"2021-08-15 17:10:10"'),
	('5', '8', '"2022-01-09 01:44:33"'),
	('5', '5', '"2020-08-06 15:23:43"'),
	('6', '7', '"2017-01-24 00:31:17"'),
	('6', '1', '"2017-10-12 12:35:20"'),
	('7', '4', '"2011-12-15 22:30:49"'),
	('8', '4', '"2012-03-17 14:56:41"'),
	('9', '9', '"2022-02-24 21:14:22"'),
	('10', '3', '"2015-12-13 08:30:22"');

INSERT INTO seguindo_artistas (pessoa_usuaria_id, artista_id) VALUES
	('1', '1'),
	('1', '2'),
	('1', '3'),
	('2', '1'),
	('2', '3'),
	('3', '2'),
	('4', '4'),
	('5', '5'),
	('5', '6'),
	('6', '6'),
	('6', '1'),
	('7', '6'),
	('9', '3'),
	('10', '2');
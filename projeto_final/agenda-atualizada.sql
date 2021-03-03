CREATE DATABASE agenda;
USE agenda;

CREATE TABLE evento (
  id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  data date NOT NULL DEFAULT '0000-00-00',
  hora_de time NOT NULL DEFAULT '00:00:00',
  hora_ate time DEFAULT NULL,
  descricao text NOT NULL
);
DROP TABLE evento;

INSERT INTO evento (data, hora_de, hora_ate, descricao)
VALUES
	('2015-07-11','13:00:00','16:00:00','Reunião teste');
    
SELECT * FROM evento;

UNLOCK TABLES;

CREATE TABLE pessoa (
	id int NOT NULL AUTO_INCREMENT,
	nome char(50) NOT NULL,
    email char(50) NOT NULL,
  PRIMARY KEY (id)
);

LOCK TABLES pessoa WRITE;

INSERT INTO pessoa (nome, email)
VALUES
	('Pedro','pedro@treinaweb.com.br'),
	('Mariana','mariana@treinaweb.com.br');
    
CREATE TABLE pessoa_evento (
  pessoa int NOT NULL,
  evento int NOT NULL,
  KEY FK_pessoa_evento_pessoa (pessoa),
  KEY FK_pessoa_evento_evento (evento),
  CONSTRAINT FK_pessoa_evento_evento FOREIGN KEY (evento) REFERENCES evento (id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT FK_pessoa_evento_pessoa FOREIGN KEY (pessoa) REFERENCES pessoa (id) ON DELETE NO ACTION ON UPDATE NO ACTION
);
  
LOCK TABLES pessoa_evento WRITE;

INSERT INTO pessoa_evento (pessoa, evento)
VALUES
	(1,1);
    
UNLOCK TABLES;

USE agenda;
SELECT * FROM pessoa;
SELECT * FROM evento;
SELECT * FROM pessoa_evento;

/*
 https://www.mysqltutorial.org/
 */
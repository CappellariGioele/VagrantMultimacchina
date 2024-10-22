CREATE DATABASE prova;
USE prova;

CREATE TABLE tabella(
    id INT PRIMARY KEY AUTO_INCREMENT,
    testo VARCHAR(50)
);

INSERT INTO tabella(testo) VALUES
("testo1"),
("testo2"),
("testo3");

CREATE USER 'webuser'@'10.10.20.10' IDENTIFIED BY 'Admin$00';
GRANT ALL ON prova.* TO 'webuser'@'10.10.20.10';
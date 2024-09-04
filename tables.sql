DROP DATABASE IF EXISTS Clube;
CREATE DATABASE Clube;

USE Clube;

CREATE TABLE Permissao (
    ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    NivelPermissao INT NOT NULL,
    Descricao VARCHAR(100) NOT NULL
);

CREATE TABLE Usuario (
    ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    IDPermissao INT,
    FOREIGN KEY (IDPermissao) REFERENCES Permissao(ID)
        ON DELETE SET NULL
        ON UPDATE CASCADE,
    Nome VARCHAR(255) NOT NULL,
    CPF VARCHAR(25) NOT NULL,
    DataNasc DATE NOT NULL,
    DataCadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Endereco (
    ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    CEP VARCHAR(50) NOT NULL,
    Numero VARCHAR(50) NOT NULL,
    Complemento VARCHAR(50),
    IDUsuario INT NOT NULL,
    FOREIGN KEY (IDUsuario) REFERENCES Usuario(ID)
);

CREATE TABLE Telefone (
    ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    CodigoPais VARCHAR(50) NOT NULL,
    DDD VARCHAR(50) NOT NULL,
    Numero VARCHAR(50) NOT NULL,
    IDUsuario INT NOT NULL,
    FOREIGN KEY (IDUsuario) REFERENCES Usuario(ID)
);

CREATE TABLE Quadra (
    ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(50) NOT NULL
);

CREATE TABLE ReservaQuadra (
    ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    DataHoraInicio DATETIME NOT NULL,
    DataHoraFim DATETIME NOT NULL,
    IDUsuario INT NOT NULL,
    FOREIGN KEY (IDUsuario) REFERENCES Usuario(ID),
    IDQuadra INT NOT NULL,
    FOREIGN KEY (IDQuadra) REFERENCES Quadra(ID)
);

CREATE TABLE Churrasqueira (
    ID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Nome VARCHAR(50) NOT NULL,
    Capacidade INT NOT NULL
);

CREATE TABLE ReservaChurrasqueira (
    ID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    DataReserva DATE,
    IDUsuario INT,
    FOREIGN KEY (IDUsuario) REFERENCES Usuario(ID),
    IDChurrasqueira INT,
    FOREIGN KEY (IDChurrasqueira) REFERENCES Churrasqueira(ID)
);

SET FOREIGN_KEY_CHECKS = 0;

drop database if exists Clube;
create database Clube;

use Clube;

CREATE TABLE Permissao (
	ID int primary key not null auto_increment,
    NivelPermissao int not null,
    Descricao varchar(100) not null
);

CREATE TABLE Usuario (
	ID int primary key not null auto_increment,
    IDpermissao int, foreign key (IDPermissao) references Permissao(ID) 
		on delete set null
        on update set null,
    Nome varchar(255) not null,
    CPF varchar(25) not null,
    DataNasc date not null,
    DataCadastro datetime default CURRENT_TIMESTAMP
);

CREATE TABLE Endereco (
	ID int primary key not null auto_increment,
    CEP varchar(50) not null,
    Numero varchar(50) not null,
    Complemento varchar(50),
	IDUsuario int not null, 
    foreign key (IDUsuario) references Usuario(ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE Telefone (
	ID int primary key not null auto_increment,
    CodigoPais varchar(50) not null,
    DDD varchar(50) not null,
    Numero varchar(50) not null,
    IDUsuario int not null, 
    foreign key (IDUsuario) references Usuario(ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE Quadra (
	ID int primary key not null auto_increment,
    Nome varchar(50) not null
);

CREATE TABLE ReservaQuadra (
	ID int primary key not null auto_increment,
    DataHoraInicio datetime not null,
    DataHoraFim datetime not null,
    IDUsuario int not null, 
    foreign key (IDUsuario) references Usuario(ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    IDQuadra int not null, 
    foreign key (IDQuadra) references Quadra(ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

create table Churrasqueira(
	ID int primary key auto_increment not null,
    Nome varchar(50) not null,
    Capacidade int not null
    );
    
create table ReservaChurrasqueira(
	ID int primary key auto_increment not null,
    DataReserva date,
    IDUsuario int,
    foreign key(IDUsuario) references Usuario(ID)
		on delete cascade
        on update cascade,
	IDChurrasqueira int,
    foreign key(IDChurrasqueira) references Churrasqueira(ID)
		on delete cascade 
        on update cascade
	);

    

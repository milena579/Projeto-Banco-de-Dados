use Clube;

CREATE TABLE LogPermissao (
	IDLogPermissao int primary key not null auto_increment,
    IDPermissao int not null,
    NivelPermissao int not null,
    Descricao varchar(100) not null,
    Acao varchar(100),
    DataAcao datetime default current_timestamp
);

CREATE TABLE LogUsuario (
	IDLogUsuario int primary key not null auto_increment,
    IDUsuario int not null,
    IDpermissao int,
    Nome varchar(255) not null,
    CPF varchar(25) not null,
    DataNasc date not null,
    DataCadastro datetime,
    Acao varchar(100),
    DataAcao datetime default current_timestamp
);

CREATE TABLE LogEndereco(
	IDLogEndereco int primary key not null auto_increment,
    IDEndereco int not null,
    CEP varchar(50) not null,
    Numero varchar(50) not null,
    Complemento varchar(50),
	IDUsuario int not null,
    Acao varchar(100),
    DataAcao datetime default current_timestamp
);

CREATE TABLE LogTelefone (
	IDLogTelefone int primary key not null auto_increment,
    IDTelefone int not null,
    CodigoPais varchar(50) not null,
    DDD varchar(50) not null,
    Numero varchar(50) not null,
    IDUsuario int not null,
    Acao varchar(100),
    DataAcao datetime default current_timestamp
);

CREATE TABLE LogQuadra (
	IDLogQuadra int primary key not null auto_increment,
    IDQuadra int not null,
    Nome varchar(50) not null,
    Acao varchar(100),
    DataAcao datetime default current_timestamp
);

CREATE TABLE LogReservaQuadra (
	IDLogReservaQuadra int primary key not null auto_increment,
    IDReservaQuadra int not null,
    DataHoraInicio datetime not null,
    DataHoraFim datetime not null,
    IDUsuario int not null, 
    IDQuadra int not null,
    Acao varchar(100),
    DataAcao datetime default current_timestamp
);

create table LogChurrasqueira(
	IDLogChurrasqueira int primary key auto_increment not null,
    IDChurrasqueira int not null,
    Nome varchar(50) not null,
    Capacidade int not null,
    Acao varchar(100),
    DataAcao datetime default current_timestamp
    );
    
    create table LogReservaChurrasqueira(
	IDLogReservaChurrasqueira int primary key auto_increment not null,
    IDReservaChurrasqueira int not null,
    DataReserva date not null,
    IDUsuario int not null,
	IDChurrasqueira int not null,
    Acao varchar(100),
    DataAcao datetime default current_timestamp
	);


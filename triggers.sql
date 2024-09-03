update, delete, insert

DELIMITER //

CREATE TRIGGER insertLog

DELIMITER //
create trigger deleteLogUsuario
BEFORE DELETE ON Usuario
FOR EACH ROW
BEGIN 
	INSERT INTO LogUsuario(IDUsuario, IDpermissao, Nome, CPF, DataNasc, DataCadastro, Acao)
    VALUES(old.ID, old.IDPermissao, old.Nome, old.CPF, old.DataNasc, old.DataCadastro, 'Usuario DELETADO');
END;
//
DELIMITER ;

--triggers usuario
DELIMITER //
create trigger insertLogUsuario
after insert on Usuario
FOR EACH ROW
BEGIN
	INSERT INTO LogUsuario(IDUsuario, IDpermissao, Nome, CPF, DataNasc, DataCadastro, Acao)
    VALUES(new.ID, new.IDPermissao, new.Nome, new.CPF, new.DataNasc, new.DataCadastro, 'Usuario INSERIDO');
END;
//
DELIMITER ;

DELIMITER //
create trigger updateLogUsuario
after update on Usuario
FOR EACH ROW
BEGIN
	INSERT INTO LogUsuario(IDUsuario, IDpermissao, Nome, CPF, DataNasc, DataCadastro, Acao)
    VALUES(new.ID, new.IDPermissao, new.Nome, new.CPF, new.DataNasc, new.DataCadastro, 'Usuario EDITADO');
END;
//
DELIMITER ;


insert into Usuario (IDPermissao, Nome, CPF, DataNasc) values 
(1, 'Milena', '08023131321', '2005-09-23');

select * from LogUsuario;

update usuario
set Nome = 'Milena Calegari'
where ID = 5;

call excluirUsuario(5)

-- triggers telefone 
DELIMITER //
CREATE TRIGGER deleteLogTelefone
BEFORE delete on Telefone
FOR EACH ROW
BEGIN
	INSERT INTO LogTelefone(IDTelefone, CodigoPais, DDD, Numero, IDUsuario, Acao)
    VALUES(old.ID, old.CodigoPais, old.DDD, old.Numero, old.IDUsuario, 'Telefone DELETADO');
END;
//
DELIMITER ;


DELIMITER //
CREATE TRIGGER insertLogTelefone
after insert on Telefone
FOR EACH ROW
BEGIN
	INSERT INTO LogTelefone(IDTelefone, CodigoPais, DDD, Numero, IDUsuario, Acao)
    VALUES(new.ID, new.CodigoPais, new.DDD, new.Numero, new.IDUsuario, 'Telefone INSERIDO');
END;
//
DELIMITER ;


DELIMITER //
CREATE TRIGGER updateLogTelefone
after update on Telefone
FOR EACH ROW
BEGIN
	INSERT INTO LogTelefone(IDTelefone, CodigoPais, DDD, Numero, IDUsuario, Acao)
    VALUES(new.ID, new.CodigoPais, new.DDD, new.Numero, new.IDUsuario, 'Telefone EDITADO');
END;
//
DELIMITER ;

--triggers churrasqueira
DELIMITER //
CREATE TRIGGER deleteLogChurrasqueira
BEFORE delete on Churrasqueira
FOR EACH ROW
BEGIN
	INSERT INTO LogChurrasqueira(IDChurrasqueira, Nome, Capacidade, Acao)
    VALUES(old.ID, old.Nome, old.Capacidade, 'Churrasqueira DELETADA');
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER insertLogChurrasqueira
AFTER insert on Churrasqueira
FOR EACH ROW
BEGIN
	INSERT INTO LogChurrasqueira(IDChurrasqueira, Nome, Capacidade, Acao)
    VALUES(new.ID, new.Nome, new.Capacidade, 'Churrasqueira INSERIDA');
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER updateLogChurrasqueira
AFTER update on Churrasqueira
FOR EACH ROW
BEGIN
	INSERT INTO LogChurrasqueira(IDChurrasqueira, Nome, Capacidade, Acao)
    VALUES(new.ID, new.Nome, new.Capacidade, 'Churrasqueira EDITADA');
END;
//
DELIMITER ;

-- trigger reserva churrasqueira
DELIMITER //
CREATE TRIGGER deleteLogReservaChurrasqueira
BEFORE delete on ReservaChurrasqueira
FOR EACH ROW
BEGIN
	INSERT INTO LogReservaChurrasqueira(IDReservaChurrasqueira, DataReserva, IDUsuario, IDChurrasquira, Acao)
    VALUES(old.ID, old.DataReserva, old.IDUsuario, old.IDChurrasqueira, 'ReservaChurrasqueira DELETADA');
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER insertLogReservaChurrasqueira
BEFORE insert on ReservaChurrasqueira
FOR EACH ROW
BEGIN
	INSERT INTO LogReservaChurrasqueira(IDReservaChurrasqueira, DataReserva, IDUsuario, IDChurrasquira, Acao)
    VALUES(new.ID, new.DataReserva, new.IDUsuario, new.IDChurrasqueira, 'ReservaChurrasqueira INSERIDA');
END;
//
DELIMITER ;

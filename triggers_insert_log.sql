-- Permissao
DELIMITER //
CREATE TRIGGER insertPermissao
    AFTER INSERT ON Permissao
    FOR EACH ROW
BEGIN
    INSERT INTO LogPermissao(IDPermissao, NivelPermissao, Descricao, Acao) 
    VALUES(new.ID, new.NivelPermissao, new.Descricao, 'PERMISSAO INSERIDA');
END;
//
DELIMITER //

DELIMITER //
CREATE TRIGGER updatePermissao
    AFTER UPDATE ON Permissao
    FOR EACH ROW
BEGIN
    INSERT INTO LogPermissao(IDPermissao, NivelPermissao, Descricao, Acao) 
    VALUES(new.ID, new.NivelPermissao, new.Descricao, 'PERMISSAO ATUALIZADA');
END;
//
DELIMITER //

DELIMITER //
CREATE TRIGGER deletePermissao
    BEFORE DELETE ON Permissao
    FOR EACH ROW
BEGIN
    INSERT INTO LogPermissao(IDPermissao, NivelPermissao, Descricao, Acao) 
    VALUES(old.ID, old.NivelPermissao, old.Descricao, 'PERMISSAO DELETADA');
END;
//
DELIMITER //

-- Usuario
DELIMITER //
CREATE TRIGGER insertLogUsuario
    AFTER INSERT ON Usuario
    FOR EACH ROW
BEGIN
    INSERT INTO LogUsuario(IDUsuario, IDPermissao, Nome, CPF, DataNasc, DataCadastro, Acao)
    VALUES(new.ID, new.IDPermissao, new.Nome, new.CPF, new.DataNasc, new.DataCadastro, 'USUARIO INSERIDO');
END;
//
DELIMITER //

DELIMITER //
CREATE TRIGGER updateLogUsuario
    BEFORE UPDATE ON Usuario
    FOR EACH ROW
BEGIN
    IF (new.IDPermissao > old.IDPermissao) THEN
        SET new.IDPermissao = old.IDPermissao;
    END IF;
    
    INSERT INTO LogUsuario(IDUsuario, IDPermissao, Nome, CPF, DataNasc, DataCadastro, Acao)
    VALUES(new.ID, new.IDPermissao, new.Nome, new.CPF, new.DataNasc, new.DataCadastro, 'USUARIO ATUALIZADO');
END;
//
DELIMITER //

DELIMITER //
CREATE TRIGGER deleteLogUsuario
    BEFORE DELETE ON Usuario
    FOR EACH ROW
BEGIN
    INSERT INTO LogUsuario(IDUsuario, IDPermissao, Nome, CPF, DataNasc, DataCadastro, Acao)
    VALUES(old.ID, old.IDPermissao, old.Nome, old.CPF, old.DataNasc, old.DataCadastro, 'USUARIO DELETADO');
END;
//
DELIMITER //

-- Endereco
DELIMITER //
CREATE TRIGGER insertLogEndereco
    AFTER INSERT ON Endereco
    FOR EACH ROW
BEGIN
    INSERT INTO LogEndereco(IDEndereco, CEP, Numero, Complemento, IDUsuario, Acao) 
    VALUES(new.ID, new.CEP, new.Numero, new.Complemento, new.IDUsuario, 'ENDERECO INSERIDO');
END;
//
DELIMITER //

DELIMITER //
CREATE TRIGGER updateLogEndereco
    AFTER UPDATE ON Endereco
    FOR EACH ROW
BEGIN
    INSERT INTO LogEndereco(IDEndereco, CEP, Numero, Complemento, IDUsuario, Acao) 
    VALUES(new.ID, new.CEP, new.Numero, new.Complemento, new.IDUsuario, 'ENDERECO ATUALIZADO');
END;
//
DELIMITER //

DELIMITER //
CREATE TRIGGER deleteLogEndereco
    BEFORE DELETE ON Endereco
    FOR EACH ROW
BEGIN
    INSERT INTO LogEndereco(IDEndereco, CEP, Numero, Complemento, IDUsuario, Acao) 
    VALUES(old.ID, old.CEP, old.Numero, old.Complemento, old.IDUsuario, 'ENDERECO DELETADO');
END;
//
DELIMITER //

-- Telefone
DELIMITER //
CREATE TRIGGER insertLogTelefone
    AFTER INSERT ON Telefone
    FOR EACH ROW
BEGIN
    INSERT INTO LogTelefone(IDTelefone, CodigoPais, DDD, Numero, IDUsuario, Acao)
    VALUES(new.ID, new.CodigoPais, new.DDD, new.Numero, new.IDUsuario, 'TELEFONE INSERIDO');
END;
//
DELIMITER //

DELIMITER //
CREATE TRIGGER updateLogTelefone
    AFTER UPDATE ON Telefone
    FOR EACH ROW
BEGIN
    INSERT INTO LogTelefone(IDTelefone, CodigoPais, DDD, Numero, IDUsuario, Acao)
    VALUES(new.ID, new.CodigoPais, new.DDD, new.Numero, new.IDUsuario, 'TELEFONE ATUALIZADO');
END;
//
DELIMITER //

DELIMITER //
CREATE TRIGGER deleteLogTelefone
    BEFORE DELETE ON Telefone
    FOR EACH ROW
BEGIN
    INSERT INTO LogTelefone(IDTelefone, CodigoPais, DDD, Numero, IDUsuario, Acao)
    VALUES(old.ID, old.CodigoPais, old.DDD, old.Numero, old.IDUsuario, 'TELEFONE DELETADO');
END;
//
DELIMITER //

-- Quadra
DELIMITER //
CREATE TRIGGER insertLogQuadra
    AFTER INSERT ON Quadra
    FOR EACH ROW
BEGIN
    INSERT INTO LogQuadra(IDQuadra, Nome, Acao) 
    VALUES(new.ID, new.Nome, 'QUADRA INSERIDA');
END;
//
DELIMITER //

DELIMITER //
CREATE TRIGGER updateLogQuadra
    AFTER UPDATE ON Quadra
    FOR EACH ROW
BEGIN
    INSERT INTO LogQuadra(IDQuadra, Nome, Acao) 
    VALUES(new.ID, new.Nome, 'QUADRA ATUALIZADA');
END;
//
DELIMITER //

DELIMITER //
CREATE TRIGGER deleteLogQuadra
    BEFORE DELETE ON Quadra
    FOR EACH ROW
BEGIN
    INSERT INTO LogQuadra(IDQuadra, Nome, Acao) 
    VALUES(old.ID, old.Nome, 'QUADRA DELETADA');
END;
//
DELIMITER //

-- ReservaQuadra
DELIMITER //
CREATE TRIGGER insertLogReservaQuadra
    AFTER INSERT ON ReservaQuadra
    FOR EACH ROW
BEGIN
    INSERT INTO LogReservaQuadra(IDReservaQuadra, DataHoraInicio, DataHoraFim, IDUsuario, IDQuadra, Acao) 
    VALUES(new.ID, new.DataHoraInicio, new.DataHoraFim, new.IDUsuario, new.IDQuadra, 'RESERVAQUADRA INSERIDA');
END;
//
DELIMITER //

DELIMITER //
CREATE TRIGGER updateLogReservaQuadra
    AFTER UPDATE ON ReservaQuadra
    FOR EACH ROW
BEGIN
    INSERT INTO LogReservaQuadra(IDReservaQuadra, DataHoraInicio, DataHoraFim, IDUsuario, IDQuadra, Acao) 
    VALUES(new.ID, new.DataHoraInicio, new.DataHoraFim, new.IDUsuario, new.IDQuadra, 'RESERVAQUADRA ATUALIZADA');
END;
//
DELIMITER //

DELIMITER //
CREATE TRIGGER deleteLogReservaQuadra
    BEFORE DELETE ON ReservaQuadra
    FOR EACH ROW
BEGIN
    INSERT INTO LogReservaQuadra(IDReservaQuadra, DataHoraInicio, DataHoraFim, IDUsuario, IDQuadra, Acao) 
    VALUES(old.ID, old.DataHoraInicio, old.DataHoraFim, old.IDUsuario, old.IDQuadra, 'RESERVAQUADRA DELETADA');
END;
//
DELIMITER //

-- Churrasqueira
DELIMITER //
CREATE TRIGGER insertLogChurrasqueira
    AFTER INSERT ON Churrasqueira
    FOR EACH ROW
BEGIN
    INSERT INTO LogChurrasqueira(IDChurrasqueira, Nome, Capacidade, Acao) 
    VALUES(new.ID, new.Nome, new.Capacidade, 'CHURRASQUEIRA INSERIDA');
END;
//
DELIMITER //

DELIMITER //
CREATE TRIGGER updateLogChurrasqueira
    AFTER UPDATE ON Churrasqueira
    FOR EACH ROW
BEGIN
    INSERT INTO LogChurrasqueira(IDChurrasqueira, Nome, Capacidade, Acao) 
    VALUES(new.ID, new.Nome, new.Capacidade, 'CHURRASQUEIRA ATUALIZADA');
END;
//
DELIMITER //

DELIMITER //
CREATE TRIGGER deleteLogChurrasqueira
    BEFORE DELETE ON Churrasqueira
    FOR EACH ROW
BEGIN
    INSERT INTO LogChurrasqueira(IDChurrasqueira, Nome, Capacidade, Acao) 
    VALUES(old.ID, old.Nome, old.Capacidade, 'CHURRASQUEIRA DELETADA');
END;
//
DELIMITER //

-- ReservaChurrasqueira
DELIMITER //
CREATE TRIGGER insertLogReservaChurrasqueira
    AFTER INSERT ON ReservaChurrasqueira
    FOR EACH ROW
BEGIN
    INSERT INTO LogReservaChurrasqueira(IDReservaChurrasqueira, DataReserva, IDUsuario, IDChurrasqueira, Acao) 
    VALUES(new.ID, new.DataReserva, new.IDUsuario, new.IDChurrasqueira, 'RESERVACHURRASQUEIRA INSERIDA');
END;
//
DELIMITER //

DELIMITER //
CREATE TRIGGER deleteLogReservaChurrasqueira
    BEFORE DELETE ON ReservaChurrasqueira
    FOR EACH ROW
BEGIN
    INSERT INTO LogReservaChurrasqueira(IDReservaChurrasqueira, DataReserva, IDUsuario, IDChurrasqueira, Acao) 
    VALUES(old.ID, old.DataReserva, old.IDUsuario, old.IDChurrasqueira, 'RESERVACHURRASQUEIRA DELETADA');
END;
//
DELIMITER //

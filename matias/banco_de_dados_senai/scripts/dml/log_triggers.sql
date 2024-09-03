DELIMITER //
CREATE TRIGGER insertLogEndereco
    after insert on Endereco
    for each row
    begin 
    insert into LogEndereco (IDEndereco, CEP, Numero, Complemento, IDUsuario, Acao) values(
        new.ID, new.CEP, new.Numero, new.Complemento, new.IDUsuario, "Endereco INSERIDO"
    );
end 
// DELIMITER //
    
DELIMITER //
CREATE TRIGGER updateLogEndereco
    after update on Endereco
    for each row
    begin 
    insert into LogEndereco (IDEndereco, CEP, Numero, Complemento, IDUsuario, Acao) values(
        new.ID, new.CEP, new.Numero, new.Complemento, new.IDUsuario, "Endereco EDITADO"
    );
end 
// DELIMITER //

DELIMITER //
CREATE TRIGGER deleteLogEndereco
    before delete on Endereco
    for each row
    begin 
    insert into LogEndereco (IDEndereco, CEP, Numero, Complemento, IDUsuario, Acao) values(
        old.ID, old.CEP, old.Numero, old.Complemento, old.IDUsuario, "Endereco DELETADO"
    );
end 
// DELIMITER //

DELIMITER //
CREATE TRIGGER insertLogQuadra
	after insert on Quadra
    for each row
    begin
    insert into LogQuadra(IDQuadra, Nome, Acao) values(
		new.ID, new.Nome, "Quadra INSERIDA"
        );
	end 
// DELIMITER //

DELIMITER //
CREATE TRIGGER updateLogQuadra
	after update on Quadra
    for each row
    begin
    insert into LogQuadra(IDQuadra, Nome, Acao) values(
		new.ID, new.Nome, "Quadra EDITADA"
        );
	end 
// DELIMITER //

DELIMITER //
CREATE TRIGGER deleteLogQuadra
	before delete on Quadra
    for each row
    begin
    insert into LogQuadra(IDQuadra, Nome, Acao) values(
		old.ID, old.Nome, "Quadra DELETADA"
        );
	end 
// DELIMITER //

DELIMITER //
CREATE TRIGGER insertLogReservaQuadra
	after insert on ReservaQuadra
    for each row
    begin
    insert into LogReservaQuadra(IDReservaQuadra, DataHoraInicio, DataHoraFim, IDUsuario, IDQuadra, Acao) values(
		new.ID, new.DataHoraInicio, new.DataHoraFim, new.IDUsuario, new.IDQuadra, "ReservaQuadra INSERIDA"
        );
	end 
// DELIMITER //

DELIMITER //
CREATE TRIGGER updateLogReservaQuadra
	after update on ReservaQuadra
    for each row
    begin
    insert into LogReservaQuadra(IDReservaQuadra, DataHoraInicio, DataHoraFim, IDUsuario, IDQuadra, Acao) values(
		new.ID, new.DataHoraInicio, new.DataHoraFim, new.IDUsuario, new.IDQuadra, "ReservaQuadra EDITADA"
        );
	end 
// DELIMITER //

DELIMITER //
CREATE TRIGGER deleteLogReservaQuadra
	before delete on ReservaQuadra
    for each row
    begin
    insert into LogReservaQuadra(IDReservaQuadra, DataHoraInicio, DataHoraFim, IDUsuario, IDQuadra, Acao) values(
		old.ID, old.DataHoraInicio, old.DataHoraFim, old.IDUsuario, old.IDQuadra, "ReservaQuadra DELETADA"
        );
	end 
// DELIMITER //

DELIMITER //
CREATE TRIGGER insertPermissao
	after insert on Permissao
	for each row
	begin
    insert into LogPermissao(IDpermissao, Nivelpermissao, Descricao, Acao) values(
		new.ID, new.NivelPermissao, new.Descricao, "Permissao INSERIDA"
        );
	end
// DELIMITER //

DELIMITER //
CREATE TRIGGER updatePermissao
	after update on Permissao
	for each row
	begin
    insert into LogPermissao(IDpermissao, Nivelpermissao, Descricao, Acao) values(
		new.ID, new.NivelPermissao, new.Descricao, "Permissao ATUALIZADA"
        );
	end
// DELIMITER //

DELIMITER //
CREATE TRIGGER deletePermissao
	before delete on Permissao
	for each row
	begin
    insert into LogPermissao(IDpermissao, Nivelpermissao, Descricao, Acao) values(
		old.ID, old.NivelPermissao, old.Descricao, "Permissao DELETADA"
        );
	end
// DELIMITER //
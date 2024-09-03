update, delete, insert

DELIMITER //

CREATE TRIGGER insertLogEndereco(
    after insert on Endereco
    for each row
    begin 
    insert into LogEndereco values(
        new.ID, new.CEP, new.Numero, new.Complemento, new.IDUsuario, "Endereco inserido"
    )
);
end 
//DELIMITER;
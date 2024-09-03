DELIMITER //
CREATE PROCEDURE excluirUsuario(idUser int)
BEGIN 
	set @permissao = ( 
		SELECT IDPermissao from Usuario u 
    
		INNER JOIN Permissao p
		ON p.ID =  u.IDPermissao
    
		where u.ID = idUser
	);
    START TRANSACTION;
    
    DELETE FROM Usuario WHERE ID = idUser;
    
    IF(@permissao > 1)  THEN ROLLBACK ;
    ELSE COMMIT;
    END IF;
END;
//
DELIMITER ;


DELIMITER //
CREATE PROCEDURE editarUsuario(idUsuario int, idPermissao int, nome varchar(255), cpf varchar(15), dataNasc date)
begin
	update Usuario 
    set IDPermissao = idPermissao, Nome = nome, CPF = cpf, DataNasc = dataNasc
    WHERE IDUsuario = idUsuario;
    
    IF(idPermissao > IDPermissao) THEN ROLLBACK ;
    ELSE COMMIT;
    END IF;
end;
//
DELIMITER ;






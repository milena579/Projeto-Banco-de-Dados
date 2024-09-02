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
    
    IF(@permissao = 2)  THEN ROLLBACK ;
    ELSE COMMIT;
    END IF;
END;
//
DELIMITER ;



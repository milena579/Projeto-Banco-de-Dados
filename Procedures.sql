DELIMITER //
CREATE PROCEDURE excluirUsuario(idUser INT)
BEGIN 
    SET @permissao = ( 
        SELECT IDPermissao 
        FROM Usuario u 
        INNER JOIN Permissao p
        ON p.ID = u.IDPermissao
        WHERE u.ID = idUser
    );
    START TRANSACTION;
    
    DELETE FROM Usuario WHERE ID = idUser;
    
    IF(@permissao > 1) THEN 
        ROLLBACK;
    ELSE 
        COMMIT;
    END IF;
END;
//
DELIMITER //

DELIMITER //
CREATE PROCEDURE editarUsuario(idUsuario INT, idPermissao INT, nome VARCHAR(255), cpf VARCHAR(25), dataNasc DATE)
BEGIN
    DECLARE oldPermissao INT;
    
    -- Retrieve the current permissao level of the user
    SELECT IDPermissao INTO oldPermissao
    FROM Usuario
    WHERE ID = idUsuario;
    
    START TRANSACTION;
    
    -- Update the user information
    UPDATE Usuario
    SET IDPermissao = idPermissao, Nome = nome, CPF = cpf, DataNasc = dataNasc
    WHERE ID = idUsuario;
    
    -- Rollback or commit based on permissao level
    IF idPermissao > oldPermissao THEN
        ROLLBACK;
    ELSE
        COMMIT;
    END IF;
END;
//
DELIMITER //

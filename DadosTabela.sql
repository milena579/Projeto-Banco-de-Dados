INSERT INTO Permissao (NivelPermissao, Descricao) VALUES
(1, 'Usuário Comum'),
(2, 'Administrador'),
(3, 'Gerente');

INSERT INTO Usuario (IDPermissao, Nome, CPF, DataNasc) VALUES
(1, 'João Silva', 12345678901, '1985-04-15'),
(2, 'Maria Oliveira', 98765432100, '1990-11-22'),
(3, 'Pedro Santos', 45678912345, '1982-06-30');


INSERT INTO Endereco (CEP, Numero, Complemento, IDUsuario) VALUES
(12345678, 100, 'Apto 101', 1),
(23456789, 200, 'Casa', 2),
(34567890, 300, 'Apto 303', 3);


INSERT INTO Telefone (CodigoPais, DDD, Numero, IDUsuario) VALUES
(55, 11, 123456789, 1),
(55, 21, 987654321, 2),
(55, 31, 456789123, 3);


INSERT INTO Quadra (Nome) VALUES
('Quadra A'),
('Quadra B'),
('Quadra C');


INSERT INTO ReservaQuadra (DataHoraInicio, DataHoraFim, IDUsuario, IDQuadra) VALUES
('2024-09-10 14:00:00', '2024-09-10 16:00:00', 1, 1),
('2024-09-11 09:00:00', '2024-09-11 11:00:00', 2, 2),
('2024-09-12 18:00:00', '2024-09-12 20:00:00', 3, 3);


INSERT INTO Churrasqueira (Nome, Capacidade) VALUES
('Churrasqueira 1', 10),
('Churrasqueira 2', 20),
('Churrasqueira 3', 15);


INSERT INTO ReservaChurrasqueira (DataReserva, IDUsuario, IDChurrasqueira) VALUES
('2024-09-10', 1, 1),
('2024-09-11', 2, 2),
('2024-09-12', 3, 3);


INSERT INTO Permissao (NivelPermissao, Descricao) VALUES
(1, 'Administrador'),
(2, 'Gerente'),
(3, 'Funcionário'),
(4, 'Visitante'),
(5, 'Convidado');

INSERT INTO Usuario (IDPermissao, Nome, CPF, DataNasc, DataCadastro) VALUES
(1, 'Ana Souza', '123.456.789-01', '1985-06-15', '2024-09-01 08:00:00'),
(2, 'Carlos Oliveira', '234.567.890-12', '1990-03-22', '2024-09-01 09:00:00'),
(3, 'Fernanda Lima', '345.678.901-23', '1982-12-05', '2024-09-01 10:00:00'),
(4, 'João Silva', '456.789.012-34', '2000-01-18', '2024-09-01 11:00:00'),
(5, 'Maria Santos', '567.890.123-45', '1995-07-30', '2024-09-01 12:00:00');

INSERT INTO Endereco (CEP, Numero, Complemento, IDUsuario) VALUES
('12345-678', '100', 'Apto 101', 1),
('23456-789', '200', 'Casa 2', 2),
('34567-890', '300', 'Bloco B', 3),
('45678-901', '400', 'Sala 4', 4),
('56789-012', '500', 'Andar 5', 5);

INSERT INTO Telefone (CodigoPais, DDD, Numero, IDUsuario) VALUES
('55', '11', '123456789', 1),
('55', '21', '234567890', 2),
('55', '31', '345678901', 3),
('55', '41', '456789012', 4),
('55', '51', '567890123', 5);

INSERT INTO Quadra (Nome) VALUES
('Quadra A'),
('Quadra B'),
('Quadra C'),
('Quadra D'),
('Quadra E');

INSERT INTO ReservaQuadra (DataHoraInicio, DataHoraFim, IDUsuario, IDQuadra) VALUES
('2024-09-10 08:00:00', '2024-09-10 09:00:00', 1, 1),
('2024-09-11 10:00:00', '2024-09-11 11:00:00', 2, 2),
('2024-09-12 14:00:00', '2024-09-12 15:00:00', 3, 3),
('2024-09-13 16:00:00', '2024-09-13 17:00:00', 4, 4),
('2024-09-14 18:00:00', '2024-09-14 19:00:00', 5, 5);

INSERT INTO Churrasqueira (Nome, Capacidade) VALUES
('Churrasqueira 1', 10),
('Churrasqueira 2', 15),
('Churrasqueira 3', 20),
('Churrasqueira 4', 25),
('Churrasqueira 5', 30);

INSERT INTO ReservaChurrasqueira (DataReserva, IDUsuario, IDChurrasqueira) VALUES
('2024-09-15', 1, 1),
('2024-09-16', 2, 2),
('2024-09-17', 3, 3),
('2024-09-18', 4, 4),
('2024-09-19', 5, 5);
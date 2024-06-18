CREATE TABLE CLIENTE(
    id_cliente SERIAL PRIMARY KEY,
    email VARCHAR(100) NOT NULL,
    celular VARCHAR(20) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    sobrenome VARCHAR(50) NOT NULL,
    endereco VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    estado CHAR(2) NOT NULL
);

CREATE TABLE AGENCIA (
    numero_agencia SERIAL PRIMARY KEY,
    email VARCHAR(100) NOT NULL,
    telefone VARCHAR(100) NOT NULL,
    endereco VARCHAR(255) NOT NULL
);

CREATE TABLE COMPROVANTE (
    id_comprovante SERIAL PRIMARY KEY,
    comprovante VARCHAR(1000) NOT NULL
);

CREATE TABLE PAGAMENTO (
    id_pagamento SERIAL PRIMARY KEY,
    status_pagamento VARCHAR(100) DEFAULT 'PENDENTE' NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    forma_pagamento VARCHAR(100) NOT NULL,
    data_pagamento DATE NOT NULL,
    id_comprovante INT NOT NULL,
    FOREIGN KEY (id_comprovante) REFERENCES COMPROVANTE (id_comprovante)
);

CREATE TABLE LOCACAO (
    id_locacao SERIAL PRIMARY KEY,
    id_cliente INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente),
    numero_agencia INT NOT NULL,
    foreign key (numero_agencia) REFERENCES AGENCIA(numero_agencia),
    data_devolucao DATE DEFAULT CURRENT_DATE NOT NULL,
    data_locacao DATE DEFAULT CURRENT_DATE NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL,
    id_pagamento SERIAL NOT NULL,
    FOREIGN KEY (id_pagamento) REFERENCES PAGAMENTO(id_pagamento)
);

CREATE TABLE CARRO (
    id_carro SERIAL PRIMARY KEY,
    numero_agencia INT NOT NULL,
    FOREIGN KEY (numero_agencia) REFERENCES AGENCIA (numero_agencia),   
    placa VARCHAR(100) NOT NULL,
    modelo VARCHAR(100) NOT NULL,
    ano DATE NOT NULL,
    tipo VARCHAR(1),
    disponibilidade VARCHAR(50) DEFAULT 'DISPONIVEL' NOT NULL,
    id_locacao INT NOT NULL,
    FOREIGN KEY (id_locacao) REFERENCES LOCACAO(id_locacao),
    valor_total DECIMAL NOT NULL
);

CREATE TABLE FEEDBACK (
    id_feedback SERIAL PRIMARY KEY,
    comentario VARCHAR(255) NOT NULL,
    avaliacao VARCHAR(255) NOT NULL,
    id_cliente INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE (id_cliente)
);

CREATE TABLE FUNCIONARIO (
    id_funcionario SERIAL PRIMARY KEY,
    salario DECIMAL(10,2) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    sobrenome VARCHAR(100) NOT NULL,
    data_contratacao DATE NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    numero_agencia INT NOT NULL,
    FOREIGN KEY(numero_agencia) REFERENCES AGENCIA(numero_agencia)
);

CREATE TABLE MANUTENCAO (
    id_manutencao SERIAL PRIMARY KEY,
    custo DECIMAL(10,2) NOT NULL,
    data_manutencao DATE DEFAULT CURRENT_DATE NOT NULL,
    km INT NOT NULL,
    tipo_manutencao VARCHAR(100) NOT NULL,
    descricao VARCHAR(1000)
);

CREATE TABLE ORDEM_MANUTENCAO (
    id_ordem_manutencao SERIAL PRIMARY KEY,
	id_manutencao INT NOT NULL,
    data_emissao DATE DEFAULT CURRENT_DATE NOT NULL,
    local VARCHAR(100),
    descricao VARCHAR(1000),
    objetivo VARCHAR(1000),
    id_carro INT NOT NULL,
    id_locacao INT NOT NULL,
    FOREIGN KEY(id_manutencao) REFERENCES MANUTENCAO (id_manutencao),
    FOREIGN KEY(id_locacao) REFERENCES LOCACAO (id_locacao),
	FOREIGN KEY(id_carro) REFERENCES CARRO (id_carro)
);

--Inserindo dados gerados pelo ChatGPT 3.5
-- CLIENTE
INSERT INTO CLIENTE (email, celular, nome, sobrenome, endereco, cidade, estado)
VALUES
    ('cliente1@example.com', '1234567890', 'João', 'Silva', 'Rua A, 123', 'São Paulo', 'SP'),
    ('cliente2@example.com', '0987654321', 'Maria', 'Santos', 'Avenida B, 456', 'Rio de Janeiro', 'RJ'),
    ('cliente3@example.com', '1112223333', 'Pedro', 'Oliveira', 'Rua C, 789', 'Belo Horizonte', 'MG'),
    ('cliente4@example.com', '9998887777', 'Ana', 'Ferreira', 'Avenida D, 1011', 'Porto Alegre', 'RS'),
    ('cliente5@example.com', '7778889999', 'Lucas', 'Souza', 'Rua E, 1213', 'Salvador', 'BA'),
    ('cliente6@example.com', '3334445555', 'Carla', 'Martins', 'Rua F, 1415', 'Curitiba', 'PR'),
    ('cliente7@example.com', '6665554444', 'Gustavo', 'Ribeiro', 'Avenida G, 1617', 'Recife', 'PE'),
    ('cliente8@example.com', '2223334444', 'Aline', 'Almeida', 'Rua H, 1819', 'Fortaleza', 'CE'),
    ('cliente9@example.com', '5556667777', 'Bruno', 'Cruz', 'Rua I, 2021', 'Manaus', 'AM'),
    ('cliente10@example.com', '4445556666', 'Fernanda', 'Lima', 'Avenida J, 2223', 'Brasília', 'DF');

-- AGENCIA
INSERT INTO AGENCIA (email, telefone, endereco)
VALUES
    ('agencia1@example.com', '(11) 1234-5678', 'Av. Paulista, 1001 - São Paulo, SP'),
    ('agencia2@example.com', '(21) 9876-5432', 'Av. Rio Branco, 2002 - Rio de Janeiro, RJ'),
    ('agencia3@example.com', '(31) 1111-2222', 'Av. Afonso Pena, 3003 - Belo Horizonte, MG'),
    ('agencia4@example.com', '(51) 9999-8888', 'Av. Borges de Medeiros, 4004 - Porto Alegre, RS'),
    ('agencia5@example.com', '(71) 7777-8888', 'Av. Tancredo Neves, 5005 - Salvador, BA'),
    ('agencia6@example.com', '(41) 3333-4444', 'Av. Sete de Setembro, 6006 - Curitiba, PR'),
    ('agencia7@example.com', '(81) 6666-5555', 'Av. Boa Viagem, 7007 - Recife, PE'),
    ('agencia8@example.com', '(85) 2222-3333', 'Av. Beira Mar, 8008 - Fortaleza, CE'),
    ('agencia9@example.com', '(92) 5555-6666', 'Av. Djalma Batista, 9009 - Manaus, AM'),
    ('agencia10@example.com', '(61) 4444-5555', 'Esplanada dos Ministérios, Bloco C - Brasília, DF');
	
--ADICIONANDO O CAMPO NOME A TABELA AGENCIA;
ALTER TABLE AGENCIA
ADD COLUMN nome VARCHAR(100) DEFAULT 'Nome Temporario';

UPDATE AGENCIA
SET nome = CASE
	WHEN numero_agencia = 1 THEN 'Agência Central'
	WHEN numero_agencia = 2 THEN 'Agência Zona Sul'
    WHEN numero_agencia = 3 THEN 'Agência Centro'
    WHEN numero_agencia = 4 THEN 'Agência Norte'
    WHEN numero_agencia = 5 THEN 'Agência Leste'
    WHEN numero_agencia = 6 THEN 'Agência Oeste'
    WHEN numero_agencia = 7 THEN 'Agência Praia'
    WHEN numero_agencia = 8 THEN 'Agência Montanha'
    WHEN numero_agencia = 9 THEN 'Agência Floresta'
    WHEN numero_agencia = 10 THEN 'Agência Capital'
	ELSE 'Agência Desconhecida'
END;

ALTER TABLE AGENCIA ALTER COLUMN nome SET NOT NULL;

-- COMPROVANTE
INSERT INTO COMPROVANTE (comprovante)
VALUES
    ('Comprovante de pagamento 1'),
    ('Comprovante de pagamento 2'),
    ('Comprovante de pagamento 3'),
    ('Comprovante de pagamento 4'),
    ('Comprovante de pagamento 5'),
    ('Comprovante de pagamento 6'),
    ('Comprovante de pagamento 7'),
    ('Comprovante de pagamento 8'),
    ('Comprovante de pagamento 9'),
    ('Comprovante de pagamento 10');

ALTER TABLE COMPROVANTE
ADD COLUMN id_pagamento INT;

UPDATE COMPROVANTE
	SET id_pagamento = CASE
	WHEN id_comprovante = 1 THEN 1
	WHEN id_comprovante = 2 THEN 2
	WHEN id_comprovante = 3 THEN 3
	WHEN id_comprovante = 4 THEN 4
	WHEN id_comprovante = 5 THEN 5
	WHEN id_comprovante = 6 THEN 6
	WHEN id_comprovante = 7 THEN 7
	WHEN id_comprovante = 8 THEN 8
	WHEN id_comprovante = 9 THEN 9
	WHEN id_comprovante = 10 THEN 10
END;

ALTER TABLE COMPROVANTE
ALTER COLUMN id_pagamento
SET NOT NULL;

ALTER TABLE COMPROVANTE ADD CONSTRAINT id_pagamento
FOREIGN KEY (id_pagamento) REFERENCES PAGAMENTO (id_pagamento);

ALTER TABLE COMPROVANTE
ADD COLUMN id_cliente INT;

UPDATE COMPROVANTE
	SET id_cliente = CASE
	WHEN id_comprovante = 1 THEN 1
	WHEN id_comprovante = 2 THEN 2
	WHEN id_comprovante = 3 THEN 3
	WHEN id_comprovante = 4 THEN 4
	WHEN id_comprovante = 5 THEN 5
	WHEN id_comprovante = 6 THEN 6
	WHEN id_comprovante = 7 THEN 7
	WHEN id_comprovante = 8 THEN 8
	WHEN id_comprovante = 9 THEN 9
	WHEN id_comprovante = 10 THEN 10
END;

ALTER TABLE COMPROVANTE ADD CONSTRAINT id_cliente
FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente);

ALTER TABLE COMPROVANTE
ALTER COLUMN id_cliente
SET NOT NULL;


-- PAGAMENTO
INSERT INTO PAGAMENTO (status_pagamento, valor, forma_pagamento, data_pagamento, id_comprovante)
VALUES
    ('CONCLUÍDO', 150.00, 'Cartão de Crédito', '2024-05-01', 1),
    ('PENDENTE', 200.00, 'Boleto Bancário', '2024-05-02', 2),
    ('CONCLUÍDO', 180.00, 'Transferência Bancária', '2024-05-03', 3),
    ('PENDENTE', 220.00, 'Dinheiro', '2024-05-04', 4),
    ('CONCLUÍDO', 190.00, 'Cartão de Débito', '2024-05-05', 5),
    ('PENDENTE', 210.00, 'PIX', '2024-05-06', 6),
    ('CONCLUÍDO', 170.00, 'Cartão de Crédito', '2024-05-07', 7),
    ('PENDENTE', 230.00, 'Boleto Bancário', '2024-05-08', 8),
    ('CONCLUÍDO', 160.00, 'Transferência Bancária', '2024-05-09', 9),
    ('PENDENTE', 240.00, 'Dinheiro', '2024-05-10', 10);

	ALTER TABLE PAGAMENTO
	DROP COLUMN id_comprovante;

-- LOCACAO
INSERT INTO LOCACAO (id_cliente, numero_agencia, data_devolucao, data_locacao, valor_total, id_pagamento)
VALUES
    (1, 1, '2024-05-08', '2024-05-01', 200.00, 1),
    (2, 2, '2024-05-09', '2024-05-02', 220.00, 2),
    (3, 3, '2024-05-10', '2024-05-03', 210.00, 3),
    (4, 4, '2024-05-11', '2024-05-04', 230.00, 4),
    (5, 5, '2024-05-12', '2024-05-05', 240.00, 5),
    (6, 6, '2024-05-13', '2024-05-06', 190.00, 6),
    (7, 7, '2024-05-14', '2024-05-07', 180.00, 7),
    (8, 8, '2024-05-15', '2024-05-08', 170.00, 8),
    (9, 9, '2024-05-16', '2024-05-09', 160.00, 9),
    (10, 10, '2024-05-17', '2024-05-10', 150.00, 10);

-- CARRO
INSERT INTO CARRO (numero_agencia, placa, modelo, ano, tipo, disponibilidade, id_locacao, valor_total)
VALUES
    (1, 'ABC1234', 'Fiat Palio', '2020-01-01', 'C', 'DISPONIVEL', 1, 50.00),
    (2, 'DEF5678', 'Volkswagen Gol', '2019-01-01', 'C', 'DISPONIVEL', 2, 60.00),
    (3, 'GHI9012', 'Ford Ka', '2021-01-01', 'C', 'DISPONIVEL', 3, 70.00),
    (4, 'JKL3456', 'Chevrolet Onix', '2018-01-01', 'C', 'DISPONIVEL', 4, 80.00),
    (5, 'MNO7890', 'Renault Kwid', '2022-01-01', 'C', 'DISPONIVEL', 5, 90.00),
    (6, 'PQR1234', 'Hyundai HB20', '2017-01-01', 'C', 'DISPONIVEL', 6, 100.00),
    (7, 'STU5678', 'Toyota Corolla', '2020-01-01', 'C', 'DISPONIVEL', 7, 110.00),
    (8, 'VWX9012', 'Honda Civic', '2019-01-01', 'C', 'DISPONIVEL', 8, 120.00),
    (9, 'YZA3456', 'Nissan Versa', '2021-01-01', 'C', 'DISPONIVEL', 9, 130.00),
    (10, 'BCD7890', 'Kia Cerato', '2018-01-01', 'C', 'DISPONIVEL', 10, 140.00);

ALTER TABLE CARRO
DROP COLUMN id_locacao;

-- FEEDBACK
INSERT INTO FEEDBACK (comentario, avaliacao, id_cliente)
VALUES
    ('Ótimo serviço, carro em perfeito estado.', '5 estrelas', 1),
    ('Atendimento rápido e eficiente.', '4 estrelas', 2),
    ('Carro limpo e confortável.', '5 estrelas', 3),
    ('Poderia ter mais opções de modelos de carros.', '3 estrelas', 4),
    ('Preço justo e bom atendimento.', '4 estrelas', 5),
    ('Tive um pequeno problema com o carro, mas foi resolvido rapidamente pela equipe.', '4 estrelas', 6),
    ('Recomendo a todos, excelente agência de locação.', '5 estrelas', 7),
    ('Facilidade na reserva e retirada do carro.', '5 estrelas', 8),
    ('Funcionários muito prestativos.', '4 estrelas', 9),
    ('Boa variedade de carros disponíveis.', '4 estrelas', 10);

-- FUNCIONARIO
INSERT INTO FUNCIONARIO (salario, nome, sobrenome, data_contratacao, cargo, numero_agencia)
VALUES
    (3000.00, 'Carlos', 'Oliveira', '2020-01-01', 'Atendente', 1),
    (3200.00, 'Ana', 'Santos', '2019-01-01', 'Gerente', 2),
    (2800.00, 'Paulo', 'Silva', '2021-01-01', 'Atendente', 3),
    (3300.00, 'Mariana', 'Costa', '2018-01-01', 'Gerente', 4),
    (3100.00, 'Fernando', 'Pereira', '2022-01-01', 'Atendente', 5),
    (2900.00, 'Camila', 'Rodrigues', '2017-01-01', 'Gerente', 6),
    (3400.00, 'Rafael', 'Almeida', '2023-01-01', 'Atendente', 7),
    (3000.00, 'Juliana', 'Martins', '2016-01-01', 'Gerente', 8),
    (3200.00, 'Lucas', 'Ferreira', '2024-01-01', 'Atendente', 9),
    (2800.00, 'Aline', 'Gomes', '2015-01-01', 'Gerente', 10);

-- MANUTENCAO
INSERT INTO MANUTENCAO (custo, data_manutencao, km, tipo_manutencao, descricao)
VALUES
    (200.00, '2024-05-01', 5000, 'Preventiva', 'Troca de óleo e filtro'),
    (250.00, '2024-05-02', 6000, 'Corretiva', 'Substituição de pastilhas de freio'),
    (300.00, '2024-05-03', 7000, 'Preventiva', 'Balanceamento e alinhamento'),
    (180.00, '2024-05-04', 8000, 'Corretiva', 'Reparo de sistema elétrico'),
    (220.00, '2024-05-05', 9000, 'Preventiva', 'Verificação geral'),
    (270.00, '2024-05-06', 10000, 'Corretiva', 'Troca de amortecedores'),
    (230.00, '2024-05-07', 11000, 'Preventiva', 'Troca de correia dentada'),
    (210.00, '2024-05-08', 12000, 'Corretiva', 'Reparo de sistema de ar condicionado'),
    (190.00, '2024-05-09', 13000, 'Preventiva', 'Troca de velas e cabos de ignição'),
    (280.00, '2024-05-10', 14000, 'Corretiva', 'Substituição de peças danificadas');

-- ORDEM_MANUTENCAO
INSERT INTO ORDEM_MANUTENCAO (id_manutencao, data_emissao, local, descricao, objetivo, id_carro, id_locacao)
VALUES
    (1, '2024-05-01', 'Oficina Mecânica A', 'Realizar manutenção preventiva', 'Manter o carro em bom estado de funcionamento', 1, 1),
    (2, '2024-05-02', 'Oficina Mecânica B', 'Realizar manutenção corretiva', 'Resolver problema de falha nos freios', 2, 2),
    (3, '2024-05-03', 'Oficina Mecânica C', 'Realizar manutenção preventiva', 'Garantir estabilidade e segurança do veículo', 3, 3),
    (4, '2024-05-04', 'Oficina Mecânica D', 'Realizar manutenção corretiva', 'Consertar problema no sistema elétrico', 4, 4),
    (5, '2024-05-05', 'Oficina Mecânica E', 'Realizar manutenção preventiva', 'Verificar e prevenir possíveis falhas', 5, 5),
    (6, '2024-05-06', 'Oficina Mecânica F', 'Realizar manutenção corretiva', 'Trocar amortecedores danificados', 6, 6),
    (7, '2024-05-07', 'Oficina Mecânica G', 'Realizar manutenção preventiva', 'Evitar danos maiores no motor', 7, 7),
    (8, '2024-05-08', 'Oficina Mecânica H', 'Realizar manutenção corretiva', 'Reparar sistema de ar condicionado com defeito', 8, 8),
    (9, '2024-05-09', 'Oficina Mecânica I', 'Realizar manutenção preventiva', 'Manter bom funcionamento do motor', 9, 9),
    (10, '2024-05-10', 'Oficina Mecânica J', 'Realizar manutenção corretiva', 'Substituir peças danificadas', 10, 10);

ALTER TABLE ORDEM_MANUTENCAO
ADD COLUMN status VARCHAR(50) DEFAULT 'PENDENTE';

UPDATE ORDEM_MANUTENCAO
SET status = CASE
	WHEN id_ordem_manutencao = 1 THEN 'PENDENTE'
	WHEN id_ordem_manutencao = 2 THEN 'PENDENTE'
	WHEN id_ordem_manutencao = 3 THEN 'PENDENTE'
	WHEN id_ordem_manutencao = 4 THEN 'PENDENTE'
	WHEN id_ordem_manutencao = 5 THEN 'PENDENTE'
	WHEN id_ordem_manutencao = 6 THEN 'PENDENTE'
	WHEN id_ordem_manutencao = 7 THEN 'PENDENTE'
	WHEN id_ordem_manutencao = 8 THEN 'PENDENTE'
	WHEN id_ordem_manutencao = 9 THEN 'PENDENTE'
	WHEN id_ordem_manutencao = 10 THEN 'PENDENTE'
	ELSE 'PENDENTE'
END;

ALTER TABLE ORDEM_MANUTENCAO
ALTER COLUMN status
SET NOT NULL;

--Exercicios
--SELECT
SELECT * FROM CARRO
WHERE disponibilidade = 'DISPONIVEL';
--
SELECT DISTINCT CLIENTE.*,LOCACAO.data_locacao
FROM CLIENTE
INNER JOIN LOCACAO ON CLIENTE.id_cliente = LOCACAO.id_cliente
WHERE LOCACAO.data_locacao >= CURRENT_DATE - INTERVAL '3 months';
--
SELECT FUNCIONARIO.*,AGENCIA.nome
FROM funcionario
INNER JOIN AGENCIA ON FUNCIONARIO.numero_agencia = AGENCIA.numero_agencia
WHERE AGENCIA.nome = 'Agência Norte';
--
SELECT * FROM AGENCIA;
--
SELECT  DISTINCT CARRO.*, ORDEM_MANUTENCAO.*
FROM CARRO
INNER JOIN ORDEM_MANUTENCAO ON CARRO.id_carro = CARRO.id_carro;
--UPDATE
UPDATE CARRO
SET valor_total = valor_total * 1.3
WHERE modelo LIKE '%Toyota%';
--
UPDATE LOCACAO
set data_devolucao = data_devolucao + (CURRENT_DATE + INTERVAL '2 months')
WHERE id_locacao = 1;
--
UPDATE ORDEM_MANUTENCAO
SET status = 'CONCLUIDA'
WHERE id_ordem_manutencao = 1;

SELECT * FROM ORDEM_MANUTENCAO;
--ALTER TABLE
ALTER TABLE CLIENTE
ADD COLUMN habilitacao VARCHAR(100) DEFAULT '';

UPDATE CLIENTE
SET habilitacao = CASE
    WHEN id_cliente = 1 THEN '12345678901'
    WHEN id_cliente = 2 THEN '98765432100'
    WHEN id_cliente = 3 THEN '12345098765'
    WHEN id_cliente = 4 THEN '56789012345'
    WHEN id_cliente = 5 THEN '09876543210'
    WHEN id_cliente = 6 THEN '11223344556'
    WHEN id_cliente = 7 THEN '66554433221'
    WHEN id_cliente = 8 THEN '99887766554'
    WHEN id_cliente = 9 THEN '55443322110'
    WHEN id_cliente = 10 THEN '11002233445'
    ELSE '00000000000'
END;

ALTER TABLE CLIENTE
ALTER COLUMN habilitacao
SET NOT NULL;
--
ALTER TABLE CLIENTE
DROP COLUMN endereco;

SELECT * FROM CLIENTE;
--JOIN

SELECT LOCACAO.data_locacao,CLIENTE.nome, CARRO.modelo
FROM LOCACAO
INNER JOIN CLIENTE 
ON LOCACAO.id_cliente = CLIENTE.id_cliente
INNER JOIN CARRO
ON LOCACAO.id_cliente = CARRO.id_locacao;
--
SELECT PAGAMENTO.valor, CLIENTE.nome
FROM PAGAMENTO
INNER JOIN CLIENTE ON PAGAMENTO

--INSERTS NOVOS
-- AGENCIA
INSERT INTO AGENCIA (email, telefone, endereco, nome)
VALUES
    ('agencia11@example.com', '(11) 1234-5678', 'Av. Paulista, 1001 - São Paulo, SP', 'Agência Sul'),
    ('agencia12@example.com', '(21) 9876-5432', 'Av. Rio Branco, 2002 - Rio de Janeiro, RJ', 'Agência Norte'),
    ('agencia13@example.com', '(31) 1111-2222', 'Av. Afonso Pena, 3003 - Belo Horizonte, MG', 'Agência Centro-Sul'),
    ('agencia14@example.com', '(51) 9999-8888', 'Av. Borges de Medeiros, 4004 - Porto Alegre, RS', 'Agência Leste'),
    ('agencia15@example.com', '(71) 7777-8888', 'Av. Tancredo Neves, 5005 - Salvador, BA', 'Agência Oeste'),
    ('agencia16@example.com', '(41) 3333-4444', 'Av. Sete de Setembro, 6006 - Curitiba, PR', 'Agência Sul'),
    ('agencia17@example.com', '(81) 6666-5555', 'Av. Boa Viagem, 7007 - Recife, PE', 'Agência Leste'),
    ('agencia18@example.com', '(85) 2222-3333', 'Av. Beira Mar, 8008 - Fortaleza, CE', 'Agência Norte'),
    ('agencia19@example.com', '(92) 5555-6666', 'Av. Djalma Batista, 9009 - Manaus, AM', 'Agência Sul'),
    ('agencia20@example.com', '(61) 4444-5555', 'Esplanada dos Ministérios, Bloco C - Brasília, DF', 'Agência Central');


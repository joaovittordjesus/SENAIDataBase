CREATE TABLE CLIENTE(
    CODIGO INT NOT NULL,
    NOME VARCHAR(20) NOT NULL,
    ENDERECO VARCHAR(20) NOT NULL,
    CEP CHAR(8) NOT NULL,
    UF CHAR(2) NOT NULL,
    CNPJ CHAR(20) NOT NULL,
    PRIMARY KEY(CODIGO)
);

CREATE TABLE VENDEDOR(
    CODIGO INT NOT NULL,
    NOME VARCHAR(20) NOT NULL,
    SALARIO DECIMAL(10,2) NOT NULL,
    FSALARIO CHAR(1) NOT NULL,
    PRIMARY KEY(CODIGO)
);

CREATE TABLE CADFUN(
    CODFUN INT NOT NULL PRIMARY KEY,
    NOME VARCHAR(40) NOT NULL,
    DEPTO CHAR(2),
    FUNCAO CHAR(20),
    SALARIO NUMERIC (10,2)
);

-- Inserções para a tabela CLIENTE
INSERT INTO CLIENTE (CODIGO, NOME, ENDERECO, CEP, UF, CNPJ)
VALUES
    (1, 'João Silva', 'Rua A', '12345678', 'SP', '12345678901234'),
    (2, 'Maria Santos', 'Rua B', '23456789', 'RJ', '23456789012345'),
    (3, 'Carlos Oliveira', 'Rua C', '34567890', 'MG', '34567890123456'),
    (4, 'Ana Souza', 'Rua D', '45678901', 'RS', '45678901234567'),
    (5, 'Pedro Costa', 'Rua E', '56789012', 'SC', '56789012345678');

-- Inserções para a tabela VENDEDOR
INSERT INTO VENDEDOR (CODIGO, NOME, SALARIO, FSALARIO)
VALUES
    (1, 'Luciana Lima', 3000.00, 'S'),
    (2, 'Fernando Rocha', 3500.00, 'N'),
    (3, 'Mariana Oliveira', 4000.00, 'S'),
    (4, 'Rodrigo Santos', 3200.00, 'N'),
    (5, 'Camila Pereira', 2800.00, 'S');

-- Inserções para a tabela CADFUN
INSERT INTO CADFUN (CODFUN, NOME, DEPTO, FUNCAO, SALARIO)
VALUES
    (1, 'Gustavo Fernandes', 'A1', 'Analista', 5000.00),
    (2, 'Aline Costa', 'B2', 'Desenvolvedor', 4500.00),
    (3, 'Rafaela Oliveira', 'C3', 'Gerente', 6000.00),
    (4, 'Diego Almeida', 'D4', 'Analista', 5200.00),
    (5, 'Juliana Silva', 'E5', 'Desenvolvedor', 4800.00);

--


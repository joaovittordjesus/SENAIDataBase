--DROPING PREVIOUS TABLES
DROP TABLE IF EXISTS cidade, fornecedor, fornecimento, peca, projeto, produtos, pizzas, clientes, funcionarios, pedidos, entregas;

--CRIANDO TABELAS PARA A PIZZARIA
--CRIANDO TABELA PRODUTOS
CREATE TABLE produtos(
    id_produto SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL, -- Adicionando NOT NULL para o campo nome.
    observacao VARCHAR(50),
    preco DECIMAL(10,2) NOT NULL, -- Adicionando NOT NULL para o campo preco.
    quantidade INT NOT NULL, -- Adicionando NOT NULL para o campo quantidade.
    status_produto VARCHAR(50) DEFAULT 'ATIVO' NOT NULL,
    tipo VARCHAR(50)
);

--CRIANDO UM CAMPO INDEX PARA O CAMPO NOME NA TEBELA PRODUTOS
CREATE INDEX idx_produto_nome ON
produtos(nome);

--CRIANDO A TABELA PIZZAS
CREATE TABLE pizzas(
    id_pizza SERIAL PRIMARY KEY,
    categoria VARCHAR(60) NOT NULL, -- Adicionando NOT NULL para o campo categoria.
    massa VARCHAR(50) NOT NULL, -- Adicionando NOT NULL para o campo massa.
    sabor VARCHAR(60) NOT NULL, -- Adicionando NOT NULL para o campo sabor.
    dimensoes VARCHAR (50),
    peso DECIMAL(10,2),
    ingredientes VARCHAR(255),
    disponivel BOOLEAN DEFAULT TRUE
);

--CRIANDO A TABELA CLIENTES
CREATE TABLE clientes(
    id_cliente SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL, -- Adicionando NOT NULL para o campo nome.
    telefone VARCHAR(11),
    endereco VARCHAR(60),
    email VARCHAR(60),
    tipo VARCHAR(50)
);

--CRIANDO INDEX PARA TABELA CLIENTES NO CAMPO NOME
CREATE INDEX idx_cliente_nome ON
clientes(nome);

--CRIANDO A TABELA FUNCIONARIOS
CREATE TABLE funcionarios(
    id_funcionario SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL, -- Adicionando NOT NULL para o campo nome.
    rg CHAR(11) NOT NULL, -- Adicionando NOT NULL para o campo rg.
    cpf CHAR(11) NOT NULL, -- Adicionando NOT NULL para o campo cpf.
    re VARCHAR(11),
    situacao BOOLEAN DEFAULT TRUE,
    setor VARCHAR(60),
    cargo VARCHAR(60),
    salario DECIMAL(10,2),
    data_contratacao DATE
);

--CRIANDO A TABELA PEDIDOS
CREATE TABLE pedidos(
    id_pedido SERIAL PRIMARY KEY,
    comprovante SERIAL,
    vendedor VARCHAR(50),
    metodo_pagamento VARCHAR(60),
    status_pedido VARCHAR(50),
    id_cliente SERIAL NOT NULL, -- Adicionando NOT NULL para o campo id_cliente.
    id_funcionario SERIAL NOT NULL, -- Adicionando NOT NULL para o campo id_funcionario.
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id_funcionario)
);

--CRIANDO CAMPO INDEX PARA O CAMPO ID_PEDIDO NA TABELA PEDIDOS
CREATE INDEX idx_pedidos_cliente ON
pedidos(id_pedido);

--CRIANDO A TABELA ENTREGAS
CREATE TABLE entregas(
    id_entrega SERIAL PRIMARY KEY,
    local_entrega VARCHAR(60),
    status_entrega VARCHAR(60),
    entregador VARCHAR(60),
    veiculo VARCHAR(60),
    id_pedido SERIAL NOT NULL, -- Adicionando NOT NULL para o campo id_pedido.
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido)
);

--DROPING PREVIOUS TABLES
DROP TABLE cidade, fornecedor, fornecimento, peca, projeto;

--CRIANDO TABELAS PARA A PIZZARIA
--CRIANDO TABELA PRODUTS
CREATE TABLE PRODUTOS(
	ID_PRODUTO SERIAL PRIMARY KEY,
	NOME VARCHAR(50),
	OBSERVACAO VARCHAR(50),
	PRECO DECIMAL(10,2),
	QUANTIDADE INT,
	STATUS VARCHAR(50) DEFAULT 'ATIVO',
	TIPO VARCHAR(50)
);

--CRIANDO UM CAMPO INDEX PARA O CAMPO NOME NA TEBELA PRODUTOS
CREATE INDEX IDX_PRODUTO_NOME ON
PRODUTOS(NOME);

--CRIANDO A TABELA PIZZAS
CREATE TABLE PIZZAS(
	ID_PIZZA SERIAL PRIMARY KEY,
	CATEGORIA VARCHAR(60),
	MASSA VARCHAR(50),
	SABOR VARCHAR(60),
	DIMENSOES VARCHAR (50),
	PESO DECIMAL(10,2),
	IGREDIENTES VARCHAR(255),
	DISPONIVEL BOOLEAN DEFAULT TRUE

);

--CRIANDO A TEBELA CLIENTES
CREATE TABLE CLIENTES(
	ID_CLIENTE SERIAL PRIMARY KEY,
	NOME VARCHAR(50),
	TELEFONE VARCHAR(11),
	ENDERECO VARCHAR(60),
	EMAIL VARCHAR(60),
	TIPO VARCHAR(50)
);

--CRIANDO INDEX PARA TABELA CLIENTES NO CAMPO NOME
CREATE INDEX IDX_CLIENTE_NOME ON
CLIENTES(NOME);

--CRIANDO A TABELA FUNCIONARIOS
CREATE TABLE FUNCIONARIOS(
	ID_FUNCIONARIO SERIAL PRIMARY KEY,
	NOME VARCHAR(50),
	RG VARCHAR(11),
	CPF VARCHAR(11),
	RE VARCHAR(11),
	SITUACAO BOOLEAN DEFAULT TRUE,
	SETOR VARCHAR(60),
	CARGO VARCHAR(60),
	SALARIO DECIMAL(10,2),
	DATA_CONTRATACAO DATE
);

--CRIANDO A TABELA PEDIDOS
CREATE TABLE PEDIDOS(
	ID_PEDIDO SERIAL PRIMARY KEY,
	COMPROVANTE SERIAL,
	VENDEDOR VARCHAR(50),
	METODO_PAGAMENTO VARCHAR(60),
	STATUS_PEDIDO VARCHAR(50),
	ID_CLIENTE SERIAL,
	ID_FUNCIONARIO SERIAL,
	FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTES,
	FOREIGN KEY (ID_FUNCIONARIO) REFERENCES FUNCIONARIOS
);

--CRIANDO CAMPO INDEX PARA O CAMPO ID_PEDIDO NA TABELA PEDIDOS
CREATE INDEX IDX_PEDIDOS_CLIENTE ON
PEDIDOS(ID_PEDIDO);




--CRIANDO A TABELA ENTREGAS
CREATE TABLE ENTREGAS(
	ID_ENTREGA SERIAL PRIMARY KEY,
	LOCAL_ENTREGA VARCHAR(60),
	STATUS_ENTREGA VARCHAR(60),
	ENTREGADOR VARCHAR(60),
	VEICULO VARCHAR(60),
	ID_PEDIDO SERIAL,
	FOREIGN KEY (ID_PEDIDO) REFERENCES PEDIDOS
);

--ALTERANDO AS TABELAS QUE TEM FK SEM REFERENCIA COMPLETA
ALTER TABLE PEDIDOS DROP CONSTRAINT CLIENTES;
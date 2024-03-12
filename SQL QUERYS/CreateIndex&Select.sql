--Criando tabela--
CREATE TABLE TBL_CLIENTES
(
	cod_cli int,
	nome varchar(50)
);
--Criando índice--
CREATE INDEX idx_cli_cod ON
TBL_CLIENTES(cod_cli);
--Verificando a tabela--
SELECT * FROM tbl_clientes;

--DROPANDO o índice(index)--
DROP INDEX idx_cli_cod
TBL_CLIENTES(cod_cli);

--CRIANDO TABELA FORNECEDORES--
CREATE TABLE TBL_FORNECEDORES
(
	cod_forn int PRIMARY KEY,
	nome varchar(50),
	cidade varchar(60)
)
--CRIANDO O ÍNDICE NA TABELA FORNECEDORES NO CAMPO (cod_forn)--
CREATE INDEX idx_forn_cod ON
TBL_FORNECEDORES(cod_forn);

--DELETANDO AS TABELAS--
DROP TABLE tbl_clientes, tbl_fornecedores;




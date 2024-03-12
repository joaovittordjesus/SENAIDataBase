--Ex 01 Criação e alteração de tabelas DDL--
CREATE TABLE FORNECEDOR(
	fcodigo SERIAL PRIMARY KEY NOT NULL,
	fnome varchar(50),
	status varchar(50) DEFAULT 'Ativo',
	cidade varchar(60)
);

CREATE INDEX idx_fcodigo ON
FORNECEDOR(fcodigo);

--TESTANDO A TABELA
SELECT * FROM FORNECEDOR;

--INSERINDO VALORES NA TABELA FORNECEDOR
INSERT INTO fornecedor (fcodigo,fnome,cidade,status)
VALUES (DEFAULT, 'Bruno', 'Limeira','');

--CRIANDO TABELA PEÇAS--
CREATE TABLE PECA(
	pcodigo SERIAL PRIMARY KEY NOT NULL,
	pnome varchar(50) NOT NULL,
	cor varchar(50) NOT NULL,
	peso decimal(7,2),
	cidade varchar(50) DEFAULT 'Limeira'
);

--CRIANDO INDICE DA TABELA PECA
CREATE INDEX idx_pcodigo ON
PECA(pcodigo);

--CRIANDO TABELA INTITUICAO
CREATE TABLE INSTITUICAO(
	icodigo SERIAL PRIMARY KEY,
	nome varchar(50)
);

--CRIANDO ÌNDICE DA TABELA INSTITUICAO
CREATE INDEX idx_icodigo ON
INSTITUICAO(icodigo);

--CRIANDO TABELA PROJETO
CREATE TABLE PROJETO(
	prcod SERIAL PRIMARY KEY,
	prnome varchar(50),
	cidade varchar(60),
	icod int,
	FOREIGN KEY (icod) REFERENCES INSTITUICAO(icodigo)
);

--CRIANDO ÍNDICE DA TABELA PROJETO
CREATE INDEX idx_prcod ON
PROJETO(prcod);

--CRIANDO TABELA FORNECIMENTO
CREATE TABLE FORNECIMENTO(
	fcod int,
	pcod int,
	prcod int,
	quantidade int,
	FOREIGN KEY (fcod) REFERENCES FORNECEDOR(fcodigo),
	FOREIGN KEY (pcod) REFERENCES PECA(pcodigo),
	FOREIGN KEY (prcod) REFERENCES PROJETO(prcod)
);



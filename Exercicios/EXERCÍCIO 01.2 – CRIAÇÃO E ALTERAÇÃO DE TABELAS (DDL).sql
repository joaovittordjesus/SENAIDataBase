--ALTERAÇÃO NO ESQUEMA DAS TABELAS--
--ADICIONANDO O CAMPO FONE--
ALTER TABLE fornecedor
ADD fone VARCHAR(11);

--REMOVENDO O CAMPO CIDADE--
ALTER TABLE fornecedor
DROP COLUMN cidade;

--ADICIONANDO O CAMPO FK CCOD--
ALTER TABLE fornecedor
ADD ccod INT;

--CRIANDO A TABELA CIDADE PARA A RELACAO CIDADE COM FK CCOD
CREATE TABLE CIDADE(
	ccod SERIAL PRIMARY KEY,
	cnome VARCHAR(50),
	uf VARCHAR(2)
);

--CRIANDO A FK CCOD EM FORNECEDOR
ALTER TABLE fornecedor
ADD CONSTRAINT ccod FOREIGN KEY (ccod) REFERENCES cidade(ccod);

--DEELTANDO A COLUNA CIDADE DA TABELA PECA
ALTER TABLE peca
DROP COLUMN cidade

--CRIANDO A FK CCOD NA TABELA PECA
ALTER TABLE peca
ADD ccod int;

ALTER TABLE peca
ADD CONSTRAINT ccod FOREIGN KEY (ccod) REFERENCES cidade(ccod);

--DELETANDO CAMPO FK ICOD DA TABELA PROJETO
ALTER TABLE projeto
DROP COLUMN icod;

--ADICIONANDO O CAMPO FK CCOD NA TABELA PROJETO
ALTER TABLE projeto
ADD ccod int;

ALTER TABLE projeto
ADD CONSTRAINT ccod FOREIGN KEY (ccod) REFERENCES cidade(ccod);

--DELETANDO A TABELA INSTITUICAO
DROP TABLE instituicao;




--7
-- SELECT * FROM CADFUN
-- WHERE SALARIO = SALARIO + 250

--8
SELECT * FROM CADFUN
WHERE FUNCAO = 'Analista';

--9
SELECT * FROM CADFUN
WHERE SALARIO > 1700;

SELECT * FROM VENDEDOR
WHERE SALARIO > 1700;

--10
SELECT * FROM CADFUN
WHERE SALARIO < 1700;

SELECT * FROM VENDEDOR
WHERE SALARIO < 1700;

--11
SELECT * FROM CADFUN
WHERE SALARIO = 1700;

SELECT * FROM VENDEDOR
WHERE SALARIO = 1700;

--12
SELECT * FROM CADFUN
WHERE FUNCAO = 'Desenvolvedor' OR FUNCAO = 'Analista';

--13
SELECT * FROM CADFUN
WHERE (FUNCAO = 'Desenvolvedor' OR FUNCAO = 'Analista') AND (SALARIO > 1200);

--14
SELECT * FROM CADFUN
WHERE FUNCAO != 'Desenvolvedor' AND FUNCAO != 'Analista';

--RESOLVENDO O PROBLEMA NA CRIAÇÃO DFA TABELA(CHATGPT)
UPDATE CADFUN
SET FILHOS = 0
WHERE FILHOS IS NULL;


--CRIANDO A COLUNA FILHOS FILHOS NA TABELA CADFUN
ALTER TABLE CADFUN
ADD COLUMN FILHOS INT NOT NULL;


--DELETANDO A COLUNA FILHOS DA TABELA CADFUN
ALTER TABLE CADFUN
DROP COLUMN FILHOS;

--RETORNANDO TUDO DA TABELA CADFUN
SELECT * FROM CADFUN;

--INSERINDO QUANTIDADES DE FILHOS ALEATÓRIAS NA COLUNA FILHOS()
-- Define uma média e desvio padrão para a distribuição normal
SELECT setseed(0.5); -- Define uma semente para a função random()

-- Insere uma quantidade aleatória de filhos para cada funcionário
UPDATE CADFUN
SET FILHOS = ROUND(random() * 3) -- Altere 3 para o valor desejado do desvio padrão
WHERE FILHOS IS NULL; -- Atualiza apenas os funcionários que ainda não têm um valor de filhos definido


-- 15
SELECT * FROM CADFUN
WHERE FILHOS BETWEEN 2 AND 4;

--16
SELECT * FROM CADFUN
WHERE (FILHOS BETWEEN 2 AND 4) AND (SALARIO < 1600);

--17
SELECT * FROM CADFUN
WHERE (FILHOS < 2) OR (FILHOS > 3)
--ou
SELECT * FROM CADFUN
WHERE FILHOS NOT BETWEEN 2 AND 3;

--18
SELECT * FROM CADFUN
WHERE ((FILHOS < 2) OR (FILHOS > 3)) AND (FILHOS != 0);
--OU
SELECT * FROM CADFUN
WHERE (FILHOS NOT BETWEEN 2 AND 3) AND (FILHOS != 0);

--19
SELECT * FROM CADFUN
WHERE FILHOS IN(2, 3);

--Módulo 02 - Aula 09

--CHAVES PRIMÁRIAS

ALTER TABLE dbo.ORDEM_SERVICO
  ADD CONSTRAINT pk_OrdemServico PRIMARY KEY(id_os);

ALTER TABLE dbo.LOCALIDADES
  ADD CONSTRAINT pk_Localidades PRIMARY KEY(id_cidade);

ALTER TABLE dbo.MECANICOS
  ADD CONSTRAINT pk_Mecanicos PRIMARY KEY(id_mecanico);
  
--Módulo 02 - aula 10

--CHAVES ESTRANGEIRAS  /  FOREIGN KEYS

ALTER TABLE dbo.FORMAS_PAGAMENTO
  ADD CONSTRAINT fk_OrdemServicoPag FOREIGN KEY(id_os)
      REFERENCES dbo.Ordem_servico(id_os);

ALTER TABLE dbo.ORDEM_SERVICO
  ADD CONSTRAINT fk_Mecanicos FOREIGN KEY(id_mecanico)
      REFERENCES dbo.Mecanicos(id_mecanico);

ALTER TABLE dbo.ORDEM_SERVICO
  ADD CONSTRAINT fk_Localidade FOREIGN KEY(id_cidade)
      REFERENCES dbo.Localidades(id_cidade);

ALTER TABLE dbo.ORDEM_SERVICO
  DROP CONSTRAINT fk_Localidade;

--consultas para teste dos dados

--Ordens de Serviço - Geral
---------------------------

--Módulo 3 | 01
select * from FORMAS_PAGAMENTO;
SELECT * FROM LOCALIDADES;

SELECT * 
  FROM MECANICOS;

SELECT *
  FROM dbo.ORDEM_SERVICO;

--Módulo 3 | 02
select * from dbo.LOCALIDADES;

--Módulo 3 | 03
select * 
  from dbo.ORDEM_SERVICO;
  
select os.ID_OS as NR_OS, os.CLIENTE, os.SERVICO
  from dbo.ORDEM_SERVICO os;

--Módulo 3 | 04
SELECT *
  FROM dbo.ORDEM_SERVICO;

SELECT *
  FROM dbo.ORDEM_SERVICO
 WHERE servico = 'FREIOS';

SELECT *
  FROM dbo.ORDEM_SERVICO
 WHERE servico = 'FREIOS' --AND //OR
    OR servico = 'ALINHAMENTO';

SELECT *
  FROM dbo.ORDEM_SERVICO OS
 WHERE os.SERVICO = 'FREIOS'
   AND os.DATA_ENTRADA >= '01/01/2020';

SELECT os.id_os,
       os.cliente,
	   FORMAT(os.data_entrada, 'dd/MM/yyyy') as entrada,
	   FORMAT(os.data_saida, 'dd/MM/yyyy') as saida
  FROM dbo.ORDEM_SERVICO os
 WHERE os.SERVICO = 'FREIOS'
   AND os.DATA_ENTRADA >= '01/01/2020';

--Módulo 3 | 05

select *
  from dbo.ORDEM_SERVICO
 where servico LIKE '%FREIO%';

select *
  from dbo.ORDEM_SERVICO
 where servico in ('FREIOS', 'ALINHAMENTO', 'CAMBAGEM');

 select *
  from dbo.ORDEM_SERVICO
 where servico NOT IN ('FREIOS', 'ALINHAMENTO', 'CAMBAGEM');

--Módulo 3 | 06

select *
  from dbo.ORDEM_SERVICO
 where servico in ('FREIOS', 'ALINHAMENTO')
 order by servico, data_entrada
 ;
 
select *
  from dbo.ORDEM_SERVICO
 where servico in ('FREIOS', 'ALINHAMENTO')
 order by servico desc, data_entrada
 ;

select *
  from dbo.ORDEM_SERVICO
 where servico in ('FREIOS', 'ALINHAMENTO')
 --order by servico desc, data_entrada
 order by 6, 4
 ;
 
--Módulo 4 | 01

select 1 + 7 as SOMATORIA;
select 1 + 7 SOMATORIA;

select 1000 / 23 DIVISAO;

select 17 * 78 MULTIPLICACAO;

select (1000 / 23) - 99 SUBTRACAO;

select SQRT(20) RAIZ_QUADRADA;
select SQRT(20) "RAIZ QUADRADA";

select POWER(2, 3) POTENCIACAO; -- 2 X 2 X 2

select 1000 + (1000 * 0.1) porcentagem;
select 1000 * 1.1;

select * from dbo.FORMAS_PAGAMENTO;
select valor_os - 1000 resultado from dbo.FORMAS_PAGAMENTO;

--Módulo 4 | 02

--SOMA (SUM)
select sum(f.VALOR_OS) as Total
  from dbo.FORMAS_PAGAMENTO f;

select f.FORMA_PAGAMENTO, sum(f.valor_os) as total
  from dbo.FORMAS_PAGAMENTO f
 group by f.FORMA_PAGAMENTO
 order by f.FORMA_PAGAMENTO
 ;

 select f.FORMA_PAGAMENTO, sum(f.valor_os) as total
  from dbo.FORMAS_PAGAMENTO f
 group by f.FORMA_PAGAMENTO
 order by 2 desc
 ;

--Módulo 4 | 03

--MÉDIA (AVG)
select forma_pagamento, avg(valor_os) Média
  from dbo.FORMAS_PAGAMENTO
 group by forma_pagamento;

 select forma_pagamento, avg(valor_os) Média
  from dbo.FORMAS_PAGAMENTO
 group by forma_pagamento
 order by forma_pagamento;

  select forma_pagamento, avg(valor_os) Média
  from dbo.FORMAS_PAGAMENTO
 group by forma_pagamento
 order by 2 desc;
 
 --Módulo 4 | 04

--max, min e count

SELECT MAX(VALOR_OS) AS MÁXIMO
  FROM DBO.FORMAS_PAGAMENTO;

  SELECT FORMA_PAGAMENTO, MAX(VALOR_OS) AS MÁXIMO
  FROM DBO.FORMAS_PAGAMENTO
  GROUP BY FORMA_PAGAMENTO;

  SELECT FORMA_PAGAMENTO, MAX(TAXA) AS MÁXIMO
  FROM DBO.FORMAS_PAGAMENTO
  GROUP BY FORMA_PAGAMENTO;

  --MIN
  SELECT MIN(VALOR_OS) AS MÍNIMO
  FROM DBO.FORMAS_PAGAMENTO;

    SELECT FORMA_PAGAMENTO, MIN(VALOR_OS) AS MÍNIMO
  FROM DBO.FORMAS_PAGAMENTO
  GROUP BY FORMA_PAGAMENTO;

  --COUNT
  SELECT COUNT(*) TOTAL FROM DBO.FORMAS_PAGAMENTO;

  SELECT FORMA_PAGAMENTO, COUNT(1) TOTAL
    FROM DBO.FORMAS_PAGAMENTO
   GROUP BY FORMA_PAGAMENTO;

  SELECT FORMA_PAGAMENTO, COUNT(FORMA_PAGAMENTO) TOTAL
    FROM DBO.FORMAS_PAGAMENTO
   GROUP BY FORMA_PAGAMENTO;

--Módulo 5 | 01

--https://docs.microsoft.com/pt-br/sql/t-sql/functions/functions?view=sql-server-ver15
--Site de Referência da Microsoft sobre funções no SQL Server

--FORMAT

SELECT FORMAT(GETDATE(), 'd', 'pt-BR') Brasil;
SELECT FORMAT(GETDATE(), 'd', 'en-US') US_English;

SELECT FORMAT(GETDATE(), 'dd/MM/yyyy') data;

SELECT FORMAT(GETDATE(), 'dd') dia;
SELECT FORMAT(GETDATE(), 'ddd') "dia da semana abreviado";
SELECT FORMAT(GETDATE(), 'dddd') "dia da semana extenso";

SELECT FORMAT(GETDATE(), 'MM') mês;
SELECT FORMAT(GETDATE(), 'MMM') "mês abreviado";
SELECT FORMAT(GETDATE(), 'MMMM') "mês por extenso";

--Módulo 5 | 02

--upper
select upper('teste de conversão') as texto;

--lower
select lower('TESTE DE CONVERSÃO') as texto;

--trim
select trim('      teste de conversão      ') as texto;
select trim('      teste    de conversão      ') as texto;

--ltrim
select ltrim('      teste de conversão      ') as texto;

--rtrim
select rtrim('      teste de conversão      ') as texto;

--replace
select replace(
               replace('teste     de     conversão', '  ', ' '),
			   '  ', 
			   ' ') as texto;

select lower(servico) from ordem_servico;

--Módulo 6 | 01

--insert

SELECT * FROM DBO.MECANICOS;

INSERT INTO dbo.mecanicos
(ID_MECANICO, NOME_MECANICO)
VALUES
(6, 'ALESSANDRO TROVATO');

--Módulo 6 | 02

--DELETE

select * from dbo.MECANICOS;

DELETE FROM dbo.MECANICOS
 where id_mecanico = 6;

DELETE FROM dbo.MECANICOS
  where nome_mecanico like '%SAMPAIO%';

--Módulo 6 | 03

--update

select * from dbo.ORDEM_SERVICO
   where id_mecanico = 2;  --2 --> 1

select * from dbo.MECANICOS;

UPDATE dbo.ORDEM_SERVICO
   SET ID_MECANICO = 1
 WHERE ID_MECANICO = 2;

--Módulo 6 | 04

--JOIN / JOINS

select * from dbo.ORDEM_SERVICO;

--INNER JOIN

select os.ID_OS, os.CLIENTE, lo.NM_MUNICIPIO, lo.NM_UF 
         from dbo.ORDEM_SERVICO os
         inner join dbo.LOCALIDADES lo on (os.ID_CIDADE = lo.ID_CIDADE)

--LEFT JOIN
--RIGHT JOIN

select os.ID_OS, os.CLIENTE, lo.NM_MUNICIPIO, lo.NM_UF 
         from dbo.ORDEM_SERVICO os
         right join dbo.LOCALIDADES lo on (os.ID_CIDADE = lo.ID_CIDADE) 
  WHERE OS.ID_OS IS NULL;


-- Módulo 7 | 03

select os.id_os,
       os.cliente,
	   lo.NM_MUNICIPIO,
	   me.NOME_MECANICO,
	   os.servico,
	   fp.VALOR_OS
  from dbo.ORDEM_SERVICO os
       inner join dbo.LOCALIDADES lo on (lo.ID_CIDADE = os.ID_CIDADE)
	   inner join dbo.MECANICOS me on (me.ID_MECANICO = os.ID_MECANICO)
	   inner join dbo.FORMAS_PAGAMENTO fp on (fp.ID_OS = os.ID_OS)
 where lo.UF = 'SP' 
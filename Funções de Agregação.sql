--SOMA (SUM)

select sum(f.VALOR_OS) "Total Faturado"
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

-- M�DIA 
select FORMA_PAGAMENTO, avg(valor_os) as M�dia
   from dbo.FORMAS_PAGAMENTO
 group by FORMA_PAGAMENTO
 order by 2 asc
 ;

-- M�NIMO E M�XIMO
select FORMA_PAGAMENTO, max(TAXA) as M�ximo
   from dbo.FORMAS_PAGAMENTO
 group by FORMA_PAGAMENTO
 order by 2 asc
 ;

select FORMA_PAGAMENTO, min(VALOR_OS) as M�nimo
   from dbo.FORMAS_PAGAMENTO
 group by FORMA_PAGAMENTO
 order by 2 asc
 ;

-- count

select COUNT(*) as TOTAL
  from dbo.FORMAS_PAGAMENTO;

SELECT FORMA_PAGAMENTO, COUNT(1) AS "QUANTIDADE DE REGISTROS"
  FROM DBO.FORMAS_PAGAMENTO
 GROUP BY FORMA_PAGAMENTO;
select *
	from dbo.ORDEM_SERVICO;

select *
	from dbo.ORDEM_SERVICO
 where SERVICO = 'FREIOS';

select *
	from dbo.ORDEM_SERVICO
	where SERVICO = 'FREIOS'
		or servico = 'ALINHAMENTO';

select *
	from dbo.ORDEM_SERVICO OS
 where os.SERVICO = 'freios'
		and os.DATA_ENTRADA >= '01/01/2020';

select 
	os.ID_OS, 
	os.CLIENTE, 
	FORMAT(os.DATA_ENTRADA, 'dd/MM/yyyy') as Entrada,
	FORMAT(os.data_saida, 'dd/MM/yyyy') as Saida
	from dbo.ORDEM_SERVICO OS
 where os.SERVICO = 'freios'
		and os.DATA_ENTRADA >= '01/01/2020';

-- LIKE, IN E NOT IN

select *
  from dbo.ORDEM_SERVICO
 where SERVICO like '%freio%';

select *
  from dbo.ORDEM_SERVICO
 where SERVICO in ('freios', 'alinhamento', 'cambagem');

select *
  from dbo.ORDEM_SERVICO
 where SERVICO not in ('freios', 'alinhamento', 'cambagem');


-- CLASSIFICAÇÃO DOS DADOS

select *
  from dbo.ORDEM_SERVICO
 where SERVICO in ('freios', 'alinhamento')
 --order by SERVICO desc, DATA_ENTRADA
 order by 6, 5


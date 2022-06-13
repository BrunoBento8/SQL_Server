-- insert

select * from dbo.MECANICOS;

insert into dbo.MECANICOS
(ID_MECANICO, NOME_MECANICO)
values
(6, 'ANTONIO GARCIA');

--delete

select * from dbo.MECANICOS

delete from dbo.MECANICOS
where ID_MECANICO = 6;

--update

select * from dbo.ORDEM_SERVICO
	where ID_MECANICO = 2; -- 2 -> 1

select * from dbo.MECANICOS;

update dbo.ORDEM_SERVICO
	set ID_MECANICO = 1
 where ID_MECANICO = 2;

-- joins

select * from dbo.ORDEM_SERVICO

-- inner/right/left join

select os.ID_OS, os.CLIENTE, lo.NM_MUNICIPIO, lo.NM_UF
  from dbo.ORDEM_SERVICO OS
  inner join dbo.LOCALIDADES LO on (os.ID_CIDADE = lo.ID_CIDADE)

select os.ID_OS, os.CLIENTE, lo.NM_MUNICIPIO, lo.NM_UF
  from dbo.ORDEM_SERVICO OS
  right join dbo.LOCALIDADES LO on (os.ID_CIDADE = lo.ID_CIDADE)
  where os.ID_OS is null;

select os.ID_OS, os.CLIENTE, lo.NM_MUNICIPIO, lo.NM_UF
  from dbo.ORDEM_SERVICO OS
  left join dbo.LOCALIDADES LO on (os.ID_CIDADE = lo.ID_CIDADE)

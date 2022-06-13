select 
	os.ID_OS,
	os.CLIENTE,
	lo.NM_MUNICIPIO,
	me.ID_MECANICO,
	os.SERVICO,
	fp.VALOR_OS
	from dbo.ORDEM_SERVICO OS
		inner join dbo.LOCALIDADES lo on (lo.ID_CIDADE = os.ID_CIDADE)
		inner join dbo.MECANICOS me on (me.ID_MECANICO = os.ID_MECANICO)
		inner join dbo.FORMAS_PAGAMENTO fp on (fp.ID_OS = os.ID_OS)
 
 where lo.UF = 'SP'
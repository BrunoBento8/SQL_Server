-- format

select FORMAT(getdate(), 'd', 'pt-BR') Brasil;

select FORMAT(getdate(), 'dd') Dia;
select FORMAT(getdate(), 'ddd') "Dia da semana abreviado";
select FORMAT(getdate(), 'dddd') "Dia da semana extenso";

select FORMAT(getdate(), 'MM') Mês;
select FORMAT(getdate(), 'MMM') "Mês abreviado";
select FORMAT(getdate(), 'MMMM') "Mês por extenso";

select FORMAT(getdate(), 'hh:mm:ss') hora;

-- upper and lower

select UPPER('Teste de Conversão') as texto;
select LOWER('Teste de Conversão') as texto;

-- trim, ltrim e rtrim

select TRIM('      teste de conversão          ') as texto;
select lTRIM('      teste de conversão          ') as texto;
select rTRIM('      teste de conversão          ') as texto;

-- replace

select replace(
	     replace('teste     de        conversão', '  ', ' '), '  ', ' ')
		 as texto;
	--teste
select replace(
				replace('052.936.094-24','.',''),'-','')
				as "CPF sem caracter";
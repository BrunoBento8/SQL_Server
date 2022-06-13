-- format

select FORMAT(getdate(), 'd', 'pt-BR') Brasil;

select FORMAT(getdate(), 'dd') Dia;
select FORMAT(getdate(), 'ddd') "Dia da semana abreviado";
select FORMAT(getdate(), 'dddd') "Dia da semana extenso";

select FORMAT(getdate(), 'MM') M�s;
select FORMAT(getdate(), 'MMM') "M�s abreviado";
select FORMAT(getdate(), 'MMMM') "M�s por extenso";

select FORMAT(getdate(), 'hh:mm:ss') hora;

-- upper and lower

select UPPER('Teste de Convers�o') as texto;
select LOWER('Teste de Convers�o') as texto;

-- trim, ltrim e rtrim

select TRIM('      teste de convers�o          ') as texto;
select lTRIM('      teste de convers�o          ') as texto;
select rTRIM('      teste de convers�o          ') as texto;

-- replace

select replace(
	     replace('teste     de        convers�o', '  ', ' '), '  ', ' ')
		 as texto;
	--teste
select replace(
				replace('052.936.094-24','.',''),'-','')
				as "CPF sem caracter";
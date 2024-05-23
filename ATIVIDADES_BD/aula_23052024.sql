CREATE TABLE loja.marca(

      codigo SERIAL PRIMARY KEY,

      nome varchar (250) not null

);



INSERT INTO loja.marca (nome) VALUES ('Nestlé');

INSERT INTO loja.marca (nome) VALUES ('Kopenhagen');

INSERT INTO loja.marca (nome) VALUES ('Cacau Show');

INSERT INTO loja.marca (nome) VALUES ('Lindt');

 



SELECT * FROM loja.marca;





CREATE TABLE loja.chocolates(

      codigo SERIAL PRIMARY KEY,

      nome varchar (250) not null,

      valor NUMERIC (10,2),

      codigo_marca INTEGER,

      FOREIGN KEY (codigo_marca) REFERENCES loja.marca (codigo)



);



INSERT INTO loja.chocolates (nome, valor,codigo_marca) VALUES ('kitkat', 4.50, 1);

INSERT INTO loja.chocolates (nome, valor,codigo_marca) VALUES ('suflair', 6.00, 1);

INSERT INTO loja.chocolates (nome, valor,codigo_marca) VALUES ('chokito', 4.50, 1);

INSERT INTO loja.chocolates (nome, valor,codigo_marca) VALUES ('lingua de gato', 8.90, 2);

INSERT INTO loja.chocolates (nome, valor,codigo_marca) VALUES ('nhá benta', 7.00, 2);

INSERT INTO loja.chocolates (nome, valor,codigo_marca) VALUES ('bombom maracujá', 2.50, 3);

INSERT INTO loja.chocolates (nome, valor,codigo_marca) VALUES ('bombom cereja', 3.50, 3);

INSERT INTO loja.chocolates (nome) VALUES ('bombom chocolate branco');

INSERT INTO loja.chocolates (nome, valor) VALUES ('bombom pistache', 6.00);

INSERT INTO loja.chocolates (nome) VALUES ('natal');



SELECT * FROM loja.chocolates;



Utilizando o comando SELECT para acessar os dados inseridos no banco de dados (escreva as seguintes consultas em SQL:)

 

--1.Qual o chocolates mais caro e a marca correspondente?
select nome, valor, 
(select nome from loja.marca where codigo=c.codigo_marca)
from loja.chocolates c
where valor=(select max(valor) from loja.chocolates);

--2.Liste o nome dos chocolates, em ordem alfabética, cujo valores são menores ou iguais a 5 reais.
select nome, valor 
from loja.chocolates
where valor >(select AVG(valor) from loja.chocolates);

--3.Qual marca possui o maior número de chocolates?
select nome 
from loja.marca
where codigo=(
	select codigo_marca
	from loja.chocolates
	group by codigo_marca
	order by count (*) desc
	limit 1
);

--4.Quais chocolates pertencem a marca "Kopenhagen"?
select nome, valor
from loja.chocolates
where codigo_marca=(
	select codigo from loja.marca 
	where nome = 'Kopenhagen'
);

--5.Qual o valor total dos chocolates da marca "Nestlé"?
select sum(valor)
from loja.chocolates
where codigo_marca=(
	select codigo from loja.marca 
	where nome = 'Nestlé'
);

--6.Qual é a média de valor dos chocolates por marca?
select m.nome, avg(c.valor)
from loja.chocolates c
join loja.marca m
on c.codigo_marca=m.codigo
group by m.nome;

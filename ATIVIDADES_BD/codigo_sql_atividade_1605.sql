create table papelaria.compradores(
	id integer primary key,
	nomec varchar(150),
	cidade varchar(60),
	desconto integer
);
create table papelaria.produtos(
	id integer primary key,
	nomep varchar(100),
	idc integer,
	quantidade integer,
	preco numeric(4,2)
);

insert into papelaria.compradores(id,nomec,cidade,desconto) 
values(10, 'Fornecedor Jô', 'RJ', 10);
insert into papelaria.compradores(id,nomec,cidade,desconto) 
values(11, 'Fornecedor Dri', 'Curitiba', 7);
insert into papelaria.compradores(id,nomec,cidade,desconto) 
values(21, 'Fornecedor Lua', 'RJ', 10);
insert into papelaria.compradores(id,nomec,cidade,desconto) 
values(24, 'Fornecedor Dira', 'SP', 10);
insert into papelaria.compradores(id,nomec,cidade,desconto) 
values(34, 'Fornecedor D&D', 'Maceio', 5);
insert into papelaria.compradores(id,nomec,cidade,desconto) 
values(67, 'Fornecedor P&P', 'Recife', 5);
insert into papelaria.compradores(id,nomec,cidade,desconto) 
values(110, 'Fornecedor Ju', 'Uberlândia', 7);

insert into papelaria.produtos(id,nomep,idc,quantidade,preco) 
values(1, 'papelA4', '21', 11000,23.50);
insert into papelaria.produtos(id,nomep,idc,quantidade,preco) 
values(2, 'papelcolorido', '11', 11000,14.80);
insert into papelaria.produtos(id,nomep,idc,quantidade,preco) 
values(3, 'lapis_de_cor', '21', 1050,18);
insert into papelaria.produtos(id,nomep,idc,quantidade,preco) 
values(4, 'lapis_de_cor', '10', 1050,18);
insert into papelaria.produtos(id,nomep,idc,quantidade,preco) 
values(5, 'massinha', '10', 8000,6.75);
insert into papelaria.produtos(id,nomep,idc,quantidade,preco) 
values(6, 'massinha', '21', 8000,6.75);
insert into papelaria.produtos(id,nomep,idc,quantidade,preco) 
values(7, 'massinha', '67', 8000,8);
insert into papelaria.produtos(id,nomep,idc,quantidade,preco) 
values(8, 'canetinha', '10', 12000,32);
insert into papelaria.produtos(id,nomep,idc,quantidade,preco) 
values(9, 'caneta', '11', 4000,18);


select * from papelaria.compradores

select distinct cidade from papelaria.compradores 

--junta os fornecedores com os produtos
select c.nomec, p.nomep from papelaria.compradores as c join papelaria.produtos as p on c.id = p.idc;

--mostra o maior numero de desconto (PostgreeSQL 15)
SELECT nomec, desconto FROM papelaria.compradores WHERE desconto = (SELECT MAX(desconto) FROM papelaria.compradores);

-- mostra o preço minimo de um produto
SELECT nomep, preco FROM papelaria.produtos WHERE preco = (SELECT MIN(preco) FROM papelaria.produtos);

-- Lista o nome dos produtos que começam com a letra P
SELECT nomep FROM papelaria.produtos WHERE nomep LIKE 'p%';

--Usando postgree 15
--Qual é a quantidade total de cada produto que foi comprada por fornecedores que oferecem um desconto maior que 5?

SELECT p.nomep, SUM(p.quantidade) as total_quantidade
FROM papelaria.produtos AS p JOIN papelaria.compradores AS c ON p.idc = c.id WHERE c.desconto > 5 GROUP BY p.nomep HAVING SUM(p.quantidade) > 0;
--GROUP BY é usada para agrupar as linhas que têm os mesmos valores na coluna
--HAVING é usada para filtrar os grupos de acordo com uma condição especificada

--Quais são os fornecedores e a quantidade total de produtos que eles forneceram?
SELECT c.nomec AS Fornecedor, SUM(p.quantidade) AS Quantidade_Total FROM papelaria.compradores AS c JOIN papelaria.produtos AS p ON c.id = p.idc GROUP BY c.nomec;
--A função SUM é usada para calcular a quantidade total de produtos fornecidos por cada fornecedor.

-- Usando o esquema de banco de dados acima faça uma consulta SQL que retorne o nome do comprador que comprou a maior quantidade de produtos.
SELECT nomec
FROM papelaria.compradores
WHERE id IN (
    SELECT idc
    FROM papelaria.produtos
    WHERE quantidade = (
        SELECT MAX(quantidade)
        FROM papelaria.produtos
    )
);

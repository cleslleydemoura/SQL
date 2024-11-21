create schema escola;
create database clientes;

create table clientes.dados (
	id integer primary key,
    user_name varchar(10),
    nome varchar(50),
    dt_nasc datetime
);

create table clientes.complementos (
	endereco varchar(100),
    cpf varchar(11)
);

select
	d.id, d.user_name, d.nome, d.dt_nasc, c.endereco, c.cpf, c.id
from
	clientes.dados d
left join
	clientes.complementos c ON d.id = c.id;

-- adição de tabela a table.
alter table clientes. dados add senha integer(10);

-- inserção de dados dentro da table.
insert into clientes.dados (id, user_name, nome, dt_nasc) values (1, 'cleslley', 'CLESLLEY DE MOURA', 20030614);
insert into clientes.dados (id, user_name, nome, dt_nasc) values (2, 'maria', 'MARIA CLARA', 20030615);

insert into clientes.complementos (endereco, cpf, id) values ('Ceilândia', '01194510290', 1);
insert into clientes.complementos (endereco, cpf, id) values ('Ceilândia', '09934305572', 2);

-- mostra os dados dentro da table.
select * from clientes.dados;
select * from clientes.complementos;

SELECT -- 'd' e 'c' são apelidos para as tabelas
    d.id, d.user_name, d.nome, d.dt_nasc, d.senha, c.endereco, c.cpf
FROM -- chamando a tabela 'd'
    clientes.dados d
LEFT JOIN -- faz a combinação entre as duas tabelas
    clientes.complementos c ON d.id = c.id; -- coloca os dados em seus lugares relacionando a pk com a fk


-- atualiza algum dadod dentro da table.
ALTER TABLE clientes.complementos ADD id INTEGER PRIMARY KEY;
ALTER TABLE clientes.complementos ADD CONSTRAINT id FOREIGN KEY (id) REFERENCES clientes.dados(id);

update clientes.dados set user_name = 'printf' where id = 1;
update clientes.dados set user_name = 'lovelysz' where id = 2;
update clientes.dados set senha = 17062017 where id = 1;
update clientes.dados set senha = 23062017 where id = 2;

-- exclui a tabela descrita após o drop table ''.
drop table clientes.dados;
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

create table clientes.novacredencial (
	credencial integer primary key,
	cliente_id integer,
    foreign key (cliente_id) references clientes.dados(id)
);

    
-- adição de tabela a table.
alter table clientes.dados add senha integer(10);

-- inserção de dados dentro da table.
insert into clientes.dados (id, user_name, nome, dt_nasc) values (1, 'cleslley', 'CLESLLEY DE MOURA', 20030614);
insert into clientes.dados (id, user_name, nome, dt_nasc) values (2, 'maria', 'MARIA CLARA', 20030615);
insert into clientes.complementos (endereco, cpf, id) values ('Ceilândia', '01194510290', 1);
insert into clientes.complementos (endereco, cpf, id) values ('Ceilândia', '09934305572', 2);
insert into clientes.novacredencial (credencial, cliente_id) values (4444, 1);
insert into clientes.novacredencial (credencial, cliente_id) values (5555, 2);

-- mostra os dados dentro da table.
select * from clientes.dados;
select * from clientes.complementos;

SELECT
    d.id,
    d.user_name,
    d.nome,
    d.dt_nasc,
    d.senha,
    c.endereco,
    c.cpf,
    k.credencial
FROM
    clientes.dados d
LEFT JOIN
    clientes.complementos c ON d.id = c.id
LEFT JOIN
    clientes.novacredencial k ON d.id = k.cliente_id;
    
-- atualiza algum dado dentro da table.
ALTER TABLE clientes.complementos ADD id INTEGER PRIMARY KEY; -- inserindo a fk
ALTER TABLE clientes.complementos ADD CONSTRAINT id FOREIGN KEY (id) REFERENCES clientes.dados(id);
-- atualizando dados dos clientes
update clientes.dados set user_name = 'printf' where id = 1;
update clientes.dados set user_name = 'lovelysz' where id = 2;
update clientes.dados set senha = 17062017 where id = 1;
update clientes.dados set senha = 23062017 where id = 2;
-- exclui a tabela descrita após o drop table ''.

drop table clientes.dados;

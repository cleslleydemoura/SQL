CREATE TABLE cliente.cliente(
	cod_cliente integer primary key,
	cpf integer,
	nome character varying (100)
);

CREATE TABLE cliente.nf(
	num_nf integer primary key,
	dt_emissao date,
	cod_cliente integer,
	nome character varying (100),
	foreign key (cod_cliente) REFERENCES cliente.cliente (cod_cliente)
);
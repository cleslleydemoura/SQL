CREATE TABLE cursinho.disciplina(
	cod_discp integer primary key,
	nome character varying (100)
);

CREATE TABLE cursinho.curso(
	cod_curso integer primary key,
	nome character varying (100)
);

CREATE TABLE cursinho.curriculo(
	cod_discp integer,
	cod_curso integer,
	obrigatoriedade character varying (3),
	
	foreign key (cod_discp) REFERENCES cursinho.disciplina (cod_discp),
	foreign key (cod_curso) REFERENCES cursinho.curso (cod_curso)
);
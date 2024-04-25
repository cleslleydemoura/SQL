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

INSERT INTO cursinho.disciplina (cod_discp, nome) VALUES (1, 'Cálculo I');
INSERT INTO cursinho.disciplina (cod_discp, nome) VALUES (2, 'POO');
INSERT INTO cursinho.disciplina (cod_discp, nome) VALUES (3, 'BD');
INSERT INTO cursinho.disciplina (cod_discp, nome) VALUES (4, 'Cobol');

INSERT INTO cursinho.curso (cod_curso, nome) VALUES (10, 'ccp');
INSERT INTO cursinho.curso (cod_curso, nome) VALUES (20, 'ads');
INSERT INTO cursinho.curso (cod_curso, nome) VALUES (30, 'eds');
INSERT INTO cursinho.curso (cod_curso, nome) VALUES (40, 'eng');

INSERT INTO cursinho.curriculo (obrigatoriedade, codd, codc) VALUES ('sim', 1, 10);
INSERT INTO cursinho.curriculo (obrigatoriedade, codd, codc) VALUES ('sim', 2, 20);
INSERT INTO cursinho.curriculo (obrigatoriedade, codd, codc) VALUES ('sim', 3, 30);
INSERT INTO cursinho.curriculo (obrigatoriedade, codd, codc) VALUES ('não', 4, 40);

SELECT * FROM cursinho.disciplina
SELECT * FROM cursinho.curso
SELECT * FROM cursinho.curriculo

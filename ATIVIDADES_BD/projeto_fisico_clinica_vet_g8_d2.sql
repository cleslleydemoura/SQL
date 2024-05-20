CREATE TABLE clinica_vet.cliente(
    cpf_cliente varchar (14) PRIMARY KEY,
    nome_cliente varchar (250) not null,
	telefone_cliente integer not null,
	endereco varchar (250) not null
);

CREATE TABLE clinica_vet.animal(
	cod_animal integer PRIMARY KEY,
	raca_animal varchar (50) not null,
	sexo varchar (1) not null,
	nome_animal varchar (250) not null,
	idade integer not null
);

-- Fusão das tabelas CLIENTE e ANIMAL
CREATE TABLE clinica_vet.cliente_animal (
	codc varchar,
	coda integer,

	FOREIGN KEY (codc) REFERENCES clinica_vet.cliente (cpf_cliente),
	FOREIGN KEY (coda) REFERENCES clinica_vet.animal (cod_animal)
);

CREATE TABLE clinica_vet.med_veterinario (
	cod_medico integer PRIMARY KEY,
	crmv_medico varchar (50) not null,
	nome_medico varchar (250) not null,
	telefone_med integer not null,

	codc varchar,
	coda integer,

	FOREIGN KEY (codc) REFERENCES clinica_vet.cliente (cpf_cliente),
	FOREIGN KEY (coda) REFERENCES clinica_vet.animal (cod_animal)
);

CREATE TABLE clinica_vet.enfermidade (
	cod_enfermidade integer PRIMARY KEY,
	nome_enfermidade varchar (250) not null
);

-- Relação entre tabelas CLIENTE_ANIMAL e ENFERMIDADE
CREATE TABLE clinica_vet.possui (
	codc varchar,
	coda integer,
	code integer,

	FOREIGN KEY (codc) REFERENCES clinica_vet.cliente (cpf_cliente),
	FOREIGN KEY (coda) REFERENCES clinica_vet.animal (cod_animal),
	FOREIGN KEY (code) REFERENCES clinica_vet.enfermidade (cod_enfermidade)
);

-- Relação entre tabelas MED_VETERINARIO e ENFERMIDADE
CREATE TABLE clinica_vet.tratamento (
	codm integer,
	code integer,

	FOREIGN KEY (codm) REFERENCES clinica_vet.med_veterinario (cod_medico),
	FOREIGN KEY (code) REFERENCES clinica_vet.enfermidade (cod_enfermidade)
);

-- INSERT CLIENTE
INSERT INTO clinica_vet.cliente (cpf_cliente, nome_cliente, telefone_cliente, endereco) VALUES ('888.888.888-88', 'Cleslley', 11110000, 'QNP 04 08');
INSERT INTO clinica_vet.cliente (cpf_cliente, nome_cliente, telefone_cliente, endereco) VALUES ('444.444.444-44', 'Victor', 22220000, 'QNP 07 17');
INSERT INTO clinica_vet.cliente (cpf_cliente, nome_cliente, telefone_cliente, endereco) VALUES ('666.666.666-66', 'Lara', 33330000, 'QNP 07 60');
INSERT INTO clinica_vet.cliente (cpf_cliente, nome_cliente, telefone_cliente, endereco) VALUES ('999.999.999-99', 'Gabriel', 44440000, 'QNP 26 01');

SELECT * FROM clinica_vet.cliente;

-- INSERT ANIMAL
INSERT INTO clinica_vet.animal (cod_animal, raca_animal, sexo, nome_animal, idade) VALUES (88888, 'Não sei se comento', 'M', 'Hércules', 03);
INSERT INTO clinica_vet.animal (cod_animal, raca_animal, sexo, nome_animal, idade) VALUES (44444, 'Coitadolândia', 'F', 'Suzy', 03);
INSERT INTO clinica_vet.animal (cod_animal, raca_animal, sexo, nome_animal, idade) VALUES (66666, 'Pidão', 'F', 'Beca', 12);
INSERT INTO clinica_vet.animal (cod_animal, raca_animal, sexo, nome_animal, idade) VALUES (99999, 'Pug', 'F', 'Lucy', 05);

SELECT * FROM clinica_vet.animal;

-- INSERT CLIENTE_ANIMAL
INSERT INTO clinica_vet.cliente_animal (codc, coda) VALUES ('888.888.888-88', 88888);
INSERT INTO clinica_vet.cliente_animal (codc, coda) VALUES ('444.444.444-44', 44444);
INSERT INTO clinica_vet.cliente_animal (codc, coda) VALUES ('666.666.666-66', 66666);
INSERT INTO clinica_vet.cliente_animal (codc, coda) VALUES ('999.999.999-99', 99999);

SELECT * FROM clinica_vet.cliente_animal;

-- INSERT MEDICO VETERINÁRIO

INSERT INTO clinica_vet.med_veterinario (cod_medico, crmv_medico, nome_medico, telefone_med, codc, coda) VALUES (011, '00100101', 'Carlos', 30300000, '666.666.666-66', 66666);
INSERT INTO clinica_vet.med_veterinario (cod_medico, crmv_medico, nome_medico, telefone_med, codc, coda) VALUES (022, '00200202', 'Asaph', 20200000, '999.999.999-99', 99999);

SELECT * FROM clinica_vet.med_veterinario;

-- INSERT ENFERMIDADE
INSERT INTO clinica_vet.enfermidade (cod_enfermidade, nome_enfermidade) VALUES (131, 'Gripe');
INSERT INTO clinica_vet.enfermidade (cod_enfermidade, nome_enfermidade) VALUES (445, 'Ortite');
INSERT INTO clinica_vet.enfermidade (cod_enfermidade, nome_enfermidade) VALUES (781, 'Pulga');
INSERT INTO clinica_vet.enfermidade (cod_enfermidade, nome_enfermidade) VALUES (246, 'Carrapato');

SELECT * FROM clinica_vet.enfermidade;

-- INSERT relação POSSUI entre CLIENTE_ANIMAL e ENFERMIDADE

INSERT INTO clinica_vet.possui (codc, coda, code) VALUES ('666.666.666-66', 66666, 445);
INSERT INTO clinica_vet.possui (codc, coda, code) VALUES ('999.999.999-99', 99999, 131);

SELECT * FROM clinica_vet.possui;

-- INSERT relação TRATAMENTO entre MÉD. VETERINÁRIO e ENFERMIDADE

INSERT INTO clinica_vet.tratamento (codm, code) VALUES (011, 445);
INSERT INTO clinica_vet.tratamento (codm, code) VALUES (022, 131);

SELECT * FROM clinica_vet.tratamento;

-- Manipulação de Dados TABELA CLIENTE.
-- Implementar consultas SQL para realizar operações comuns do BD do aplicativo. Escolher uma tabela e enviar as consultas.  
-- 1.   Adicionar uma nova linha.
INSERT INTO clinica_vet.cliente (cpf_cliente, nome_cliente, telefone_cliente, endereco) VALUES ('111.111.111-11', 'Guilherme', 55550000, 'QNP 04 09');
SELECT * FROM clinica_vet.cliente;
-- 2.   Atualizar.
UPDATE clinica_vet.cliente SET telefone_cliente = 99990000 WHERE cpf_cliente = '888.888.888-88';
SELECT * FROM clinica_vet.cliente;
-- 3.   Excluir.
DELETE FROM clinica_vet.cliente WHERE cpf_cliente = '111.111.111-11';
SELECT * FROM clinica_vet.cliente;
-- 4.   Realizar uma consulta envolvendo 2 tabelas (explicar o que está pesquisando)
SELECT c.nome_cliente, a.nome_animal
FROM clinica_vet.cliente c
JOIN clinica_vet.cliente_animal ca ON c.cpf_cliente = ca.codc
JOIN clinica_vet.animal a ON ca.coda = a.cod_animal;
-- 5.   Realizar uma consulta envolvendo mais de uma tabela e usando JOIN (explicar o que está pesquisando)
SELECT c.nome_cliente, a.nome_animal
FROM clinica_vet.cliente c
JOIN clinica_vet.cliente_animal ca ON c.cpf_cliente = ca.codc
JOIN clinica_vet.animal a ON ca.coda = a.cod_animal
WHERE a.raca_animal = 'Pidão';

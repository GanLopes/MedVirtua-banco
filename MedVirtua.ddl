
----------------------------------------------------------------------------------------------------------------------------------
//DDL:
----------------------------------------------------------------------------------------------------------------------------------

DROP TABLE T_MDV_REGISTRO CASCADE CONSTRAINTS;
DROP TABLE T_MDV_REGISTRO_CLIENTE CASCADE CONSTRAINTS;
DROP TABLE T_MDV_CALENDARIO CASCADE CONSTRAINTS;
DROP TABLE T_MDV_CONTATO CASCADE CONSTRAINTS;
DROP TABLE T_MDV_REGISTRO_ESPECIALISTA CASCADE CONSTRAINTS;
DROP TABLE T_MDV_DOENCAS CASCADE CONSTRAINTS;
DROP TABLE T_MDV_MEDIDAS CASCADE CONSTRAINTS;


DROP SEQUENCE seq_id_usuario;
DROP SEQUENCE seq_id_calendario;
DROP SEQUENCE seq_id_doenca;


CREATE SEQUENCE seq_id_usuario START WITH 1 INCREMENT BY 1 NOCYCLE NOCACHE ORDER;
CREATE SEQUENCE seq_id_calendario START WITH 1 INCREMENT BY 1 NOCYCLE NOCACHE ORDER;
CREATE SEQUENCE seq_id_doenca START WITH 1 INCREMENT BY 1 NOCYCLE NOCACHE ORDER;
CREATE SEQUENCE seq_id_vacina START WITH 1 INCREMENT BY 1 NOCYCLE NOCACHE ORDER;

CREATE TABLE T_MDV_REGISTRO ( 
    id_usuario NUMBER (3) PRIMARY KEY,
    nm_usuario VARCHAR2(20) NOT NULL,
    nm_senha VARCHAR2(12) NOT NULL
);

CREATE TABLE T_MDV_REGISTRO_CLIENTE (
    id_usuario NUMBER (3) PRIMARY KEY,
    dt_nascimento DATE NOT NULL,
    nm_usuario VARCHAR2(50) NOT NULL,
    nm_senha VARCHAR2(20) NOT NULL,
    nr_cep NUMBER(8) NOT NULL,
    CONSTRAINT fk_id_usuario_cli FOREIGN KEY (id_usuario) REFERENCES T_MDV_REGISTRO (id_usuario)
);

CREATE TABLE T_MDV_CALENDARIO (
    dt_marcada DATE,
    nm_evento VARCHAR2(30) NOT NULL,
    tp_evento VARCHAR2(20) NOT NULL,
    id_calendario NUMBER (3) PRIMARY KEY,
    id_usuario NUMBER (3) NOT NULL,
    CONSTRAINT fk_id_usuario_cal FOREIGN KEY (id_usuario) REFERENCES T_MDV_REGISTRO (id_usuario)
);

CREATE TABLE T_MDV_CONTATO (
    tp_contato VARCHAR2 (10) NOT NULL,
    nr_telefone NUMBER (12),
    nm_email VARCHAR2(30),
    id_usuario NUMBER (3) PRIMARY KEY NOT NULL,
    CONSTRAINT fk_id_usuario_con FOREIGN KEY (id_usuario) REFERENCES T_MDV_REGISTRO (id_usuario)
);

CREATE TABLE T_MDV_REGISTRO_ESPECIALISTA(
    id_usuario NUMBER (3) NOT NULL,
    nm_usuario VARCHAR2(50) NOT NULL,
    nm_senha VARCHAR2(20) NOT NULL,
    nr_crm NUMBER (12) PRIMARY KEY NOT NULL,
    CONSTRAINT fk_id_usuario_especi_ FOREIGN KEY (id_usuario) REFERENCES T_MDV_REGISTRO (id_usuario)
);

CREATE TABLE T_MDV_DOENCAS(
    nm_doenca VARCHAR2 (30) NOT NULL,
    tp_doenca VARCHAR2 (15) NOT NULL,
    fx_etaria VARCHAR2 (10) NOT NULL,
    ds_doenca VARCHAR2 (1200) NOT NULL,
    id_usuario NUMBER (3) NOT NULL,
    id_doenca NUMBER (3) PRIMARY KEY NOT NULL,
    CONSTRAINT fk_id_usuario_doencas FOREIGN KEY (id_usuario) REFERENCES T_MDV_REGISTRO (id_usuario)
);
CREATE TABLE T_MDV_MEDIDAS(
    nm_vacina VARCHAR2 (20),
    id_vacina NUMBER (3) ,
    ds_medida VARCHAR2 (1200),
    id_doenca NUMBER (3) PRIMARY KEY NOT NULL,
    ds_remedio VARCHAR2 (1200) ,
    nm_remedio VARCHAR2 (30) ,
    CONSTRAINT fk_id_doenca FOREIGN KEY (id_doenca) REFERENCES T_MDV_DOENCAS (id_doenca)
);
--------------------------------------------------------------------------------------------------------------------------------
//DML
-------------------------------------------------------------------------------------------------------------------------------

//Primeiro Cliente

-- Inserir dados do cliente em T_MDV_REGISTRO
INSERT INTO T_MDV_REGISTRO (id_usuario, nm_usuario, nm_senha)
VALUES (seq_id_usuario.NEXTVAL, 'Pedro Mourão', '4790');

-- Inserir dados do cliente em T_MDV_REGISTRO_CLIENTE
INSERT INTO T_MDV_REGISTRO_CLIENTE (id_usuario, dt_nascimento, nm_usuario, nm_senha, nr_cep)
VALUES (seq_id_usuario.CURRVAL, TO_DATE('1990-03-01', 'YYYY-MM-DD'), 'Pedro Mourão', '4790', 00448903);

-- Inserir dados do cliente em T_MDV_CALENDARIO
INSERT INTO T_MDV_CALENDARIO (dt_marcada, nm_evento, tp_evento, id_calendario, id_usuario)
VALUES (TO_DATE('2023-11-19', 'YYYY-MM-DD'), 'Vacinação antitetonica', 'Vacinação', seq_id_calendario.NEXTVAL, seq_id_usuario.CURRVAL);

-- Inserir dados do cliente em T_MDV_CONTATO
INSERT INTO T_MDV_CONTATO (tp_contato, nm_email, id_usuario)
VALUES ('Email','pedro@yahoo.com', seq_id_usuario.CURRVAL);

-----------------------------------------------------------------------------------------------------------------------------
//Segundo Cliente

-- Inserir dados do cliente em T_MDV_REGISTRO
INSERT INTO T_MDV_REGISTRO (id_usuario, nm_usuario, nm_senha)
VALUES (seq_id_usuario.NEXTVAL, 'Rafael Pereira', 'pera');

-- Inserir dados do cliente em T_MDV_REGISTRO_CLIENTE
INSERT INTO T_MDV_REGISTRO_CLIENTE (id_usuario, dt_nascimento, nm_usuario, nm_senha, nr_cep)
VALUES (seq_id_usuario.CURRVAL, TO_DATE('1989-07-19', 'YYYY-MM-DD'), 'Rafael Pereira', 'pera', 03498803);

-- Inserir dados do cliente em T_MDV_CALENDARIO
INSERT INTO T_MDV_CALENDARIO (dt_marcada, nm_evento, tp_evento, id_calendario, id_usuario)
VALUES (TO_DATE('2021-03-20', 'YYYY-MM-DD'), 'Metodos contraceptivos', 'Palestra', seq_id_calendario.NEXTVAL, seq_id_usuario.CURRVAL);

-- Inserir dados do cliente em T_MDV_CONTATO
INSERT INTO T_MDV_CONTATO (tp_contato, nr_telefone, id_usuario)
VALUES ('Telefone', 57023404, seq_id_usuario.CURRVAL);

-----------------------------------------------------------------------------------------------------------------------------
//Terceiro Cliente

-- Inserir dados do cliente em T_MDV_REGISTRO
INSERT INTO T_MDV_REGISTRO (id_usuario, nm_usuario, nm_senha)
VALUES (seq_id_usuario.NEXTVAL, 'José Silva', 'silva1');

-- Inserir dados do cliente em T_MDV_REGISTRO_CLIENTE
INSERT INTO T_MDV_REGISTRO_CLIENTE (id_usuario, dt_nascimento, nm_usuario, nm_senha, nr_cep)
VALUES (seq_id_usuario.CURRVAL, TO_DATE('2001-11-23', 'YYYY-MM-DD'), 'José Silva', 'silva1', 00995630);

-- Inserir dados do cliente em T_MDV_CALENDARIO
INSERT INTO T_MDV_CALENDARIO (dt_marcada, nm_evento, tp_evento, id_calendario, id_usuario)
VALUES (TO_DATE('2021-01-19', 'YYYY-MM-DD'), 'Vacina da hepatite', 'Vacinação', seq_id_calendario.NEXTVAL, seq_id_usuario.CURRVAL);

-- Inserir dados do cliente em T_MDV_CONTATO
INSERT INTO T_MDV_CONTATO (tp_contato, nr_telefone, id_usuario)
VALUES ('Telefone', 985573022, seq_id_usuario.CURRVAL);

-----------------------------------------------------------------------------------------------------------------------------
//Quarto Cliente

-- Inserir dados do cliente em T_MDV_REGISTRO
INSERT INTO T_MDV_REGISTRO (id_usuario, nm_usuario, nm_senha)
VALUES (seq_id_usuario.NEXTVAL, 'Luana Carla', '99493');

-- Inserir dados do cliente em T_MDV_REGISTRO_CLIENTE
INSERT INTO T_MDV_REGISTRO_CLIENTE (id_usuario, dt_nascimento, nm_usuario, nm_senha, nr_cep)
VALUES (seq_id_usuario.CURRVAL, TO_DATE('2003-09-01', 'YYYY-MM-DD'), 'Luana Carla', '99493', 00448993);

-- Inserir dados do cliente em T_MDV_CALENDARIO
INSERT INTO T_MDV_CALENDARIO (dt_marcada, nm_evento, tp_evento, id_calendario, id_usuario)
VALUES (TO_DATE('2023-12-04', 'YYYY-MM-DD'), 'Vacinação antitetonica', 'Vacinação', seq_id_calendario.NEXTVAL, seq_id_usuario.CURRVAL);

-- Inserir dados do cliente em T_MDV_CONTATO
INSERT INTO T_MDV_CONTATO (tp_contato, nr_telefone, nm_email, id_usuario)
VALUES ('Tele/email', 46890303, 'luca@hotmail.com', seq_id_usuario.CURRVAL);

-----------------------------------------------------------------------------------------------------------------------------
//Quinta Cliente

-- Inserir dados do cliente em T_MDV_REGISTRO
INSERT INTO T_MDV_REGISTRO (id_usuario, nm_usuario, nm_senha)
VALUES (seq_id_usuario.NEXTVAL, 'Gustavo Godoi', 'palmeirense');

-- Inserir dados do cliente em T_MDV_REGISTRO_CLIENTE
INSERT INTO T_MDV_REGISTRO_CLIENTE (id_usuario, dt_nascimento, nm_usuario, nm_senha, nr_cep)
VALUES (seq_id_usuario.CURRVAL, TO_DATE('1990-03-01', 'YYYY-MM-DD'), 'Gustavo Godoi', 'Palmeirense', 0695000);

-- Inserir dados do cliente em T_MDV_CALENDARIO
INSERT INTO T_MDV_CALENDARIO (dt_marcada, nm_evento, tp_evento, id_calendario, id_usuario)
VALUES (TO_DATE('2021-06-06', 'YYYY-MM-DD'), 'Distribuição de remedios', 'Distribuição', seq_id_calendario.NEXTVAL, seq_id_usuario.CURRVAL);

-- Inserir dados do cliente em T_MDV_CONTATO
INSERT INTO T_MDV_CONTATO (tp_contato, nm_email, id_usuario)
VALUES ('Email', 'godoizao@yahoo.com', seq_id_usuario.CURRVAL);
-----------------------------------------------------------------------------------------------------------------------------
//Sexto Cliente

-- Inserir dados do cliente em T_MDV_REGISTRO
INSERT INTO T_MDV_REGISTRO (id_usuario, nm_usuario, nm_senha)
VALUES (seq_id_usuario.NEXTVAL, 'Guilherme Carneiro', 'guilindo');

-- Inserir dados do cliente em T_MDV_REGISTRO_CLIENTE
INSERT INTO T_MDV_REGISTRO_CLIENTE (id_usuario, dt_nascimento, nm_usuario, nm_senha, nr_cep)
VALUES (seq_id_usuario.CURRVAL, TO_DATE('2005-07-01', 'YYYY-MM-DD'), 'Guilherme Carneiro', 'guilindo', 0695000);

-- Inserir dados do cliente em T_MDV_CALENDARIO
INSERT INTO T_MDV_CALENDARIO (dt_marcada, nm_evento, tp_evento, id_calendario, id_usuario)
VALUES (TO_DATE('2023-11-19', 'YYYY-MM-DD'), 'Cuidados para bebes', 'Palestra', seq_id_calendario.NEXTVAL, seq_id_usuario.CURRVAL);

-- Inserir dados do cliente em T_MDV_CONTATO
INSERT INTO T_MDV_CONTATO (tp_contato, nm_email, id_usuario)
VALUES ('Email', 'guipoka@yahoo.com', seq_id_usuario.CURRVAL);

-----------------------------------------------------------------------------------------------------------------------------
//Setimo Cliente

-- Inserir dados do cliente em T_MDV_REGISTRO
INSERT INTO T_MDV_REGISTRO (id_usuario, nm_usuario, nm_senha)
VALUES (seq_id_usuario.NEXTVAL, 'Ricardo Lara', 'gaia');

-- Inserir dados do cliente em T_MDV_REGISTRO_CLIENTE
INSERT INTO T_MDV_REGISTRO_CLIENTE (id_usuario, dt_nascimento, nm_usuario, nm_senha, nr_cep)
VALUES (seq_id_usuario.CURRVAL, TO_DATE('1983-06-29', 'YYYY-MM-DD'), 'Ricardo Lara', 'gaia', 01339903);

-- Inserir dados do cliente em T_MDV_CALENDARIO
INSERT INTO T_MDV_CALENDARIO (dt_marcada, nm_evento, tp_evento, id_calendario, id_usuario)
VALUES (TO_DATE('2023-09-30', 'YYYY-MM-DD'), 'Vacinação Poliomelite', 'Vacinação', seq_id_calendario.NEXTVAL, seq_id_usuario.CURRVAL);

-- Inserir dados do cliente em T_MDV_CONTATO
INSERT INTO T_MDV_CONTATO (tp_contato, nr_telefone, id_usuario)
VALUES ('Telefone', 46821237, seq_id_usuario.CURRVAL);

-----------------------------------------------------------------------------------------------------------------------------
//Oitavo Cliente

-- Inserir dados do cliente em T_MDV_REGISTRO
INSERT INTO T_MDV_REGISTRO (id_usuario, nm_usuario, nm_senha)
VALUES (seq_id_usuario.NEXTVAL, 'Helena Mendes', 'sapoel');

-- Inserir dados do cliente em T_MDV_REGISTRO_CLIENTE
INSERT INTO T_MDV_REGISTRO_CLIENTE (id_usuario, dt_nascimento, nm_usuario, nm_senha, nr_cep)
VALUES (seq_id_usuario.CURRVAL, TO_DATE('1976-03-01', 'YYYY-MM-DD'), 'Helena Mendes', 'sapoel', 0695000);

-- Inserir dados do cliente em T_MDV_CALENDARIO
INSERT INTO T_MDV_CALENDARIO (dt_marcada, nm_evento, tp_evento, id_calendario, id_usuario)
VALUES (TO_DATE('2021-11-15', 'YYYY-MM-DD'), 'Distribuiçãos remedios', 'Distribuição', seq_id_calendario.NEXTVAL, seq_id_usuario.CURRVAL);

-- Inserir dados do cliente em T_MDV_CONTATO
INSERT INTO T_MDV_CONTATO (tp_contato, nm_email, id_usuario)
VALUES ('Email' , 'detroia@yahoo.com', seq_id_usuario.CURRVAL);

-----------------------------------------------------------------------------------------------------------------------------
//Nono Cliente

-- Inserir dados do cliente em T_MDV_REGISTRO
INSERT INTO T_MDV_REGISTRO (id_usuario, nm_usuario, nm_senha)
VALUES (seq_id_usuario.NEXTVAL, 'Matheus Octaviano', 'hearthstone');

-- Inserir dados do cliente em T_MDV_REGISTRO_CLIENTE
INSERT INTO T_MDV_REGISTRO_CLIENTE (id_usuario, dt_nascimento, nm_usuario, nm_senha, nr_cep)
VALUES (seq_id_usuario.CURRVAL, TO_DATE('1990-03-01', 'YYYY-MM-DD'), 'Matehus Octaviano', 'hearthstone', 00448903);

-- Inserir dados do cliente em T_MDV_CALENDARIO
INSERT INTO T_MDV_CALENDARIO (dt_marcada, nm_evento, tp_evento, id_calendario, id_usuario)
VALUES (TO_DATE('2023-08-28', 'YYYY-MM-DD'), 'Febre Amarela', 'Vacinação', seq_id_calendario.NEXTVAL, seq_id_usuario.CURRVAL);

-- Inserir dados do cliente em T_MDV_CONTATO
INSERT INTO T_MDV_CONTATO (tp_contato, nr_telefone, id_usuario)
VALUES ('Telefone', 985520303, seq_id_usuario.CURRVAL);

-----------------------------------------------------------------------------------------------------------------------------
//Decimo Cliente

-- Inserir dados do cliente em T_MDV_REGISTRO
INSERT INTO T_MDV_REGISTRO (id_usuario, nm_usuario, nm_senha)
VALUES (seq_id_usuario.NEXTVAL, 'Caio Ferreira', 'bloxfruit');

-- Inserir dados do cliente em T_MDV_REGISTRO_CLIENTE
INSERT INTO T_MDV_REGISTRO_CLIENTE (id_usuario, dt_nascimento, nm_usuario, nm_senha, nr_cep)
VALUES (seq_id_usuario.CURRVAL, TO_DATE('2005-11-08', 'YYYY-MM-DD'), 'Caio Ferreira', 'bloxfruit', 06950000);

-- Inserir dados do cliente em T_MDV_CALENDARIO
INSERT INTO T_MDV_CALENDARIO (dt_marcada, nm_evento, tp_evento, id_calendario, id_usuario)
VALUES (TO_DATE('2020-09-05', 'YYYY-MM-DD'), 'Vacinação antitetonica', 'Vacinação', seq_id_calendario.NEXTVAL, seq_id_usuario.CURRVAL);

-- Inserir dados do cliente em T_MDV_CONTATO
INSERT INTO T_MDV_CONTATO (tp_contato, nm_email, id_usuario)
VALUES ('Email', 'raci@outlook.com', seq_id_usuario.CURRVAL);

-----------------------------------------------------------------------------------------------------------------------------
//Primeiro Especialista

-- Inserir dados do especialista em T_MDV_REGISTRO
INSERT INTO T_MDV_REGISTRO (id_usuario, nm_usuario, nm_senha)
VALUES (seq_id_usuario.NEXTVAL, 'Eduardo Pessoa', 'açai');

-- Inserir dados do especialista em T_MDV_REGISTRO_ESPECIALISTA
INSERT INTO T_MDV_REGISTRO_ESPECIALISTA (id_usuario, nm_usuario, nm_senha, nr_crm)
VALUES (seq_id_usuario.CURRVAL, 'Eduardo Pessoa', 'açai', '123456');

-- Inserir dados do especialista em T_MDV_DOENCAS
INSERT INTO T_MDV_DOENCAS (id_usuario, nm_doenca, tp_doenca, fx_etaria, ds_doenca, id_doenca)
VALUES (seq_id_usuario.CURRVAL, 'Gripe', 'Infecciosa', 'Todas', 'Infecção viral comum, sintomas respiratórios.', seq_id_doenca.NEXTVAL);

-- Inserir dados do especialista em T_MDV_MEDIDAS
INSERT INTO T_MDV_MEDIDAS (nm_vacina, id_vacina, ds_medida, id_doenca)
VALUES ('Vacina da Gripe', seq_id_vacina.NEXTVAL, 'Manter boa higiene, evitar contato próximo com infectados.', seq_id_doenca.CURRVAL );

-- Inserir dados do especialista em T_MDV_CONTATO
INSERT INTO T_MDV_CONTATO (tp_contato, nm_email, id_usuario)
VALUES ('Email', 'eduedu@gmail.com', seq_id_usuario.CURRVAL);
-----------------------------------------------------------------------------------------------------------------------------
//Segundo Especialista

-- Inserir dados do especialista em T_MDV_REGISTRO
INSERT INTO T_MDV_REGISTRO (id_usuario, nm_usuario, nm_senha)
VALUES (seq_id_usuario.NEXTVAL, 'Rafael Oliveira', 'pacman');

-- Inserir dados do especialista em T_MDV_REGISTRO_ESPECIALISTA
INSERT INTO T_MDV_REGISTRO_ESPECIALISTA (id_usuario, nm_usuario, nm_senha, nr_crm)
VALUES (seq_id_usuario.CURRVAL, 'Rafael Oliveira', 'pacman', '2344567');

-- Inserir dados do especialista em T_MDV_DOENCAS
INSERT INTO T_MDV_DOENCAS (id_usuario, nm_doenca, tp_doenca, fx_etaria, ds_doenca, id_doenca)
VALUES (seq_id_usuario.CURRVAL, 'Diabetes', 'Metabólica', 'Adultos', 'Desordem do metabolismo de glicose.', seq_id_doenca.NEXTVAL);

-- Inserir dados do especialista em T_MDV_MEDIDAS
INSERT INTO T_MDV_MEDIDAS (nm_remedio, id_vacina, ds_remedio, id_doenca)
VALUES ('Insulina', seq_id_vacina.NEXTVAL, 'Controle glicêmico, dieta balanceada e exercícios regulares.', seq_id_doenca.CURRVAL );

-- Inserir dados do especialista em T_MDV_CONTATO
INSERT INTO T_MDV_CONTATO (tp_contato, nm_email, id_usuario)
VALUES ('Email', 'portuga@gmail.com', seq_id_usuario.CURRVAL);
-----------------------------------------------------------------------------------------------------------------------------
//Terceiro Especialista

-- Inserir dados do especialista em T_MDV_REGISTRO
INSERT INTO T_MDV_REGISTRO (id_usuario, nm_usuario, nm_senha)
VALUES (seq_id_usuario.NEXTVAL, 'Gilberto Rodrigues', 'javaevida');

-- Inserir dados do especialista em T_MDV_REGISTRO_ESPECIALISTA
INSERT INTO T_MDV_REGISTRO_ESPECIALISTA (id_usuario, nm_usuario, nm_senha, nr_crm)
VALUES (seq_id_usuario.CURRVAL, 'Gilberto Rodrigues', 'javaevida', '985523');

-- Inserir dados do especialista em T_MDV_DOENCAS
INSERT INTO T_MDV_DOENCAS (id_usuario, nm_doenca, tp_doenca, fx_etaria, ds_doenca, id_doenca)
VALUES (seq_id_usuario.CURRVAL, 'Hipertensão', 'Cardiovascular', 'Adultos', 'Pressão arterial elevada.', seq_id_doenca.NEXTVAL);

-- Inserir dados do especialista em T_MDV_MEDIDAS
INSERT INTO T_MDV_MEDIDAS (ds_medida, id_doenca)
VALUES ('Controle da pressão arterial, dieta com baixo teor de sal.', seq_id_doenca.CURRVAL );

-- Inserir dados do especialista em T_MDV_CONTATO
INSERT INTO T_MDV_CONTATO (tp_contato, nm_email, id_usuario)
VALUES ('Email', 'cafe@outlook.com', seq_id_usuario.CURRVAL);
-----------------------------------------------------------------------------------------------------------------------------
//Quarto Especialista

-- Inserir dados do especialista em T_MDV_REGISTRO
INSERT INTO T_MDV_REGISTRO (id_usuario, nm_usuario, nm_senha)
VALUES (seq_id_usuario.NEXTVAL, 'Lairson Maia', 'sapo');

-- Inserir dados do especialista em T_MDV_REGISTRO_ESPECIALISTA
INSERT INTO T_MDV_REGISTRO_ESPECIALISTA (id_usuario, nm_usuario, nm_senha, nr_crm)
VALUES (seq_id_usuario.CURRVAL, 'Lairson Maia', 'sapo', '672839');

-- Inserir dados do especialista em T_MDV_DOENCAS
INSERT INTO T_MDV_DOENCAS (id_usuario, nm_doenca, tp_doenca, fx_etaria, ds_doenca, id_doenca)
VALUES (seq_id_usuario.CURRVAL, 'Dengue ', 'Infecciosa', 'Todas', 'Transmitida por mosquitos, sintomas febris.', seq_id_doenca.NEXTVAL);

-- Inserir dados do especialista em T_MDV_MEDIDAS
INSERT INTO T_MDV_MEDIDAS (nm_vacina, id_vacina, ds_medida, id_doenca)
VALUES ('Vacina da Dengue', seq_id_vacina.NEXTVAL, 'Controle de mosquitos, remoção de recipientes de água parada.', seq_id_doenca.CURRVAL );

-- Inserir dados do especialista em T_MDV_CONTATO
INSERT INTO T_MDV_CONTATO (tp_contato, nm_email, id_usuario)
VALUES ('Email', 'cururu@gmail.com', seq_id_usuario.CURRVAL);
-----------------------------------------------------------------------------------------------------------------------------
//Quinto Especialista

-- Inserir dados do especialista em T_MDV_REGISTRO
INSERT INTO T_MDV_REGISTRO (id_usuario, nm_usuario, nm_senha)
VALUES (seq_id_usuario.NEXTVAL, 'Vinicius Carneiro', 'rdr2');

-- Inserir dados do especialista em T_MDV_REGISTRO_ESPECIALISTA
INSERT INTO T_MDV_REGISTRO_ESPECIALISTA (id_usuario, nm_usuario, nm_senha, nr_crm)
VALUES (seq_id_usuario.CURRVAL, 'Vinicius Carneiro', 'rdr2', '349030');

-- Inserir dados do especialista em T_MDV_DOENCAS
INSERT INTO T_MDV_DOENCAS (id_usuario, nm_doenca, tp_doenca, fx_etaria, ds_doenca, id_doenca)
VALUES (seq_id_usuario.CURRVAL, 'Asma', 'Respiratória', 'Todas', 'Condição crônica com dificuldades respiratórias.', seq_id_doenca.NEXTVAL);

-- Inserir dados do especialista em T_MDV_MEDIDAS
INSERT INTO T_MDV_MEDIDAS (nm_remedio, id_vacina, ds_medida, id_doenca)
VALUES ('Inhaladores e Corticoides', seq_id_vacina.NEXTVAL, 'Evitar alérgenos, uso de medicamentos conforme orientação.', seq_id_doenca.CURRVAL );

-- Inserir dados do especialista em T_MDV_CONTATO
INSERT INTO T_MDV_CONTATO (tp_contato, nm_email, id_usuario)
VALUES ('Email', 'vinao@yahoo.com', seq_id_usuario.CURRVAL);
-----------------------------------------------------------------------------------------------------------------------------
//Sexto Especialista

-- Inserir dados do especialista em T_MDV_REGISTRO
INSERT INTO T_MDV_REGISTRO (id_usuario, nm_usuario, nm_senha)
VALUES (seq_id_usuario.NEXTVAL, 'Lucas Veron', 'metodoz');

-- Inserir dados do especialista em T_MDV_REGISTRO_ESPECIALISTA
INSERT INTO T_MDV_REGISTRO_ESPECIALISTA (id_usuario, nm_usuario, nm_senha, nr_crm)
VALUES (seq_id_usuario.CURRVAL, 'Lucas Veron', 'metodoz', '157010');

-- Inserir dados do especialista em T_MDV_DOENCAS
INSERT INTO T_MDV_DOENCAS (id_usuario, nm_doenca, tp_doenca, fx_etaria, ds_doenca, id_doenca)
VALUES (seq_id_usuario.CURRVAL, 'Artrite Reumatoide', 'Autoimune', 'Adultos', 'Inflamação das articulações. ', seq_id_doenca.NEXTVAL);

-- Inserir dados do especialista em T_MDV_MEDIDAS
INSERT INTO T_MDV_MEDIDAS (nm_remedio, id_vacina, ds_medida, id_doenca)
VALUES ('DMARDs', seq_id_vacina.NEXTVAL, 'Fisioterapia, medicamentos para aliviar a inflamação.', seq_id_doenca.CURRVAL );

-- Inserir dados do especialista em T_MDV_CONTATO
INSERT INTO T_MDV_CONTATO (tp_contato, nm_email, id_usuario)
VALUES ('Email', 'lukaz@gmail.com', seq_id_usuario.CURRVAL);
-----------------------------------------------------------------------------------------------------------------------------
//Setimo Especialista

-- Inserir dados do especialista em T_MDV_REGISTRO
INSERT INTO T_MDV_REGISTRO (id_usuario, nm_usuario, nm_senha)
VALUES (seq_id_usuario.NEXTVAL, 'Jimmy Mcgil', 'saulgoodman');

-- Inserir dados do especialista em T_MDV_REGISTRO_ESPECIALISTA
INSERT INTO T_MDV_REGISTRO_ESPECIALISTA (id_usuario, nm_usuario, nm_senha, nr_crm)
VALUES (seq_id_usuario.CURRVAL, 'Jimmy Mcgil', 'saulgoodman', '983321');

-- Inserir dados do especialista em T_MDV_DOENCAS
INSERT INTO T_MDV_DOENCAS (id_usuario, nm_doenca, tp_doenca, fx_etaria, ds_doenca, id_doenca)
VALUES (seq_id_usuario.CURRVAL, 'Enxaqueca', 'Neurologia', 'Todas', 'Dor de cabeça recorrente e intensa.', seq_id_doenca.NEXTVAL);

-- Inserir dados do especialista em T_MDV_MEDIDAS
INSERT INTO T_MDV_MEDIDAS (ds_medida, id_doenca)
VALUES ('Identificação de gatilhos, medicamentos específicos.', seq_id_doenca.CURRVAL );

-- Inserir dados do especialista em T_MDV_CONTATO
INSERT INTO T_MDV_CONTATO (tp_contato, nm_email, id_usuario)
VALUES ('Email', 'bcs@yahoo.com', seq_id_usuario.CURRVAL);
-----------------------------------------------------------------------------------------------------------------------------
//Oitavo Especialista

-- Inserir dados do especialista em T_MDV_REGISTRO
INSERT INTO T_MDV_REGISTRO (id_usuario, nm_usuario, nm_senha)
VALUES (seq_id_usuario.NEXTVAL, 'Gustavo Fring', 'frangof');

-- Inserir dados do especialista em T_MDV_REGISTRO_ESPECIALISTA
INSERT INTO T_MDV_REGISTRO_ESPECIALISTA (id_usuario, nm_usuario, nm_senha, nr_crm)
VALUES (seq_id_usuario.CURRVAL, 'Gustavo Fring', 'frangof', '468274');

-- Inserir dados do especialista em T_MDV_DOENCAS
INSERT INTO T_MDV_DOENCAS (id_usuario, nm_doenca, tp_doenca, fx_etaria, ds_doenca, id_doenca)
VALUES (seq_id_usuario.CURRVAL, 'Colesterol Elevado ', 'Cardiovasvular', 'Adultos', 'Níveis elevados de colesterol no sangue.', seq_id_doenca.NEXTVAL);

-- Inserir dados do especialista em T_MDV_MEDIDAS
INSERT INTO T_MDV_MEDIDAS (nm_remedio, id_vacina, ds_medida, id_doenca)
VALUES ('Estatinas', seq_id_vacina.NEXTVAL, 'Dieta saudável, exercícios regulares e medicamentos se necessário.', seq_id_doenca.CURRVAL );

-- Inserir dados do especialista em T_MDV_CONTATO
INSERT INTO T_MDV_CONTATO (tp_contato, nm_email, id_usuario)
VALUES ('Email', 'lospoloshermanos@gmail.com', seq_id_usuario.CURRVAL);
-----------------------------------------------------------------------------------------------------------------------------
//Nono Especialista

-- Inserir dados do especialista em T_MDV_REGISTRO
INSERT INTO T_MDV_REGISTRO (id_usuario, nm_usuario, nm_senha)
VALUES (seq_id_usuario.NEXTVAL, 'Juliana Paz', 'palismene');

-- Inserir dados do especialista em T_MDV_REGISTRO_ESPECIALISTA
INSERT INTO T_MDV_REGISTRO_ESPECIALISTA (id_usuario, nm_usuario, nm_senha, nr_crm)
VALUES (seq_id_usuario.CURRVAL, 'Juliana Paz', 'palismene', '998722');

-- Inserir dados do especialista em T_MDV_DOENCAS
INSERT INTO T_MDV_DOENCAS (id_usuario, nm_doenca, tp_doenca, fx_etaria, ds_doenca, id_doenca)
VALUES (seq_id_usuario.CURRVAL, 'Ansiedade ', 'Mental', 'Todas', 'Preocupação excessiva e nervosismo.', seq_id_doenca.NEXTVAL);

-- Inserir dados do especialista em T_MDV_MEDIDAS
INSERT INTO T_MDV_MEDIDAS (ds_medida, nm_remedio, ds_remedio ,id_doenca)
VALUES ('Terapia cognitivo-comportamental', 'ansiolíticos', 'Também são chamados de calmantes, como resultado de sua ação tranquilizante.' ,seq_id_doenca.CURRVAL );

-- Inserir dados do especialista em T_MDV_CONTATO
INSERT INTO T_MDV_CONTATO (tp_contato, nm_email, id_usuario)
VALUES ('Email', 'globo@outlook.com', seq_id_usuario.CURRVAL);
-----------------------------------------------------------------------------------------------------------------------------
//Decimo Especialista

-- Inserir dados do especialista em T_MDV_REGISTRO
INSERT INTO T_MDV_REGISTRO (id_usuario, nm_usuario, nm_senha)
VALUES (seq_id_usuario.NEXTVAL, 'Francielly Menezes', 'volei');

-- Inserir dados do especialista em T_MDV_REGISTRO_ESPECIALISTA
INSERT INTO T_MDV_REGISTRO_ESPECIALISTA (id_usuario, nm_usuario, nm_senha, nr_crm)
VALUES (seq_id_usuario.CURRVAL, 'Francielly Menezes', 'volei', '123459');

-- Inserir dados do especialista em T_MDV_DOENCAS
INSERT INTO T_MDV_DOENCAS (id_usuario, nm_doenca, tp_doenca, fx_etaria, ds_doenca, id_doenca)
VALUES (seq_id_usuario.CURRVAL, 'Câncer de Pulmão', 'Oncológica', 'Adultos', 'Formação de tumores nos pulmões.', seq_id_doenca.NEXTVAL);

-- Inserir dados do especialista em T_MDV_MEDIDAS
INSERT INTO T_MDV_MEDIDAS (nm_vacina, id_vacina, ds_medida, id_doenca)
VALUES ('Vacinação contra o HPV', seq_id_vacina.NEXTVAL, ' Tratamentos como quimioterapia, radioterapia, cirurgia.', seq_id_doenca.CURRVAL );

-- Inserir dados do especialista em T_MDV_CONTATO
INSERT INTO T_MDV_CONTATO (tp_contato, nm_email, id_usuario)
VALUES ('Email', 'haikyuu@gmail.com', seq_id_usuario.CURRVAL);

----------------------------------------------------------------------------------------------------------------------------
//DQL
-----------------------------------------------------------------------------------------------------------------------------
/*

*/
-------------------------------------------------------------------------------------------------------------------------------


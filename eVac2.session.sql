
-- @block 
CREATE TABLE cidadao(
    cpf VARCHAR(11) NOT NULL,
    nome VARCHAR(50) NOT NULL,
    municipio VARCHAR(30) NOT NULL,
    data_nasc DATE NOT NULL,

    PRIMARY KEY (cpf)
);

-- @block 
CREATE TABLE contato(
    cpf VARCHAR(11) NOT NULL,
    tel_celular VARCHAR(11) NOT NULL UNIQUE,
    tel_fixo VARCHAR(10),
    email VARCHAR(35),

    PRIMARY KEY (cpf, tel_celular),

    CONSTRAINT FK_CidadaoContato
    FOREIGN KEY (cpf) REFERENCES Cidadao(cpf)
    ON DELETE CASCADE
);


-- @block 
CREATE TABLE historico_vac(
    cpf_cidadao VARCHAR(11) NOT NULL,
    cod_frasco VARCHAR(8) NOT NULL,
    cod_func VARCHAR(6) NOT NULL,
    prim_dose BOOLEAN NOT NULL,
    data_aplic_prim DATE NOT NULL,
    seg_dose BOOLEAN,
    data_aplic_seg DATE,


    PRIMARY KEY (cpf_cidadao, cod_frasco),

    CONSTRAINT FK_HistCidadao
    FOREIGN KEY (cpf_cidadao) 
    REFERENCES Cidadao(cpf),

    CONSTRAINT FK_HistFrasco
    FOREIGN KEY (cod_frasco) 
    REFERENCES frasco(cod_frasco)
    ON DELETE RESTRICT,

    CONSTRAINT FK_HistFunc
    FOREIGN KEY (cod_func) 
    REFERENCES funcionario(cod_func)
);

-- @block 
CREATE TABLE frasco(
    cod_frasco VARCHAR(8),
    cod_vacina VARCHAR(6),
    lote VARCHAR(4) NOT NULL,

    PRIMARY KEY (cod_frasco),

    CONSTRAINT FK_FrascoVacina
    FOREIGN KEY (cod_vacina)
    REFERENCES vacina(cod_vacina)
);


-- @BLOCK
CREATE TABLE vacina(
    cod_vacina VARCHAR(6),
    nome VARCHAR(20) NOT NULL,
    produtor VARCHAR(40) NOT NULL,
    trata_doenca VARCHAR(30) NOT NULL,

    PRIMARY KEY (cod_vacina)
);

-- @BLOCK
CREATE TABLE armazena(
    cod_posto VARCHAR(6),
    cod_vacina VARCHAR(6),
    estoque BIGINT NOT NULL,

    PRIMARY KEY (cod_posto, cod_vacina),

    CONSTRAINT FK_ArmazenaVacina
    FOREIGN KEY (cod_vacina)
    REFERENCES vacina(cod_vacina),

    CONSTRAINT FK_ArmazenaPosto
    FOREIGN KEY (cod_posto)
    REFERENCES posto(cod_posto)
);

-- @BLOCK
CREATE TABLE posto(
    cod_posto VARCHAR(6),
    nome VARCHAR(40) NOT NULL,
    municipio VARCHAR(30) NOT NULL,

    PRIMARY KEY (cod_posto)
);

--@BLOCK
CREATE TABLE funcionario(
    cod_func VARCHAR(6),
    nome VARCHAR(50) NOT NULL,
    cod_posto VARCHAR(6),

    PRIMARY KEY (cod_func),

    CONSTRAINT FK_FuncPosto
    FOREIGN KEY (cod_posto)
    REFERENCES posto(cod_posto)
    ON DELETE SET NULL
); 





--@block
insert into cidadao(
    cpf, nome, municipio, data_nasc
) VALUES (
    '12365478989',
    'Fulano da Silva',
    'Icaraí',
    '1895-01-05'
);

--@block
insert into contato(
    cpf, tel_celular, tel_fixo, email
) VALUES (
    '12365478989',
    '21985633211',
    '2136988521',
    'fulano@gmail.com'
);

--@block
insert into historico_vac(
    cpf_cidadao, cod_frasco, cod_func, prim_dose, data_aplic_prim, seg_dose, data_aplic_seg
) VALUES (
    '12365478989',
    'A4HM897H',
    'AHSH56',
    true,
    '2021-01-12',
    null,
    null
    
);

--@BLOCK
insert into vacina
(cod_vacina, nome, produtor, trata_doenca
) values (
    'JI9O8U',
    'Coronavac',
    'Butantan',
    'Coronavírus'
);

--@BLOCK
INSERT INTO frasco
(cod_frasco, cod_vacina, lote) VALUES (
    'A4HM897H',
    'JI9O8U',
    'I43O'
);




--@BLOCK
INSERT INTO posto
(cod_posto, nome, municipio) VALUES (
    'A4HMDH',
    'Posto Nelson Mandela',
    'Icaraí'
);

--@block
INSERT INTO armazena
(cod_posto, cod_vacina, estoque) VALUES (
    'A4HMDH',
    'JI9O8U',
    15000
);

--@block
INSERT INTO funcionario
(cod_func, nome, cod_posto) VALUES (
    'AHSH56',
    'Ciclano Lopes',
    'A4HMDH'
);



--@block
SELECT * FROM cidadao;

--@block
select * from historico_vac;

-- @BLOCK
SELECT * FROM contato;

--@BLOCK
SELECT * FROM vacina;

--@block
SELECT * FROM frasco;

--@block
SELECT * FROM posto;

--@block
SELECT * FROM armazena;

--@block
SELECT * FROM funcionario;
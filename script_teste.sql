-- Criando o banco no mysql workbench

CREATE DATABASE Futebol;
use Futebol;

CREATE TABLE Jogador (
ID_jogador INTEGER PRIMARY KEY NOT NULL,
nome_jogador VARCHAR(30),
idade_jogador INTEGER
);

CREATE TABLE Selecao (
ID_selecao INTEGER PRIMARY KEY NOT NULL,
continente_selecao VARCHAR(20),
nome_selecao VARCHAR(20)
);

CREATE TABLE Selecao_Base (
ID_selecao_base INTEGER PRIMARY KEY NOT NULL,
nome_selecao_base VARCHAR(20),
continente_selecao_base VARCHAR(15)
);

CREATE TABLE Titulo (
ID_titulo INTEGER PRIMARY KEY NOT NULL,
nome_titulo VARCHAR(30),
ano_titulo INTEGER
);

CREATE TABLE Clube_Mais_ClubeBase (
orcamento_clube_base DECIMAL(20),
ID_clube_base INTEGER,
nome_clube_base VARCHAR(10),
ID_clube INTEGER,
ano_fundacao_clube INTEGER,
nome_clube VARCHAR(20),
orcamento_clube DECIMAL(20),
nome_estadio VARCHAR(10),
PRIMARY KEY(ID_clube_base,ID_clube)
);

CREATE TABLE Clube_ClubeBase (
ID_clube_base INTEGER,
ID_clube INTEGER,
FOREIGN KEY(ID_clube_base, ID_clube) REFERENCES Clube_Mais_ClubeBase (ID_clube_base,ID_clube)
);

CREATE TABLE Empresa (
ID_empresa INTEGER PRIMARY KEY NOT NULL,
CNPJ_empresa INTEGER,
nome_empresa VARCHAR(20),
valor_patrocinio VARCHAR(10),
tempo_contrato VARCHAR(10)
);

CREATE TABLE Campeonato_Empresa (
ID_campeonato INTEGER,
ID_empresa INTEGER,
FOREIGN KEY(ID_empresa) REFERENCES Empresa (ID_empresa)
);

CREATE TABLE Campeonato (
ID_campeonato INTEGER PRIMARY KEY NOT NULL,
nome_campeonato VARCHAR(20),
campeao VARCHAR(20),
nome_vice_campeao VARCHAR(20)
);

CREATE TABLE posicao_jogador (
posicao_jogador_PK INTEGER PRIMARY KEY NOT NULL,
posicao_jogador VARCHAR(20),
ID_jogador_FK INTEGER,
FOREIGN KEY(ID_jogador_FK) REFERENCES Jogador (ID_jogador)
);

CREATE TABLE endereco_clube (
endereco_clube_PK INTEGER PRIMARY KEY NOT NULL,
numero INTEGER,
bairro VARCHAR(20),
cidade VARCHAR(20),
rua VARCHAR(30),
ID_clube_FK INTEGER
);

CREATE TABLE Gerencia (
ID_clube INTEGER,
possui_ID_clube INTEGER
);

CREATE TABLE atua (
ID_jogador INTEGER,
ID_clube_base INTEGER,
ID_clube INTEGER,
ID_selecao INTEGER,
PRIMARY KEY(ID_jogador,ID_clube_base,ID_clube,ID_selecao)
);

CREATE TABLE Possui (
ID_selecao_base INTEGER,
ID_titulo INTEGER,
ID_selecao INTEGER,
PRIMARY KEY(ID_selecao_base,ID_titulo,ID_selecao)
);

CREATE TABLE Participa (
ID_campeonato INTEGER,
FOREIGN KEY(ID_campeonato) REFERENCES Campeonato (ID_campeonato)
);


-- Populando o banco 


INSERT INTO Campeonato (nome_campeonato, ID_campeonato, campeao, nome_vice_campeao)
VALUES ('velit', 13205, 'North Ansel', 'North Elsa');
INSERT INTO Campeonato (nome_campeonato, ID_campeonato, campeao, nome_vice_campeao)
VALUES ('harum', 31214780, 'South Eldafurt', 'Forrestview');
INSERT INTO Campeonato (nome_campeonato, ID_campeonato, campeao, nome_vice_campeao)
VALUES ('autem', 67662579, 'Rodrigostad', 'Aaronview');

INSERT INTO Campeonato_Empresa (ID_campeonato, ID_empresa) 
VALUES(34567429578, 3468432);
INSERT INTO Campeonato_Empresa (ID_campeonato, ID_empresa) 
VALUES(94567456784, 5436854);
INSERT INTO Campeonato_Empresa (ID_campeonato, ID_empresa) 
VALUES(44367429558, 6135685);

INSERT INTO Clube_ClubeBase (ID_clube_base, ID_clube) 
VALUES(42267, 23658);
INSERT INTO Clube_ClubeBase (ID_clube_base, ID_clube) 
VALUES(24573, 95733);
INSERT INTO Clube_ClubeBase (ID_clube_base, ID_clube) 
VALUES(10101, 59302);

INSERT INTO Clube_Mais_ClubeBase (orcamento_clube_base, ID_clube_base, nome_clube_base, ID_clube, ano_fundacao_clube, nome_clube, orcamento_clube, nome_estadio) 
VALUES ('8.008.700.', 03578, 'East Jerro', 44323, 1989, 'Brookstad', '1.000.000', 'Arizona Stadium');
INSERT INTO Clube_Mais_ClubeBase (orcamento_clube_base, ID_clube_base, nome_clube_base, ID_clube, ano_fundacao_clube, nome_clube, orcamento_clube, nome_estadio) 
VALUES ('8.338.897', 15432, 'Janiyaboro', 27654, 1967, 'Rosenbaumborough', '9.651.000', 'District o Stadium');
INSERT INTO Clube_Mais_ClubeBase (orcamento_clube_base, ID_clube_base, nome_clube_base, ID_clube, ano_fundacao_clube, nome_clube, orcamento_clube, nome_estadio) 
VALUES ('9.690.830', 25432, 'Erlingside', 57543, 1989, 'Windlerburgh', '31.779.641', 'District o Stadium');
INSERT INTO Clube_Mais_ClubeBase (orcamento_clube_base, ID_clube_base, nome_clube_base, ID_clube, ano_fundacao_clube, nome_clube, orcamento_clube, nome_estadio) 
VALUES ('2.292.150', 39876, 'Simonissta', 19877, 1999, 'South Oniemouth', '9.709.090', 'Michigan Stadium');
INSERT INTO Clube_Mais_ClubeBase (orcamento_clube_base, ID_clube_base, nome_clube_base, ID_clube, ano_fundacao_clube, nome_clube, orcamento_clube, nome_estadio) 
VALUES ('4.703.200', 39877, 'East Rapha', 79876, 1890, 'Gulgowskifort', '7.900.000', 'California Stadium');
INSERT INTO Clube_Mais_ClubeBase (orcamento_clube_base, ID_clube_base, nome_clube_base, ID_clube, ano_fundacao_clube, nome_clube, orcamento_clube, nome_estadio) 
VALUES ('300.000', 49887, 'Port Cesar', 60987, 2000, 'Maximilliaville', '3.983.000', 'Iowa Stadium');
INSERT INTO Clube_Mais_ClubeBase (orcamento_clube_base, ID_clube_base, nome_clube_base, ID_clube, ano_fundacao_clube, nome_clube, orcamento_clube, nome_estadio) 
VALUES ('473.060', 40987, 'South Gius', 85329, 2002, 'Lake Albertha', '11.412.103', 'Connectict Stadium');
INSERT INTO Clube_Mais_ClubeBase (orcamento_clube_base, ID_clube_base, nome_clube_base, ID_clube, ano_fundacao_clube, nome_clube, orcamento_clube, nome_estadio) 
VALUES ('3.875.647', 44325, 'Bashiriant', 03464, 2006, 'West Jillian', '18.000.000', 'Kentucky Stadium');
INSERT INTO Clube_Mais_ClubeBase (orcamento_clube_base, ID_clube_base, nome_clube_base, ID_clube, ano_fundacao_clube, nome_clube, orcamento_clube, nome_estadio) 
VALUES ('672.000', 58643, 'West Lazar', 44449, 2006, 'Spinkaberg', '323.365.000', 'Massachuse Stadium');
INSERT INTO Clube_Mais_ClubeBase (orcamento_clube_base, ID_clube_base, nome_clube_base, ID_clube, ano_fundacao_clube, nome_clube, orcamento_clube, nome_estadio) 
VALUES ('977.000', 63333, 'Sybletown', 83564, 2001, 'Zboncakmouth', '96.000.000', 'Alabama Stadium');
INSERT INTO Clube_Mais_ClubeBase (orcamento_clube_base, ID_clube_base, nome_clube_base, ID_clube, ano_fundacao_clube, nome_clube, orcamento_clube, nome_estadio) 
VALUES ('195.697', 64444, 'Glenniesta', 43229, 2001, 'Rohanland', '32.000.000', 'Florida Stadium');
INSERT INTO Clube_Mais_ClubeBase (orcamento_clube_base, ID_clube_base, nome_clube_base, ID_clube, ano_fundacao_clube, nome_clube, orcamento_clube, nome_estadio) 
VALUES ('283.131', 00007, 'Ratkemouth', 00001, 1996, 'West Marty', '23.314.134', 'NewYork Stadium');
INSERT INTO Clube_Mais_ClubeBase (orcamento_clube_base, ID_clube_base, nome_clube_base, ID_clube, ano_fundacao_clube, nome_clube, orcamento_clube, nome_estadio) 
VALUES ('748.498', 52557, 'Rohanchest', 42241, 1994, 'Port Mollyburgh', '8.000.000', 'Idaho Stadium');
INSERT INTO Clube_Mais_ClubeBase (orcamento_clube_base, ID_clube_base, nome_clube_base, ID_clube, ano_fundacao_clube, nome_clube, orcamento_clube, nome_estadio) 
VALUES ('2.456.300', 49268, 'Kamrynland', 47062, 2004, 'West Verlie', '100.000.000', 'Mississippi Stadium');
INSERT INTO Clube_Mais_ClubeBase (orcamento_clube_base, ID_clube_base, nome_clube_base, ID_clube, ano_fundacao_clube, nome_clube, orcamento_clube, nome_estadio) 
VALUES ('1.643.000', 13418, 'North Adol', 11113, 1997, 'New Titus', '8.691.161', 'Georgia Stadium');

INSERT INTO Empresa (ID_empresa, CNPJ_empresa, nome_empresa, valor_patrocinio, tempo_contrato) 
VALUES (0954, '23570262000197', 'Tremblay Inc', '3.082.200', '2');
INSERT INTO Empresa (ID_empresa, CNPJ_empresa, nome_empresa, valor_patrocinio, tempo_contrato) 
VALUES (1322, '25560962000196', 'Cruickshank-Cronin', '17.363.500.3', '2');
INSERT INTO Empresa (ID_empresa, CNPJ_empresa, nome_empresa, valor_patrocinio, tempo_contrato) 
VALUES (2643, '53599222003467', 'Champlin Ltd', '20.063.200.8', '4');
INSERT INTO Empresa (ID_empresa, CNPJ_empresa, nome_empresa, valor_patrocinio, tempo_contrato) 
VALUES (3564, '12789211003383', 'Dietrich, Wiza and S', '11.800.000', '1');
INSERT INTO Empresa (ID_empresa, CNPJ_empresa, nome_empresa, valor_patrocinio, tempo_contrato) 
VALUES (4765, '09090122022222', 'Will-Daugherty', '245.822.327', '6');
INSERT INTO Empresa (ID_empresa, CNPJ_empresa, nome_empresa, valor_patrocinio, tempo_contrato) 
VALUES (5876, '01111221011111', 'Haley Ltd', '22.959.609', '3');

INSERT INTO Gerencia (ID_clube, possui_ID_clube) 
VALUES (090, 'SIM');
INSERT INTO Gerencia (ID_clube, possui_ID_clube) 
VALUES (000, 'NÃO');
INSERT INTO Gerencia (ID_clube, possui_ID_clube) 
VALUES (122, 'SIM');

INSERT INTO Jogador (nome_jogador, ID_jogador, idade_jogador) 
VALUES ('Misael O. Hara', 09876, 28);
INSERT INTO Jogador (nome_jogador, ID_jogador, idade_jogador) 
VALUES ('Madyson Trantow', 80909, 29);
INSERT INTO Jogador (nome_jogador, ID_jogador, idade_jogador) 
VALUES ('Merl Becker III', 11987, 21);
INSERT INTO Jogador (nome_jogador, ID_jogador, idade_jogador) 
VALUES ('Arvid Maggio DVM', 19987, 31);
INSERT INTO Jogador (nome_jogador, ID_jogador, idade_jogador) 
VALUES ('Jo Kautzer Jr.', 50877, 40);
INSERT INTO Jogador (nome_jogador, ID_jogador, idade_jogador) 
VALUES ('Addison Skiles', 76432, 32);
INSERT INTO Jogador (nome_jogador, ID_jogador, idade_jogador) 
VALUES ('Hazle Jast DDS', 53322, 42);
INSERT INTO Jogador (nome_jogador, ID_jogador, idade_jogador) 
VALUES ('Dr. Anika Daugherty II', 81902, 23);
INSERT INTO Jogador (nome_jogador, ID_jogador, idade_jogador) 
VALUES ('Jarod Von', 19625, 23);
INSERT INTO Jogador (nome_jogador, ID_jogador, idade_jogador) 
VALUES ('Jayde Morar', 22401, 18);
INSERT INTO Jogador (nome_jogador, ID_jogador, idade_jogador) 
VALUES ('Nick Wehner', 31716, 28);
INSERT INTO Jogador (nome_jogador, ID_jogador, idade_jogador) 
VALUES ('Judy McGlynn PhD', 60830, 42);

INSERT INTO Participa (ID_campeonato) 
VALUES (03954);
INSERT INTO Participa (ID_campeonato) 
VALUES (09234);
INSERT INTO Participa (ID_campeonato) 
VALUES (08754);
INSERT INTO Participa (ID_campeonato) 
VALUES (13454);

INSERT INTO Possui (ID_selecao_base, ID_titulo, ID_selecao) 
VALUES (2123, 40, 12354);
INSERT INTO Possui (ID_selecao_base, ID_titulo, ID_selecao) 
VALUES (3579, 12, 98412);
INSERT INTO Possui (ID_selecao_base, ID_titulo, ID_selecao) 
VALUES (2123, 55, 11354);
INSERT INTO Possui (ID_selecao_base, ID_titulo, ID_selecao) 
VALUES (2123, 34, 99874);

INSERT INTO Selecao (continente_selecao, nome_selecao, ID_selecao) 
VALUES ('Oceania', 'Australia', 232);
INSERT INTO Selecao (continente_selecao, nome_selecao, ID_selecao) 
VALUES ('Europa', 'Alemanha', 025);
INSERT INTO Selecao (continente_selecao, nome_selecao, ID_selecao) 
VALUES ('Africa', 'Nigeria', 007);
INSERT INTO Selecao (continente_selecao, nome_selecao, ID_selecao) 
VALUES ('America do Sul', 'Brasil', 008);
INSERT INTO Selecao (continente_selecao, nome_selecao, ID_selecao) 
VALUES ('America do Norte', 'Canada', 009);

INSERT INTO Selecao_Base (ID_selecao_base, nome_selecao_base, continente_selecao_base) 
VALUES (001, 'Espanha', 'Europa');
INSERT INTO Selecao_Base (ID_selecao_base, nome_selecao_base, continente_selecao_base) 
VALUES (002, 'Quenia', 'Africa');
INSERT INTO Selecao_Base (ID_selecao_base, nome_selecao_base, continente_selecao_base) 
VALUES (003, 'França', 'Europa');
INSERT INTO Selecao_Base (ID_selecao_base, nome_selecao_base, continente_selecao_base) 
VALUES (004, 'Mongolia', 'Africa');
INSERT INTO Selecao_Base (ID_selecao_base, nome_selecao_base, continente_selecao_base) 
VALUES (005, 'Holanda', 'Europa');

INSERT INTO Titulo (ID_titulo, nome_titulo, ano_titulo) 
VALUES (10002, 'Roderick Schowalter', 2012);
INSERT INTO Titulo (ID_titulo, nome_titulo, ano_titulo) 
VALUES (10004, 'Dr. Priscilla Littel', 2000);
INSERT INTO Titulo (ID_titulo, nome_titulo, ano_titulo) 
VALUES (10007, 'Tavares Boyer MD', 1984);
INSERT INTO Titulo (ID_titulo, nome_titulo, ano_titulo) 
VALUES (10008, 'Sean Blanda', 2003);
INSERT INTO Titulo (ID_titulo, nome_titulo, ano_titulo) 
VALUES (10009, 'Dr. Ima Stark Sr.', 1996);

INSERT INTO atua (ID_jogador, ID_clube_base, ID_clube, ID_selecao) 
VALUES (09876, 24573, 95733, 007);
INSERT INTO atua (ID_jogador, ID_clube_base, ID_clube, ID_selecao) 
VALUES (19987, 10101, 59302, 025);
INSERT INTO atua (ID_jogador, ID_clube_base, ID_clube, ID_selecao) 
VALUES (31716, 42267, 23658, 232);

INSERT INTO endereco_clube (endereco_clube_PK, numero, bairro, cidade, rua, ID_clube_FK) 
VALUES (0, 5218, 'Alto 12 de Fevereiro', 'Recife', 'Rua Padre Anchieta', 128);
INSERT INTO endereco_clube (endereco_clube_PK, numero, bairro, cidade, rua, ID_clube_FK) 
VALUES (1, 5543, 'Buriti', 'Rio de Janeiro', 'Rua Avenida', 138);
INSERT INTO endereco_clube (endereco_clube_PK, numero, bairro, cidade, rua, ID_clube_FK) 
VALUES (2, 5444, 'Ipiranga', 'Macapa', 'Rua das palmeiras', 148);
INSERT INTO endereco_clube (endereco_clube_PK, numero, bairro, cidade, rua, ID_clube_FK) 
VALUES (3, 5333, 'São Lázaro', 'Belo Horizonte', 'Rua Hadley', 158);
INSERT INTO endereco_clube (endereco_clube_PK, numero, bairro, cidade, rua, ID_clube_FK) 
VALUES (4, 3332, 'Matapaca ', 'Belo Horizonte', 'Rua Branch', 168);
INSERT INTO endereco_clube (endereco_clube_PK, numero, bairro, cidade, rua, ID_clube_FK) 
VALUES (5, 4566, 'Barreto', 'Recife', 'Rua dos repositórios', 178);
INSERT INTO endereco_clube (endereco_clube_PK, numero, bairro, cidade, rua, ID_clube_FK) 
VALUES (6, 5554, 'Viçoso Jardim', 'Maceio', 'Rua Gitignore', 188);
INSERT INTO endereco_clube (endereco_clube_PK, numero, bairro, cidade, rua, ID_clube_FK) 
VALUES (7, 1222, 'Jurujuba', 'Rio de Janeiro', 'Rua das maçãs', 198);
INSERT INTO endereco_clube (endereco_clube_PK, numero, bairro, cidade, rua, ID_clube_FK) 
VALUES (8, 1223, 'Gragoatá', 'São Paulo', 'Rua das bananas', 228);
INSERT INTO endereco_clube (endereco_clube_PK, numero, bairro, cidade, rua, ID_clube_FK) 
VALUES (9, 9583, 'Sepetiba', 'Santos', 'Rua Domingos Ferreira', 238);
INSERT INTO endereco_clube (endereco_clube_PK, numero, bairro, cidade, rua, ID_clube_FK) 
VALUES (10, 0284, 'Andaraí', 'Niterói', 'Rua Nantes', 248);
INSERT INTO endereco_clube (endereco_clube_PK, numero, bairro, cidade, rua, ID_clube_FK) 
VALUES (11, 9284, 'Tijuca', 'Porto Alegre', 'Avenida Boa Viagem', 218);
INSERT INTO endereco_clube (endereco_clube_PK, numero, bairro, cidade, rua, ID_clube_FK) 
VALUES (12, 9483, 'Tomás Coelho', 'Manaus', 'Rua Hermandos', 208);
INSERT INTO endereco_clube (endereco_clube_PK, numero, bairro, cidade, rua, ID_clube_FK) 
VALUES (13, 1234, 'Anchieta', 'Rio Branco', 'Rua 25 de Outubro', 298);

INSERT INTO posicao_jogador (posicao_jogador_PK, posicao_jogador, ID_jogador_FK) 
VALUES (0, 'Goleiro', 90);
INSERT INTO posicao_jogador (posicao_jogador_PK, posicao_jogador, ID_jogador_FK) 
VALUES (1, 'Defensor', 99);
INSERT INTO posicao_jogador (posicao_jogador_PK, posicao_jogador, ID_jogador_FK) 
VALUES (2, 'Meio-Campo', 09);
INSERT INTO posicao_jogador (posicao_jogador_PK, posicao_jogador, ID_jogador_FK) 
VALUES (3, 'Atacante', 19);

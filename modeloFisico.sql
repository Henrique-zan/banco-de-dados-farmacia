create database farmacia;
use farmacia;
create table clientes(
cpf varchar(11) not null primary key,
nome varchar(40) not null,
data_nasc date not null,
endereco varchar(100) not null,
contato varchar(60) not null
);
create table fornecedores(
cnpj varchar(15) not null primary key,
nome varchar(50) not null,
endereco varchar(100) not null,
contato varchar(40)
);
create table funcionarios(
nome varchar(40) not null,
cpf varchar(11) not null primary key,
numero_carteira varchar(20) not null,
data_nasc date not null,
contato varchar(60),
salario float not null
);
create table produtos(
id integer auto_increment not null primary key,
nome varchar(30) not null,
tarja char,
setor varchar(30),
data_lote date not null,
estoque int not null,
valor float not null
);
create table vendas(
id integer auto_increment not null primary key,
data_venda date not null,
id_produtos integer not null,
cpf_clientes varchar(11) not null,
cpf_funcionarios varchar(11) not null,
valor float not null,
foreign key(id_produtos) references produtos(id),
foreign key (cpf_clientes) references clientes(cpf),
foreign key(cpf_funcionarios) references funcionarios(cpf)
);
create table gerente(
cpf_funcionarios varchar(11) key not null,
data_inicio date not null,
login varchar(30) not null,
senha varchar(20) not null,
foreign key(cpf_funcionarios) references funcionarios(cpf)
);
create table farmaceutico(
cpf_funcionarios varchar(11) primary key not null,
data_inicio date not null,
crf integer not null,
foreign key(cpf_funcionarios)references funcionarios(cpf)
);
create table entrega(
id integer auto_increment not null primary key,
data_entrega date not null,
cnpj_fornecedor varchar(15) not null,
foreign key(cnpj_fornecedor)references fornecedores(cnpj)
);
create table produtos_fornecedor(
id_produto integer not null,
cnpj_fornecedor varchar(15) not null,
foreign key (id_produto) references produtos(id),
foreign key (cnpj_fornecedor) references fornecedores(cnpj)
);
create table produtos_entrega(
id_entrega integer not null,
id_produtos integer not null,
foreign key (id_produtos) references produtos(id),
foreign key (id_entrega) references entrega(id)
);
create table entrega_fornecedor(
id_entrega integer not null,
cnpj_fornecedor varchar(15) not null,
foreign key (cnpj_fornecedor) references fornecedores(cnpj),
foreign key (id_entrega) references entrega(id)
);
insert into farmacia.clientes (cpf, nome, data_nasc, endereco, contato)
values ('05212515215', 'Junior Da Silva', '2004-08-18', ' Avenida Dom João 82,
apto 104', 'juniordasilva@gmail.com'),
('01545832118', 'Pedro Teixeira', '1987-04-28', ' Rua dos Alfeneiros
4', 'pedrinho87@gmail.com'),
('12548696512', 'Otavio Júnior Martins', '2003-05-29', ' Estrada do
óleo KM 1.5', 'tavindasgameplays@gmail.com'),
('32159124558', 'Erik Avelino Sousa', '1925-07-29', ' Rua Sanchez 104
apto 907', 'erikmontage@gmail.com');
insert into farmacia.fornecedores (cnpj, nome, endereco, contato)
values ('00000186494562', 'Coca-cola', 'Rua do Doce, 2001', '0800-1234'),
('00000186746962', 'Google', 'Rua Coronel Jojo, 2266', '0800-5664'),
('00000148523562', 'Vikings Store', 'Avenida Vava, 44', '0800-6669'),
('00000186448995', 'BoraBora', 'Rua Fabel Corvel, 8821', '0800-9985');
insert into farmacia.funcionarios(nome, cpf, numero_carteira, data_nasc, contato,
salario)
values ('Jorge dos Santos', '11122233344','1234567', '2002-03-
18','jorge@gmail.com', '1200.00'),
('Joao Oliveira', '12312312300','1111111', '2001-01-
22','joao@gmail.com', '1250.00'),
('Ana Beatriz Silva', '22222222222','2222222', '2003-03-
01','ana@gmail.com', '1300.00'),
('Pedro Coelho', '33333333333','3333333', '2000-09-
18','pedro@gmail.com', '1350.00');
insert into farmacia.produtos (nome, tarja, setor, data_lote, estoque, valor)
values ('Butalbital', '1', 'Prateleira 13', '2020-11-19', '600', '53.10'),
('Cefazolina', '2', 'Prateleira 2', '2020-09-10', '452', '26.40'),
('Prazosina', '1', 'Prateleira 8', '2022-09-12', '384', '84.90'),
('Voriconazol', '3', 'Prateleira 10', '2021-10-13', '521', '12.30');
insert into farmacia.vendas(data_venda, valor)
values ('2017-09-22', '280.00'),
('2018-08-21', '300.00'),
('2019-07-20', '400.00'),
('2020-06-19', '500.00');
insert into farmacia.gerente(data_inicio, login, senha)
values ('2022-08-12', 'JoaoOliveira', '123456'),
('2022-08-12', 'Aninha2003', 'A22012003'),
('2022-08-12', 'PedroC', '120520'),
('2022-08-12', 'Jose1033', '120238');
insert into farmacia.farmaceutico(data_inicio, crf)
values ('2010-09-22', '11111'),
('2011-08-21', '22222'),
('2012-07-20', '33333'),
('2013-06-19', '44444');
insert into farmacia.entrega (data_entrega)
values ('2020-11-10'),
('2021-07-25'),
('2022-05-30'),
('2020-02-14');
SELECT * FROM farmacia.funcionarios;
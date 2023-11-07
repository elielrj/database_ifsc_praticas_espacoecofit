 drop database espacoecofit;
create database espacoecofit;
use espacoecofit;
/*
create table pais
(
id int primary key auto_increment,
nome varchar(100),
name varchar(100),
status boolean not null
);

create table regiao(
  id int primary key auto_increment,
  nome 	varchar(50) not null
);

create table estado
(
id int primary key auto_increment,
nome varchar(200), 
sigla varchar(2),
paisid int,
regiaoid int,
status boolean,
foreign key (paisid) references pais(id),
foreign key (regiaoid) references regiao(id)
);
*/
create table cidade
(
id int primary key auto_increment,
nome varchar(100),
-- estadoid int,
status boolean
-- foreign key (estadoid) references estado(id)
);

create table bairro
(
id int primary key auto_increment,
nome varchar(30),
status boolean,
cidadeid int,
foreign key(cidadeid) references cidade(id)
);

create table endereco
(
id int primary key auto_increment,
logradouro varchar(100),
numero varchar(100),
bairroid int,
cep varchar(11),
status boolean,
foreign key (bairroid) references bairro(id)
);

-- drop table fornecedor;
create table fornecedor
(
id int primary key auto_increment,
razaosocial varchar(100),
cnpj  varchar(18),
inscricaoestadual varchar(18),
telefone1 varchar(16),
telefone2 varchar(16),
email varchar(100),
complemento varchar(100),
observacao varchar(100),
status boolean,
enderecoid int,
foreign key (enderecoid) references endereco(id)
);

create table pessoafisica
(
id int primary key auto_increment,
nome varchar(100),
rg  varchar(12),
cpf varchar(14),
datanascimento varchar(10),
complemento varchar(100),
telefone1 varchar(16),
telefone2 varchar(16),
email varchar(100),
observacao varchar(100),
status boolean,
enderecoid int,
tipo enum("aluno","personal"),
foreign key (enderecoid) references endereco(id)
);

create table compra
(
id int primary key auto_increment,
datacompra varchar(10),
hora varchar(8),
datavencimento varchar(10),
observacao varchar(100),
valordesconto float,
valortotal float,
status boolean,
fornecedorid int,
usercaixa varchar(50),
foreign key (fornecedorid) references fornecedor(id)
);

create table venda
(
id int primary key auto_increment,
datavenda varchar(10),
hora varchar(8),
datavencimento varchar(10),
observacao varchar(100),
valordesconto float,
valortotal float,
status boolean,
pessoafisicaid int,
usercaixa varchar(50),
foreign key (pessoafisicaid) references pessoaFisica(id)
);




create table produto
(
id int primary key auto_increment,
descricao varchar(60),
unidadedecompra varchar(3),
unidadedevenda varchar(3),
correlacaounidade varchar(3),
valor float,
codigodebarras varchar(13),
status boolean,
observacao varchar(100)
);

create table estoque
(
id int primary key auto_increment, 
produtoid int, 
quantidade int, 
foreign key (produtoid) references produto(id)
);

create table itemdecompra
(
id int primary key auto_increment,
quantidade int,
-- status boolean,
compraid int,
produtoid int,
subtotal float,
foreign key (produtoid) references produto(id),
foreign key (compraid) references compra(id)
);

create table itemdevenda
(
id int primary key auto_increment,
quantidade int,
-- status boolean,
vendaid int,
produtoid int,
subtotal float,
foreign key (produtoid) references produto(id),
foreign key (vendaid) references venda(id)
);


create table contaapagar
(
id int primary key auto_increment,
compraid int,
valor float,
status boolean,
foreign key (compraid) references compra(id)
);

-- drop table pagar;
create table pagar
(
id int primary key auto_increment,
datapagamento varchar(10),
hora varchar(8),
valordesconto float,
valoracrescimo float,
valorpago float,
observacao varchar(100),
contaapagarid int,
foreign key (contaapagarid) references contaapagar(id)
);

create table contaareceber
(
id int primary key auto_increment,
vendaid int,
valor float,
status boolean,
foreign key (vendaid) references venda(id)
);

-- drop table receber;
create table receber
(
id int primary key auto_increment,
datarecebimento varchar(10),
hora varchar(8),
valordesconto float,
valoracrescimo float,
valorrecebido float,
observacao varchar(100),
contasareceberid int,
foreign key (contasareceberid) references contaareceber(id)
);
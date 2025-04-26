create database dbempresa;

USE dbempresa;

create table tbusuarios(
 iduser int primary key,
 usuario varchar(50) not null,
 fone varchar(15),
 login varchar(15) not null unique, 
 senha varchar(15) not null,
 perfil varchar(20) not null
 );
 
 create table tbclientes(
 idcli int primary key auto_increment,
 endcli varchar(100),
 fonecli varchar(15) not null,
 emailcli varchar(50)
 );
  
create table tbos (
os int primary key auto_increment,
data_os timestamp default current_timestamp,
equipamento varchar(150) not null,
defeito varchar(150) not null,
servico varchar(150),
tecnico varchar(30),
valor decimal(10,2),
idcli int not null,
foreign key (idcli) references tbclientes(idcli)
); 
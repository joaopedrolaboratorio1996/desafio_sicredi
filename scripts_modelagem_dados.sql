-- Modelagem Do Banco De Dados Desafio Sicredi

-- Criação Banco De Dados --

create database base_desafio

-- Criação Das Tabelas -- 

-- Criação tabela associado
create table associado (  
                        id serial primary key,
                        nome varchar(100),
                        sobrenome varchar(100),
                        idade int, 
                         email varchar(100)
                       );
                      
-- Criação tabela conta 
create table conta (
                    id serial primary key,
                    tipo_conta varchar(100),
                    data_criacao timestamp,
                    id_associado int, 
                    foreign key (id_associado) references associado(id)
                   );              

-- Criação tabela cartao
create table cartao (
                     id serial primary key,
                     num_cartao bigint,
                     nom_impresso varchar(100),
                     id_conta int,
                     id_associado int,
                     foreign key (id_conta) references conta(id),
                     foreign key (id_associado) references associado(id)
                    );                

-- Criação Tabela movimento 
create table movimento (
                        id serial primary key,
                        vlr_transacao decimal(10,2),
                        des_transacao varchar(100),
                        data_movimento timestamp,
                        id_cartao int,
                        foreign key (id_cartao) references cartao(id)
                       );              
                  
-- Populando As Tabelas -- 
                      
-- Insert Tabela associado 
insert into associado (nome, sobrenome, idade, email) values
    ('João', 'Silva', 35, 'joao.silva@gmail.com'),
    ('Maria', 'Pereira', 28, 'maria.pereira@hotmail.com'),
    ('Carlos', 'Ferreira', 45, 'carlos.ferreira@gmail.com'),
    ('Ana', 'Rodrigues', 33, 'ana.rodrigues@outlook.com'),
    ('Miguel', 'Santos', 29, 'miguel.santos@outlook.com'),
    ('Isabel', 'Gomes', 38, 'isabel.gomes@gmail.com'),
    ('Ricardo', 'Almeida', 40, 'ricardo.almeida@hotmail.com'),
    ('Paula', 'Oliveira', 27, 'paula.oliveira@outlook.com'),
    ('Gustavo', 'Martins', 34, 'gustavo.martins@gmail.com'),
    ('Catarina', 'Fonseca', 31, 'catarina.fonseca@outlook.com'),
    ('Bruno', 'Sousa', 42, 'bruno.sousa@gmail.com'),
    ('Fernanda', 'Rocha', 39, 'fernanda.rocha@gmail.com'),
    ('Lucas', 'Moreira', 30, 'lucas.moreira@outlook.com'),
    ('Sofia', 'Carvalho', 36, 'sofia.carvalho@hotmail.com'),
    ('Alex', 'Pinto', 44, 'alex.pinto@gmail.com'),
    ('Luana', 'Correia', 32, 'luana.correia@outlook.com'),
    ('Pedro', 'Nunes', 41, 'pedro.nunes@hotmail.com'),
    ('Beatriz', 'Machado', 28, 'beatriz.machado@hotmail.com'),
    ('Eduardo', 'Gonçalves', 37, 'eduardo.goncalves@hotmail.com'),
    ('Aline', 'Dias', 33, 'aline.dias@hotmail.com');                      
                      
-- Insert Tabela conta 
insert into conta (tipo_conta, data_criacao, id_associado) values   
    ('Corrente', '2023-01-15', 1),  
    ('Poupança', '2023-02-20', 1),  
    ('Poupança', '2023-03-10', 2),  
    ('Corrente', '2023-03-22', 3),  
    ('Salário', '2023-04-05', 3),  
    ('Poupança', '2023-04-18', 4),  
    ('Corrente', '2023-05-02', 5),  
    ('Poupança', '2023-05-15', 6),  
    ('Corrente', '2023-06-01', 6),  
    ('Poupança', '2023-06-14', 7),  
    ('Corrente', '2023-07-05', 8),  
    ('Corrente', '2023-07-17', 9),  
    ('Poupança', '2023-08-02', 9),  
    ('Salário', '2023-08-20', 10),  
    ('Corrente', '2023-09-03', 11),  
    ('Poupança', '2023-09-18', 11),  
    ('Corrente', '2023-10-01', 12),  
    ('Corrente', '2023-10-16', 13),  
    ('Poupança', '2023-11-04', 14),  
    ('Salário', '2023-11-19', 14),  
    ('Corrente', '2023-12-01', 15),  
    ('Poupança', '2023-12-15', 16),  
    ('Corrente', '2023-12-30', 17),  
    ('Salário', '2023-12-02', 18),  
    ('Poupança', '2023-12-17', 19),  
    ('Corrente', '2023-12-31', 20);
    
-- Insert Tabela cartao
insert into cartao (num_cartao, nom_impresso, id_conta, id_associado) values
      (1234567890123456, 'João Silva Card', 1, 1),
      (2345678901234567, 'João Silva Card', 2, 1),
      (3456789012345678, 'Maria Pereira Card', 3, 2),
      (4567890123456789, 'Carlos Ferreira Card', 4, 3),
      (5678901234567890, 'Carlos Ferreira Card', 5, 3),
      (6789012345678901, 'Ana Rodrigues Card', 6, 4),
      (7890123456789012, 'Miguel Santos Card', 7, 5),
      (8901234567890123, 'Isabel Gomes Card', 8, 6),
      (9012345678901234, 'Isabel Gomes Card', 9, 6),
      (1234567890123450, 'Ricardo Almeida Card', 10, 7),
      (3456789012345670, 'Paula Oliveira Card', 11, 8),
      (4567890123456780, 'Gustavo Martins Card', 12, 9),
      (4567890123456785, 'Gustavo Martins Card', 13, 9),
      (5678901234567890, 'Catarina Fonseca Card', 14, 10),
      (6789012345678900, 'Bruno Sousa Card', 15, 11),
      (6789012345678900, 'Bruno Sousa Card', 16, 11),
      (7890123456789010, 'Fernanda Rocha Card', 17, 12),
      (8901234567890120, 'Lucas Moreira Card', 18, 13),
      (1234567890123451, 'Sofia Carvalho Card', 19, 14),
      (2345678901234561, 'Sofia Carvalho Card', 20, 14),
      (3456789012345671, 'Alex Pinto Card', 21, 15),
      (4567890123456781, 'Luana Correia Card', 22, 16),
      (5678901234567891, 'Pedro Nunes Card', 23, 17),
      (6789012345678902, 'Beatriz Machado Card', 24, 18),
      (7890123456789013, 'Eduardo Gonçalves Card', 25, 19),
      (8901234567890124, 'Aline Dias Card', 26, 20);
     
-- Insert Tabela movimento
insert into movimento (vlr_transacao, des_transacao, data_movimento, id_cartao) values
    (50.25, 'Compra de supermercado', '2023-01-10', 1),
    (35.60, 'Restaurante', '2023-02-05', 2),
    (120.00, 'Pagamento de conta de energia', '2023-03-15', 3),
    (20.75, 'Posto de gasolina', '2023-03-25', 4),
    (75.40, 'Compras online', '2023-04-08', 5),
    (45.00, 'Cinema', '2023-05-12', 6),
    (60.80, 'Restaurante', '2023-06-19', 7),
    (22.30, 'Farmácia', '2023-07-03', 8),
    (95.50, 'Compras online', '2023-07-14', 9),
    (17.20, 'Posto de gasolina', '2023-08-01', 10),
    (42.90, 'Restaurante', '2023-08-10', 11),
    (28.75, 'Supermercado', '2023-08-29', 12),
    (19.95, 'Cinema', '2023-09-02', 13),
    (88.60, 'Compras online', '2023-09-18', 14),
    (67.30, 'Restaurante', '2023-10-05', 15),
    (29.10, 'Posto de gasolina', '2023-10-19', 16),
    (39.75, 'Farmácia', '2023-11-11', 17),
    (23.45, 'Compras online', '2023-11-25', 18),
    (15.80, 'Cinema', '2023-12-04', 19),
    (51.20, 'Restaurante', '2023-12-16', 20),
    (36.90, 'Supermercado', '2023-12-29', 1),
    (18.70, 'Posto de gasolina', '2023-01-03', 2),
    (54.30, 'Restaurante', '2023-01-07', 3),
    (40.50, 'Compras online', '2023-02-12', 4),
    (30.10, 'Farmácia', '2023-02-24', 5),
    (79.20, 'Cinema', '2023-03-10', 6),
    (26.45, 'Posto de gasolina', '2023-03-22', 7),
    (37.80, 'Supermercado', '2023-04-05', 8),
    (62.15, 'Restaurante', '2023-05-08', 9),
    (47.90, 'Compras online', '2023-05-15', 10),
    (33.60, 'Farmácia', '2023-06-01', 11),
    (15.25, 'Cinema', '2023-06-14', 12),
    (22.70, 'Posto de gasolina', '2023-07-02', 13),
    (78.40, 'Restaurante', '2023-07-17', 14),
    (66.90, 'Supermercado', '2023-08-02', 15),
    (42.35, 'Compras online', '2023-08-20', 16),
    (49.60, 'Farmácia', '2023-09-03', 17),
    (13.75, 'Cinema', '2023-09-18', 18),
    (25.90, 'Posto de gasolina', '2023-10-01', 19),
    (73.20, 'Restaurante', '2023-10-16', 20);
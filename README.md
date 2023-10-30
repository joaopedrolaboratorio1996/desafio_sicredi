# Desafio SiCooperative LTDA
Repositório das informações do desafio

# Data Lake | ETL - SiCooperative LTDA

Este projeto tem como objetivo criar um mecanismo de tratamento de dados para a empresa SiCooperative LTDA, que oferece uma vasta gama de
soluções financeiras aos seus clientes. Este mecanismo soluciona problemas de agregação de informações e fornece uma visão única dos dados, de modo que os gestores da corporativa possam tomar suas decisões de forma clara. 

## Pré-requisitos

- Windows 10
- Python 3.11
- Apache Spark 3.3.1
- PostgreSQL 16.0
  
## Estrutura do Banco de Dados

O banco de dados escolhido foi o PostgreSQL, na versão 16.0. Um banco de dados relacional robusto 
e free, cujo possuo familiaridade. O download deste SGBDR foi feito no próprio site oficial 
https://www.postgresql.org/. A instalação feita foi a recomendada no próprio guia, sem muitas regras 
ou muita administração de banco de dados envolvida. Foi criado uma instância chamada 'base_desafio' no schema public com as seguintes 
tabelas:

- 'associado': Armazena informações sobre os associados (clientes).
- 'conta': Registra informações sobre as contas dos associados.
- 'cartao': Contém detalhes dos cartões associados a cada conta.
- 'movimento': Registra as movimentações financeiras.

## Instalação Apache Spark

 O framework de processamento de dados escolhido foi o Apache Spark na versão 3.3.1. É um framework que eu já conheço e consigo 
 combinar com pyspark. O download pode ser obtido diretamente no site oficial da Apache https://spark.apache.org/downloads.html. Toda a 
 configuração foi feita manual, como variáveis de ambiente e estrutura raiz das pastas. Pensei em utilizar o databricks para trabalhar 
 web usando já o spark nativo, evitando a instalação e configuração de ambiente do Spark, mas preferi utilizar localmente.

## Instalação Python 3.11

Instalação feita a partir do site oficial https://www.python.org/. Instalação padrão adicionado a variável PATH, de forma simples.

## Linguagens

Foram utilizados SQL para a construção e modelagem do banco de dados e Python para confeccionar a ETL. Como estou utilizando
o Spark como framework, foi conveniente transformar os dados com o pySpark.

## Autor

- João Pedro Boeira Martins de Souza :)

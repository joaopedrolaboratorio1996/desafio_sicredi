# Autor: João Pedro Boeira Martins de Souza

# ETL com finalidade de transformar dados a partir do banco de dados postgresql
# e gerar o resultado em um arquivo csv.

# -*- coding: utf-8 -*-
# Importando as bibliotecas necessárias para a ETL
from pyspark.sql import SparkSession
from pyspark.sql.functions import col, date_format, expr
from pyspark.sql.types import StringType
import os 

# Criando uma sessão Spark com a devida configuração
spark = SparkSession.builder.appName("ETL_PROCESSA") \
    .config("spark.driver.extraClassPath", "C:\\jdbc_postgresql\\postgresql-42.6.0.jar") \
    .getOrCreate()

# Parâmetros de conexão JDBC ao banco de dados PostgreSQL
jdbc_url = "jdbc:postgresql://localhost:5432/base_desafio"
parametros_conexao = {
    "user": "postgres",
    "password": "1@postgresql",
    "driver": "org.postgresql.Driver"
}

# Leitura das tabelas do banco e as transformando em dataframes 
df_associado = spark.read.jdbc(jdbc_url, "associado", properties=parametros_conexao)
df_conta = spark.read.jdbc(jdbc_url, "conta", properties=parametros_conexao)
df_cartao = spark.read.jdbc(jdbc_url, "cartao", properties=parametros_conexao)
df_movimento = spark.read.jdbc(jdbc_url, "movimento", properties=parametros_conexao)

# Criando um dataframe com as colunas e relações necessárias
df_agregacao = df_movimento \
    .join(df_cartao, df_movimento["id_cartao"] == df_cartao["id"], "inner") \
    .join(df_conta, df_cartao["id_conta"] == df_conta["id"], "inner") \
    .join(df_associado, df_cartao["id_associado"] == df_associado["id"], "inner")

# Renomeando as colunas
df_agregacao = df_agregacao.select(
    col("nome").alias("nome_associado"),
    col("sobrenome").alias("sobrenome_associado"),
    col("idade").alias("idade_associado"),
    col("vlr_transacao").alias("vlr_transacao_movimento"),
    col("des_transacao").alias("des_transacao_movimento"),
    date_format(col("data_movimento"), "dd/MM/yyyy").alias("data_movimento"),
    col("num_cartao").alias("numero_cartao"),
    col("nom_impresso").alias("nome_impresso_cartao"),
    col("tipo_conta"),
    date_format(col("data_criacao"), "dd/MM/yyyy").alias("data_criacao_conta")
)
# Fazendo o 'Unpivot' das colunas
unpivot = "CONCAT_WS('\n', " + \
              "CONCAT('nome_associado ', nome_associado), " + \
              "CONCAT('sobrenome_associado ', sobrenome_associado), " + \
              "CONCAT('idade_associado ', idade_associado), " + \
              "CONCAT('vlr_transacao_movimento ', vlr_transacao_movimento), " + \
              "CONCAT('des_transacao_movimento ', des_transacao_movimento), " + \
              "CONCAT('data_movimento ', data_movimento), " + \
              "CONCAT('numero_cartao ', numero_cartao), " + \
              "CONCAT('nome_impresso_cartao ', nome_impresso_cartao), " + \
              "CONCAT('tipo_conta ', tipo_conta), " + \
              "CONCAT('data_criacao_conta ', data_criacao_conta))"

# Aplica a expressão em string e exibe o resultado para visualização para teste
df_final = df_agregacao.withColumn("movimento_flat", expr(unpivot).cast(StringType()))
df_final.select("movimento_flat").show(truncate=False)

# Caminho csv
caminho = "C:\\etl_desafio\\dados\\"

# Escrevendo o arquivo CSV na pasta com o nome especificado
df_final.coalesce(1).select("movimento_flat").write.csv(caminho, header=True, mode="overwrite", encoding="UTF-8")


# Caminho do diretório de saída
diretorio_saida = "C:\\etl_desafio\\dados"

# Renomeando o arquivo, pois o Spark gera os 'part files', então é necessário tratar
novo_nome = "movimento_flat.csv"

# Listando os arquivos da pasta
arquivos = os.listdir(diretorio_saida)

# Aplicando o 'like %'part-'%' para achar o arquivo gerado pelo spark
for arquivo in arquivos:
    if arquivo.startswith("part-"):
        caminho_original = os.path.join(diretorio_saida, arquivo)
        caminho_novo = os.path.join(diretorio_saida, novo_nome)
        os.rename(caminho_original, caminho_novo)

# Encerre a sessão Spark
spark.stop()
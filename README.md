# Processamento e Análise de Dados de Vendas em Lotes com AWS Glue

Este projeto demonstra como usar o serviço AWS Glue para processar e analisar dados de vendas armazenados em um bucket do Amazon S3. Os dados brutos são processados e transformados usando um job do AWS Glue e, em seguida, os resultados são armazenados em um novo local para análise.

## Visão Geral

O projeto é dividido em duas partes principais:

1. **Infraestrutura do AWS Glue e Armazenamento de Dados:**

   - A infraestrutura é configurada usando o Terraform para criar os recursos necessários no AWS Glue e no Amazon S3.
   - Um bucket do Amazon S3 é criado para armazenar os dados brutos e processados.
   - Uma tabela externa é definida no AWS Glue Catalog para representar os dados brutos de vendas armazenados no S3.

2. **Job do AWS Glue para Processamento de Dados:**

   - Um job do AWS Glue é criado para processar os dados de vendas brutos e realizar uma transformação simples.
   - O script Python de transformação lê os dados brutos, seleciona colunas relevantes e renomeia-as.
   - O resultado da transformação é escrito em um novo local no S3.

## Configuração

Siga os passos abaixo para configurar e executar o projeto:

1. **Infraestrutura com Terraform:**

   - Instale o Terraform em sua máquina local.
   - Configure as variáveis no arquivo `terraform/variables.tf` de acordo com suas necessidades.
   - No diretório `terraform`, execute os seguintes comandos:
   
     ```bash
     terraform init
     terraform apply
     ```

2. **Job do AWS Glue:**

   - Crie um novo job do AWS Glue no console da AWS Glue.
   - Use o script Python de transformação fornecido em `glue_scripts/sales_processing.py`.
   - Configure o job para usar os dados da tabela externa criada no passo anterior.
   - Execute o job para processar os dados e escrever os resultados no novo local no S3.

3. **Análise e Consulta:**

   - Configure o Amazon Athena para consultar os resultados armazenados no novo local do S3.
   - Crie consultas SQL no Amazon Athena para realizar análises básicas nos dados processados.

## Contribuição

Sinta-se à vontade para contribuir com melhorias, correções ou novas funcionalidades para este projeto. Abra uma issue para discutir ideias ou envie um pull request com suas alterações.

## Licença

Este projeto está licenciado sob a licença [MIT](LICENSE).

---

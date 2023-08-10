provider "aws" {
  region = "us-east-1" # Substitua pela região desejada
}

resource "aws_s3_bucket" "data_bucket" {
  bucket = "my-data-bucket-name" 
  acl    = "private"
}

resource "aws_glue_catalog_database" "sales_db" {
  name = "sales_db"
}

resource "aws_glue_catalog_table" "raw_sales_table" {
  name          = "raw_sales"
  database_name = aws_glue_catalog_database.sales_db.name
  table_type    = "EXTERNAL_TABLE"
  parameters = {
    "classification" = "csv"
    "skip.header.line.count" = "1"
  }
  storage_descriptor {
    location = "s3://${aws_s3_bucket.data_bucket.id}/raw_sales/"
    input_format = "org.apache.hadoop.mapred.TextInputFormat"
    output_format = "org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat"
    serde_info {
      name = "raw_sales_serde"
      serialization_library = "org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe"
      parameters = {
        "field.delim" = ","
        "serialization.format" = ","
      }
    }
    columns {
      name = "date"
      type = "string"
    }
    columns {
      name = "product"
      type = "string"
    }
    columns {
      name = "amount"
      type = "double"
    }
  }
}

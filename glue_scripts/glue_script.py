import sys
from awsglue.transforms import *
from awsglue.utils import getResolvedOptions
from pyspark.context import SparkContext
from awsglue.context import GlueContext
from awsglue.job import Job

# GlueContext is the entry point to the Glue service
glueContext = GlueContext(SparkContext.getOrCreate())

# Create a DynamicFrame using the catalog table "raw_sales"
raw_sales = glueContext.create_dynamic_frame.from_catalog(
    database = "sales_db",
    table_name = "raw_sales"
)

# Apply a simple transformation: select columns and rename them
processed_sales = SelectFields.apply(
    frame = raw_sales,
    paths = ["date", "product", "amount"]
).rename_field("date", "sale_date")

# Write the processed data to a new location
glueContext.write_dynamic_frame.from_options(
    frame = processed_sales,
    connection_type = "s3",
    connection_options = {
        "path": "s3://my-output-bucket/processed_sales/"
    }
)

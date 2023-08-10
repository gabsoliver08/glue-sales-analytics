resource "aws_glue_job" "sales_processing" {
  name         = "sales-processing-job"
  description  = "Job to process sales data"
  role_arn     = aws_iam_role.glue_role.arn
  command {
    name = "glueetl"
    python_version = "3"
    script_location = "s3://${aws_s3_bucket.data_bucket.id}/scripts/sales_processing.py"
  }
  default_arguments = {
    "--extra-py-files" = "s3://${aws_s3_bucket.data_bucket.id}/scripts/sales_helpers.py"
  }
  execution_property {
    max_concurrent_runs = 1
  }
}

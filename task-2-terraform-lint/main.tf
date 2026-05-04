provider "aws"{region="us-east-1"}

resource "aws_s3_bucket" "example"{bucket="my-terraform-lint-bucket-123456"tags={Name="MyBucket"Environment="Dev"}}
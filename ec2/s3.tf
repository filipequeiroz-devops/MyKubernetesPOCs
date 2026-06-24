#This bucket will be used to store the Kubernetes configuration file (kubeconfig) that allows us to connect to the Kubernetes cluster running on the EC2 instance.
#Since the EC2 instance has an IAM role with full access to S3, it will be able to read and write files to this bucket. This is useful for storing the kubeconfig file, which contains the necessary credentials and cluster information to connect to the Kubernetes cluster. By storing it in S3, we can easily access it from anywhere and share it with other users or applications that need to interact with the cluster.


#== S3 Bucket Configuration ===
resource "aws_s3_bucket" "kubernetes_bucket" {
  bucket = "kubernetes-bucket-filipe"
}

#== S3 Bucket Public Access Block Configuration ===
resource "aws_s3_bucket_public_access_block" "kubernetes_bucket_public_access_block" {
  bucket = aws_s3_bucket.kubernetes_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

#put all files from "yaml_files" folder into the s3 bucket.
resource "aws_s3_object" "yaml_files" {
  for_each = fileset("${path.module}/yaml_files", "*")

  bucket = aws_s3_bucket.kubernetes_bucket.id
  key    = each.value
  source = "${path.module}/../yaml_files/${each.value}"

  etag = filemd5("${path.module}/../yaml_files/${each.value}")

}
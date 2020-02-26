resource "aws_s3_bucket" "this" {
  bucket = var.name
  acl    = var.acl

  versioning {
    enabled = var.versioning
  }

  tags = var.tags
}

resource "aws_s3_bucket_object" "this" {
  count  = var.create_object ? 1 : 0 #Verifica se precisar fazer upload ou não
  bucket = aws_s3_bucket.this.id     # Estamos pegando o id do bucket na AWS, para isso referenciamos o nome do bucket
  key    = var.object_key            # Nome do arquivo no bucket
  source = var.object_source
  acl    = "public-read" # Acesso publico para leitura, lista de permissões AWS S3 -> https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#canned-acl
  etag   = md5(file(var.object_source))
}
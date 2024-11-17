resource "minio_s3_bucket" "tevbox" {
  provider = minio.tevbox
  bucket         = "ghtevbox"
  acl            = "private"
  object_locking = false
}
resource "minio_s3_bucket" "tevbox" {
  provider = minio.tevbox
  bucket         = "tevbox"
  acl            = "private"
  object_locking = false
}

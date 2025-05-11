#generate cloud storage bucket
resource "google_storage_bucket" "tf-bucket" {
  name     = "tf-bucket-215300"
  location = "US"
  force_destroy = true
  uniform_bucket_level_access = true
  lifecycle {
    prevent_destroy = false
  }
}
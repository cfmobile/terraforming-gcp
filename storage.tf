resource "google_storage_bucket" "buildpacks" {
  name          = "${var.env_name}-buildpacks"
  force_destroy = true
  count         = "${var.create_gcs_buckets ? 1 : 0}"
}

resource "google_storage_bucket" "droplets" {
  name          = "${var.env_name}-droplets"
  force_destroy = true
  count         = "${var.create_gcs_buckets ? 1 : 0}"
}

resource "google_storage_bucket" "packages" {
  name          = "${var.env_name}-packages"
  force_destroy = true
  count         = "${var.create_gcs_buckets ? 1 : 0}"
}

resource "google_storage_bucket" "resources" {
  name          = "${var.env_name}-resources"
  force_destroy = true
  count         = "${var.create_gcs_buckets ? 1 : 0}"
}

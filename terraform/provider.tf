provider "google" {
  credentials = "${file("./terraform/terraform-sa.json")}"
  project     = "kc-cloudlab"
  region      = "us-east1"
}

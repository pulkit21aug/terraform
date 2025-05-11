provider "google" {
  //credentials = file("<YOUR_CREDENTIALS_JSON_FILE>")
  project = "qwiklabs-gcp-04-9f5b796ea73d"
  region  = "us-east1"
  zone    = "us-east1-c"
}

module "instances" {
  source = "./modules/instances"
  subnet_01_self_link = module.vpc_network.subnets["us-east1/subnet-01"].self_link
  subnet_02_self_link = module.vpc_network.subnets["us-east1/subnet-02"].self_link
}

module "storage" {
  source = "./modules/storage"
}


terraform {
  backend "gcs" {
    bucket = "tf-bucket-215300"
    prefix = "terraform/state"
  }
}


module "vpc_network" {
  source  = "terraform-google-modules/network/google"
  version = "10.0.0"

  project_id   = "qwiklabs-gcp-04-9f5b796ea73d"
  network_name = "tf-vpc-787772"
  routing_mode = "GLOBAL"

  subnets = [
    {
      subnet_name   = "subnet-01"
      subnet_ip     = "10.10.10.0/24"
      subnet_region = "us-east1"
    },
    {
      subnet_name   = "subnet-02"
      subnet_ip     = "10.10.20.0/24"
      subnet_region = "us-east1"
    }
  ]
}

# generate firewall rules
resource "google_compute_firewall" "tf-firewall-1" {
  name    = "tf-firewall"
  network = module.vpc_network.network_self_link

  allow {
    protocol = "tcp"
    ports = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
}

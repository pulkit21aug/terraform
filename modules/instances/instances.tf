# generate instance configuration
resource "google_compute_instance" "tf-instance-1" {
  name         = "tf-instance-1"
  machine_type = "e2-standard-2"
  zone         = "us-east1-c"

  boot_disk {
    initialize_params {
      image = "debian-11-bullseye-v20250415"
    }
  }

  network_interface {
    #network = "default"
    subnetwork = var.subnet_01_self_link

    access_config {
      // Ephemeral IP
    }
  }

  metadata_startup_script = <<-EOT
        #!/bin/bash
    EOT
  allow_stopping_for_update = true
}

resource "google_compute_instance" "tf-instance-2" {
  name         = "tf-instance-2"
  machine_type = "e2-standard-2"
  zone         = "us-east1-c"

  boot_disk {
    initialize_params {
      image = "debian-11-bullseye-v20250415"
    }
  }

  network_interface {
    #network = "default"
    subnetwork = var.subnet_02_self_link

    access_config {
      // Ephemeral IP
    }
  }

   metadata_startup_script = <<-EOT
        #!/bin/bash
    EOT
   allow_stopping_for_update = true
}

# resource "google_compute_instance" "tf-instance-3" {
#   name         = "tf-instance-908024"
#   machine_type = "e2-standard-2"
#   zone         = "us-east1-c"
#
#   boot_disk {
#     initialize_params {
#       image = "debian-11-bullseye-v20250415"
#     }
#   }
#
#   network_interface {
#     network = "default"
#
#     access_config {
#       // Ephemeral IP
#     }
#   }
#
#    metadata_startup_script = <<-EOT
#         #!/bin/bash
#     EOT
#    allow_stopping_for_update = true
# }
resource "google_compute_network" "cloudlab" {
  name                    = "kc-cloudlab-vpc"
  description             = "The VPC for setting up a cloud lab and clustering"
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "cloudlab" {
  name          = "cloudlab"
  description   = "The subnet for internal communication for our cluster"
  ip_cidr_range = "${var.subnet}"
  network       = "${google_compute_network.cloudlab.self_link}"
}

resource "google_compute_firewall" "cloudlab-internal" {
  name        = "cloudlab-internal"
  description = "Subnet for allowing internal communication"
  network     = "${google_compute_network.cloudlab.self_link}"

  allow {
    protocol = "tcp"
  }

  allow {
    protocol = "udp"
  }

  allow {
    protocol = "icmp"
  }

  source_ranges = ["10.240.0.0/24", "10.200.0.0/16"]
}

resource "google_compute_firewall" "cloudlab-external" {
  name        = "cloudlab-external"
  description = "Subnet for allowing external communication"
  network     = "${google_compute_network.cloudlab.self_link}"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol  = "tcp"
    ports     = ["22", "6443"]
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_instance" "etcd" {
  count         = "${var.etcd-count}"
  name          = "etcd-member-${count.index}"
  machine_type  = "${var.machine_type}"
  zone          = "${element(var.zones, count.index)}"

  boot_disk {
    initialize_params {
      image = "coreos-cloud/coreos-stable"
    }
  }

  network_interface {
    subnetwork = "${google_compute_subnetwork.cloudlab.self_link}"
    network_ip = "10.240.0.1${count.index}"
    access_config {
    }
  }

  can_ip_forward = "true"

  service_account {
    scopes = [
    "compute-rw",
    "storage-ro",
    "service-management",
    "service-control",
    "logging-write",
    "monitoring"
    ]
  }

  tags = ["kubernetes", "cloudlab", "cluster", "etcd"]
}

resource "google_compute_instance" "kubernetes-controller" {
  count         = "${var.kubernetes-controller-count}"
  name          = "kubernetes-controller-${count.index}"
  machine_type  = "${var.machine_type}"
  zone          = "${element(var.zones, count.index)}"

  boot_disk {
    initialize_params {
      image = "coreos-cloud/coreos-stable"
    }
  }

  network_interface {
    subnetwork = "${google_compute_subnetwork.cloudlab.self_link}"
    network_ip = "10.240.0.2${count.index}"
    access_config {
    }
  }

  can_ip_forward = "true"

  service_account {
    scopes = [
    "compute-rw",
    "storage-ro",
    "service-management",
    "service-control",
    "logging-write",
    "monitoring"
    ]
  }

  tags = ["kubernetes", "cloudlab", "cluster", "controller"]
}

resource "google_compute_instance" "kubernetes-worker" {
  count         = "${var.kubernetes-worker-count}"
  name          = "kubernetes-worker-${count.index}"
  machine_type  = "${var.machine_type}"
  zone          = "${element(var.zones, count.index)}"

  boot_disk {
    initialize_params {
      image = "coreos-cloud/coreos-stable"
    }
  }

  network_interface {
    subnetwork = "${google_compute_subnetwork.cloudlab.self_link}"
    network_ip = "10.240.0.3${count.index}"
    access_config {
    }
  }

  can_ip_forward = "true"

  service_account {
    scopes = [
    "compute-rw",
    "storage-ro",
    "service-management",
    "service-control",
    "logging-write",
    "monitoring"
    ]
  }

  tags = ["kubernetes", "cloudlab", "cluster", "worker"]
}

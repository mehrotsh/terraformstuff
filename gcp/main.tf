provider "google" {
  credentials = file("playground-s-11-91d07a-4e394299d250.json")
  project     = "playground-s-11-91d07a"
  region      = "us-central1"
}
resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1910"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network       = "default"
    access_config {
    }
  }
  metadata = {
      sshKeys ="ubuntu:${file(var.ssh_public_key_path)}"
  }
}
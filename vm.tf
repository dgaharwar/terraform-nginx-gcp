data "google_compute_image" "my_image" {
  name    = "dgubuntu14"
//  family  = "ubuntu"
  project = "Project2"
}

# Creates a GCP VM Instance.
resource "google_compute_instance" "vm" {
  name         = var.name
  machine_type = var.machine_type
  zone         = var.zone
  tags         = ["http-server"]

  boot_disk {
    initialize_params {
      image = data.google_compute_image.my_image.self_link
    }
  }

  network_interface {
    network = "default"
    access_config {
      // Ephemeral IP
    }
  }

  metadata_startup_script = data.template_file.nginx.rendered
}

data "template_file" "nginx" {
  template = "${file("${path.module}/template/install_nginx.tpl")}"

  vars = {
    ufw_allow_nginx = "Nginx HTTP"
  }
}



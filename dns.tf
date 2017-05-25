resource "google_dns_record_set" "ops-manager-dns" {
  name = "pcf.${var.env_name}.${var.dns_suffix}."
  type = "A"
  ttl  = 300

  managed_zone = "${var.dns_zone_name}"

  rrdatas = ["${google_compute_instance.ops-manager.network_interface.0.access_config.0.assigned_nat_ip}"]
}

resource "google_dns_record_set" "optional-ops-manager-dns" {
  name  = "pcf-optional.${var.env_name}.${var.dns_suffix}."
  type  = "A"
  ttl   = 300
  count = "${min(length(split("", var.optional_opsman_image_url)),1)}"

  managed_zone = "${var.dns_zone_name}"

  rrdatas = ["${google_compute_instance.optional-ops-manager.network_interface.0.access_config.0.assigned_nat_ip}"]
}

resource "google_dns_record_set" "wildcard-sys-dns" {
  name = "*.${var.env_name}.${var.dns_suffix}."
  type = "A"
  ttl  = 300

  managed_zone = "${var.dns_zone_name}"

  rrdatas = ["${google_compute_global_address.cf.address}"]
}

resource "google_dns_record_set" "doppler-sys-dns" {
  name = "doppler.sys.${var.env_name}.${var.dns_suffix}."
  type = "A"
  ttl  = 300

  managed_zone = "${var.dns_zone_name}"

  rrdatas = ["${google_compute_address.cf-ws.address}"]
}

resource "google_dns_record_set" "loggregator-sys-dns" {
  name = "loggregator.sys.${var.env_name}.${var.dns_suffix}."
  type = "A"
  ttl  = 300

  managed_zone = "${var.dns_zone_name}"

  rrdatas = ["${google_compute_address.cf-ws.address}"]
}

resource "google_dns_record_set" "wildcard-apps-dns" {
  name = "*.apps.${var.env_name}.${var.dns_suffix}."
  type = "A"
  ttl  = 300

  managed_zone = "${var.dns_zone_name}"

  rrdatas = ["${google_compute_global_address.cf.address}"]
}

resource "google_dns_record_set" "wildcard-ws-dns" {
  name = "*.ws.${var.env_name}.${var.dns_suffix}."
  type = "A"
  ttl  = 300

  managed_zone = "${var.dns_zone_name}"

  rrdatas = ["${google_compute_address.cf-ws.address}"]
}

resource "google_dns_record_set" "app-ssh-dns" {
  name = "ssh.sys.${var.env_name}.${var.dns_suffix}."
  type = "A"
  ttl  = 300

  managed_zone = "${var.dns_zone_name}"

  rrdatas = ["${google_compute_address.cf-ssh.address}"]
}

resource "google_dns_record_set" "tcp-dns" {
  name = "tcp.${var.env_name}.${var.dns_suffix}."
  type = "A"
  ttl  = 300

  managed_zone = "${var.dns_zone_name}"

  rrdatas = ["${google_compute_address.cf-tcp.address}"]
}

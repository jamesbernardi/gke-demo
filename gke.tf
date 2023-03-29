data "google_client_config" "default" {}

provider "kubernetes" {
  host                   = "https://${module.gke.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
}

module "gke" {
  source                          = "terraform-google-modules/kubernetes-engine/google//modules/beta-autopilot-public-cluster/"
  version                         = "~> 25.0.0"
  project_id                      = var.project_id
  name                            = "${var.project_id}-cluster"
  regional                        = true
  region                          = var.region
  network                         = google_compute_network.vpc.name
  subnetwork                      = google_compute_subnetwork.subnet.name
  ip_range_pods                   = google_compute_subnetwork.subnet.ipv6_cidr_range
  ip_range_services               = google_compute_subnetwork.subnet.ipv6_cidr_range
  release_channel                 = "REGULAR"
  enable_vertical_pod_autoscaling = true
}

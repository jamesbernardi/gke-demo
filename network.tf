module "gcp-network" {
  source       = "terraform-google-modules/network/google"
  version      = "~> 6"
  project_id   = var.project_id
  network_name = "${var.project_id}-${var.env_name}"

  subnets = [
    {
      subnet_name   = "${var.project_id}-${var.env_name}"
      subnet_ip     = "10.10.0.0/16"
      subnet_region = var.region
    },
  ]

  secondary_ranges = {
    "${var.project_id}-${var.env_name}" = [
      {
        range_name    = "${var.project_id}-${var.env_name}-pods"
        ip_cidr_range = "10.20.0.0/16"
      },
      {
        range_name    = "${var.project_id}-${var.env_name}-services"
        ip_cidr_range = "10.30.0.0/16"
      },
    ]
  }
}
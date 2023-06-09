variable "project_id" {
  description = "project id"
}

variable "region" {
  default     = "us-east5"
  description = "region"
}

variable "gke_username" {
  default     = ""
  description = "gke username"
}

variable "gke_password" {
  default     = ""
  description = "gke password"
}

variable "gke_num_nodes" {
  default     = 2
  description = "number of gke nodes"
}

variable "env_name" {
  default = "dev"
  description = "Cluster Environment"
}
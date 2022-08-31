variable "project_id" {}

variable "cluster_name" {
  type        = string
  description = "cluster name"
  default     = "k8s-cluster"
}

variable "region" {
  type        = string
  description = "cluster region"
  default     = "us-east1"
}

variable "location" {
  type        = string
  description = "cluster location"
  default     = "us-east1-b"
}

variable "env" {
  type        = string
  description = "Kubernetes Cluster env"
  default     = "https://kubernetes.default.svc"
}
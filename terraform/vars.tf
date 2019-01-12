variable "machine_type" {
  description = "Google compute instance type"
  default     = "f1-micro"
}

variable "region" {
  description = "Google Cloud Platform region for resources"
  default     = "us-east1"
}

variable "zones" {
  description = "Google Cloud Platform zones for compute instances"
  default     = ["us-east1-b", "us-east1-c", "us-east1-d"]
}

variable "subnet" {
  description = "Google VPC subnet"
  default     = "10.240.0.0/24"
}

variable "etcd-count" {
  description = "Overall count for etcd-member instances"
  default     = "3"
}

variable "kubernetes-controller-count" {
  description = "Overall count for Kubernetes controller instances"
  default     = "3"
}

variable "kubernetes-worker-count" {
  description = "Overall count for Kubernetes worker instances"
  default     = "2"
}

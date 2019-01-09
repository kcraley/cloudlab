variable "machine_type" {
  default = "f1-micro"
}

variable "region" {
  default = "us-east1"
}

variable "zones" {
  default = ["us-east1-b", "us-east1-c", "us-east1-d"]
}

variable "subnet" {
  default = "10.240.0.0/24"
}

variable "etcd-count" {
  default = "3"
}

variable "kubernetes-controller-count" {
  default = "3"
}

variable "kubernetes-worker-count" {
  default = "2"
}

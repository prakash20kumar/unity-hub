variable "aws_region" {
  default = "ap-south-1"
}

variable "app_name" {
  default = "mern-app"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "subnet_cidr" {
  default = ["10.0.1.0/24"]
}

variable "documentdb_instance_class" {
  default = "db.r5.large"
}

variable "documentdb_engine_version" {
  default = "4.0.0"
}

variable "documentdb_cluster_id" {
  default = "my-docdb-cluster"
}

variable "documentdb_username" {
  default = "prakash"
}

variable "documentdb_password" {
  default = "Admin321"
}

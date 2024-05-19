resource "aws_docdb_cluster" "main" {
  cluster_identifier      = var.documentdb_cluster_id
  engine                  = "docdb"
  master_username         = var.documentdb_username
  master_password         = var.documentdb_password
  engine_version          = var.documentdb_engine_version
  db_subnet_group_name    = aws_db_subnet_group.main.name
  vpc_security_group_ids  = [aws_security_group.documentdb.id]
}

resource "aws_docdb_cluster_instance" "main" {
  count               = 1
  identifier          = "${var.documentdb_cluster_id}-instance-${count.index}"
  cluster_identifier  = aws_docdb_cluster.main.id
  instance_class      = var.documentdb_instance_class
  engine              = "docdb"
  publicly_accessible = false
}

resource "aws_db_subnet_group" "main" {
  name       = "${var.app_name}-subnet-group"
  subnet_ids = [aws_subnet.main.id]

  tags = {
    Name = "${var.app_name}-subnet-group"
  }
}

output "documentdb_endpoint" {
  value = aws_docdb_cluster.main.endpoint
  description = "The endpoint of the DocumentDB cluster"
}

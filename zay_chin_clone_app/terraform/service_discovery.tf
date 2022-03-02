resource "aws_service_discovery_private_dns_namespace" "zaywal" {
  name = "zaywal-terraform.com"
  description = "zaywal"
  vpc = aws_vpc.main.id
}

resource "aws_service_discovery_service" "db" {
  name  = "db"

  dns_config {
    namespace_id = aws_service_discovery_private_dns_namespace.zaywal.id
    dns_records {
      ttl = 60
      type = "A"
    }
  }
}

resource "aws_service_discovery_service" "api" {
  name  = "api"

  dns_config {
    namespace_id = aws_service_discovery_private_dns_namespace.zaywal.id
    dns_records {
      ttl = 60
      type = "A"
    }
  }
}
output "subnet_a" {
  description = "ID subnet-a"
  value       = yandex_vpc_subnet.subnet-a
}

output "network_id" {
  description = "ID network"
  value       = yandex_vpc_network.main.id
}

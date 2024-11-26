provider "yandex" {
  zone                     = var.zone
  folder_id                = var.folder_id
  cloud_id                 = var.cloud_id
  service_account_key_file = "./key.json"
}

resource "yandex_vpc_network" "main" {
  name = "main"
}

resource "yandex_vpc_subnet" "subnet_a" {
  v4_cidr_blocks = ["10.2.0.0/16"]
  zone           = var.zone
  network_id     = yandex_vpc_network.main.id
}

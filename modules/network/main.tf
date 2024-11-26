provider "yandex" {
  zone                     = var.zone
  folder_id                = var.folder_id
  cloud_id                 = var.cloud_id
  service_account_key_file = "./key.json"
}

resource "yandex_vpc_network" "main" {
  name = "main"
}

resource "yandex_vpc_subnet" "subnet-a" {
  v4_cidr_blocks = ["10.2.0.0/16"]
  zone           = var.zone
  network_id     = yandex_vpc_network.main.id

  depends_on = [yandex_vpc_network.main]
}

# resource "yandex_vpc_security_group" "k8s-public-services" {
#   name        = "k8s-public-services"
#   description = "Правила группы разрешают подключение к сервисам из интернета. Примените правила только для групп узлов."
#   network_id  = yandex_vpc_network.mynet.id
#   ingress {
#     protocol          = "TCP"
#     description       = "Правило разрешает проверки доступности с диапазона адресов балансировщика нагрузки. Нужно для работы отказоустойчивого кластера Managed Service for Kubernetes и сервисов балансировщика."
#     predefined_target = "loadbalancer_healthchecks"
#     from_port         = 0
#     to_port           = 65535
#   }
#   ingress {
#     protocol          = "ANY"
#     description       = "Правило разрешает взаимодействие мастер-узел и узел-узел внутри группы безопасности."
#     predefined_target = "self_security_group"
#     from_port         = 0
#     to_port           = 65535
#   }
#   ingress {
#     protocol       = "ANY"
#     description    = "Правило разрешает взаимодействие под-под и сервис-сервис. Укажите подсети вашего кластера Managed Service for Kubernetes и сервисов."
#     v4_cidr_blocks = concat(yandex_vpc_subnet.mysubnet.v4_cidr_blocks)
#     from_port      = 0
#     to_port        = 65535
#   }
#   ingress {
#     protocol       = "ICMP"
#     description    = "Правило разрешает отладочные ICMP-пакеты из внутренних подсетей."
#     v4_cidr_blocks = ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16"]
#   }
#   ingress {
#     protocol       = "TCP"
#     description    = "Правило разрешает входящий трафик из интернета на диапазон портов NodePort. Добавьте или измените порты на нужные вам."
#     v4_cidr_blocks = ["0.0.0.0/0"]
#     from_port      = 30000
#     to_port        = 32767
#   }
#   egress {
#     protocol       = "ANY"
#     description    = "Правило разрешает весь исходящий трафик. Узлы могут связаться с Yandex Container Registry, Yandex Object Storage, Docker Hub и т. д."
#     v4_cidr_blocks = ["0.0.0.0/0"]
#     from_port      = 0
#     to_port        = 65535
#   }
# }

provider "yandex" {
  zone                     = var.zone
  folder_id                = var.folder_id
  cloud_id                 = var.cloud_id
  service_account_key_file = "./key.json"
}

resource "yandex_kubernetes_cluster" "zone-a" {
  name = "zone-a"

  depends_on = [var.subnet_a]
  network_id = var.network_id

  master {
    zonal {
      zone      = var.subnet_a.zone
      subnet_id = var.subnet_a.id
    }

    maintenance_policy {
      auto_upgrade = true

      maintenance_window {
        start_time = "02:00"
        duration   = "3h"
      }
    }
  }

  service_account_id      = var.service_account_id
  node_service_account_id = var.service_account_id
}

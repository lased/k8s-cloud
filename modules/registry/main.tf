provider "yandex" {
  zone                     = var.zone
  folder_id                = var.folder_id
  cloud_id                 = var.cloud_id
  service_account_key_file = "./key.json"
}

resource "yandex_container_registry" "docker-registry" {
  name      = "docker-registry"
  folder_id = var.folder_id
}

resource "yandex_container_registry_iam_binding" "puller" {
  registry_id = yandex_container_registry.docker-registry.id
  role        = "container-registry.images.puller"

  members = [
    "system:allUsers",
  ]
}

resource "yandex_container_registry_iam_binding" "pusher" {
  registry_id = yandex_container_registry.docker-registry.id
  role        = "container-registry.images.pusher"

  members = [
    "serviceAccount:${var.service_account_id}"
  ]
}

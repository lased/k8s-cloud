locals {
  zone                         = "ru-central1-a"
  cloud_id                     = "b1gfaar2p0r2i4t0rvkv"
  folder_id                    = "b1gufrpdlr4d3ij8jh8a"
  terraform_service_account_id = "ajeh8mjd5107plrn3jm4"
  registry_service_account_id  = "aje1395vl1dgrllvfl6e"
}

terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  zone = local.zone
}

module "network" {
  source    = "./modules/network"
  zone      = local.zone
  cloud_id  = local.cloud_id
  folder_id = local.folder_id
}

module "k8s" {
  source                  = "./modules/k8s"
  zone                    = local.zone
  cloud_id                = local.cloud_id
  folder_id               = local.folder_id
  network_id              = module.network.network_id
  subnet_a                = module.network.subnet_a
  service_account_id      = local.terraform_service_account_id
  node_service_account_id = local.terraform_service_account_id
}

module "registry" {
  source             = "./modules/registry"
  zone               = local.zone
  cloud_id           = local.cloud_id
  folder_id          = local.folder_id
  service_account_id = local.registry_service_account_id
}

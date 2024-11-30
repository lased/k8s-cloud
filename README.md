# k8s-cloud

1. Создать сервисный аккаунт с правами на управление облаком

2. Скопировать ключ `key.json`

3. Задать параметры для сервисного аккаунта

```bash
yc config profile create <имя_профиля>

yc config set service-account-key key.json
yc config set cloud-id <идентификатор_облака>
yc config set folder-id <идентификатор_каталога>
```

4. Поместить содержимое в файл `.terraformrc` и поместить в корень директории пользователя

```
provider_installation {
  network_mirror {
    url = "https://terraform-mirror.yandexcloud.net/"
    include = ["registry.terraform.io/*/*"]
  }
  direct {
    exclude = ["registry.terraform.io/*/*"]
  }
}
```

5. Инициализация, планирование и релиз изменений

```bash
terraform init
terraform plan
terraform apply
```

# Примечание

- документация - https://terraform-provider.yandexcloud.net/resources/vpc_subnet.html

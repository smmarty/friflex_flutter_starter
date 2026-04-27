#!/bin/bash
### Скрипт для переключения сервисов для CI/CD
TYPE=$1

if [ -z "$TYPE" ]; then
  echo "Error: TYPE is not set. Please provide a value."
  exit 1
fi

yq -i '.dependencies.app_services.path = "app_services/'"$TYPE"'/app_services"' pubspec.yaml
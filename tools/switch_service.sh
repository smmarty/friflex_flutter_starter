#!/usr/bin/env bash

SERVICE=$1
PUBSPEC_FILE="pubspec.yaml"

if [ -z "$SERVICE" ]; then
  echo "Usage: $0 [gms|aurora]"
  exit 1
fi

case "$SERVICE" in
  gms)
    sed -i 's|^\(\s*\)#\s*path: app_services/gms/app_services|\1path: app_services/gms/app_services|' "$PUBSPEC_FILE"  
    sed -i 's|^\(\s*\)path: app_services/aurora/app_services|\1# path: app_services/aurora/app_services|' "$PUBSPEC_FILE"
    ;;
  aurora)
    sed -i 's|^\(\s*\)#\s*path: app_services/aurora/app_services|\1path: app_services/aurora/app_services|' "$PUBSPEC_FILE"
    sed -i 's|^\(\s*\)path: app_services/gms/app_services|\1# path: app_services/gms/app_services|' "$PUBSPEC_FILE"
    ;;
  *)
    echo "Unknown option: $SERVICE"
    echo "Usage: $0 [gms|aurora]"
    exit 1
    ;;
esac

echo "Переключились на $SERVICE. Запуск flutter pub get..."
flutter pub get

import 'package:envied/envied.dart';
import 'package:friflex_starter/app/app_config/i_app_config.dart';
import 'package:friflex_starter/app/app_env.dart';


part 'app_config.g.dart';

/// Класс для реализации конфигурации с моковыми данными
@Envied(name: 'Dev', path: 'env/dev.env')
class AppConfigDev implements IAppConfig {
  @override
  AppEnv get env => AppEnv.dev;

  @override
  String get name => 'AppConfigDev';

  @override
  @EnviedField()
  final String baseUrl = _Dev.baseUrl;

  @override
  @EnviedField(obfuscate: true)
  final String secretKey = _Dev.secretKey;
}

/// Класс для реализации конфигурации с продакшн данными
@Envied(name: 'Prod', path: 'env/prod.env')
class AppConfigProd implements IAppConfig {
  @override
  AppEnv get env => AppEnv.prod;

  @override
  String get name => 'AppConfigProd';

  @override
  @EnviedField(obfuscate: true)
  final String baseUrl = _Prod.baseUrl;

  @override
  @EnviedField(obfuscate: true)
  final String secretKey = _Prod.secretKey;
}

/// Класс для реализации конфигурации с стейдж данными
@Envied(name: 'Stage', path: 'env/stage.env')
class AppConfigStage implements IAppConfig {
  @override
  AppEnv get env => AppEnv.stage;

  @override
  String get name => 'AppConfigStage';

  @override
  @EnviedField(obfuscate: true)
  final String baseUrl = _Stage.baseUrl;

  @override
  @EnviedField(obfuscate: true)
  final String secretKey = _Stage.secretKey;
}

import "package:dghub_generator/dghub_generator.dart";

@DGHubMainGenerator(
    envConfig: DGEnvConfig(
        enabledGenerator: true,
        socketVersion: 'v1',
        apiVersion: 'v1',
        baseUrl: 'http://127.0.0.1',
        devUrl: 'http://127.0.0.1',
        production: true,
        port: 6001),
    appConfig: DGAppConfig(
      enabledGenerator: false,
      appName: 'Example (DG)',
      packageName: 'dev.dghub.example',
    ),
    iconConfig: DGIconConfig(
        enabledGenerator: false,
        android: true,
        allPath: 'assets/images/icon.png'),
    splashConfig: DGSplashConfig(
        enabledGenerator: false, allIconPath: 'assets/images/icon.png'))
class MainGenerator {}


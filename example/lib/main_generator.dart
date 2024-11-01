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
      appName: 'Example (DG)',
      packageName: 'dev.dghub.example',
    ),
    iconConfig: DGIconConfig(
        enabledGenerator: true,
        android: true,
        allPath: 'assets/images/icon.png'),
    splashConfig: DGSplashConfig(
        enabledGenerator: true, allIconPath: 'assets/images/icon.png'))
class MainGenerator {}

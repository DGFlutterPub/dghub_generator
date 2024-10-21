import "package:dghub_generator/dghub_generator.dart";

@DGHubMainGenerator(
    appConfig: DGAppConfig(
        appName: 'Example (DG)',
        packageName: 'dev.dghub.example',
        socketVersion: 'v1',
        apiVersion: 'v1',
        baseUrl: 'http://127.0.0.1',
        devUrl: 'http://127.0.0.1',
        production: true,
        port: 6001),
    iconConfig:
        DGIconConfig(android: true, androidPath: 'assets/images/icon.png'))
class MainGenerator {}

import 'dart:io';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:change_case/change_case.dart';
import 'package:dghub_generator/src/libraries/splash_generator/create.dart';
import '../src/libraries/icon_generator/abs/icon_generator.dart';
import '../src/libraries/icon_generator/config/macos_config.dart';
import '../src/libraries/icon_generator/config/web_config.dart';
import '../src/libraries/icon_generator/config/windows_config.dart';
import 'package:dghub_generator/src/libraries/icon_generator/main.dart';
import '../src/libraries/rename_generator/rename.dart';
import 'package:dghub_generator/src/tools/auto_convert.dart';
import 'package:source_gen/source_gen.dart';
import 'package:path/path.dart' as path;
import '../dghub_generator.dart';
import '../src/libraries/icon_generator/config/config.dart';
import '../src/libraries/icon_generator/custom_exceptions.dart';
import '../src/libraries/icon_generator/lfogger.dart';
import '../src/libraries/rename_generator/enums.dart';
import 'models/dg_env_config.dart';
import 'models/dg_icon_config.dart';
import 'package:path/path.dart' as p;

class DGHubMainGenerator {
  final DGAppConfig appConfig;
  final DGEnvConfig envConfig;
  final DGIconConfig iconConfig;
  const DGHubMainGenerator({
    this.envConfig = const DGEnvConfig(),
    this.iconConfig = const DGIconConfig(),
    this.appConfig = const DGAppConfig(),
  });
}

Builder mainGenerator(BuilderOptions options) => SharedPartBuilder(
      [
        _DGHUBMainGenerator(),
      ],
      'dghub_main_generator',
    );

class _DGHUBMainGenerator extends GeneratorForAnnotation<DGHubMainGenerator> {
  @override
  Future<void> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) async {
    var classObj = element as ClassElement;
    var className = classObj.name.replaceAll('Generator', '').toSnakeCase();
    var importedLibraries = classObj.library.importedLibraries;
    var imports = importedLibraries.map((e) => e.identifier).toList();
    var variables = getVariablesFromDartObject(annotation.objectValue);
    var anotations = parseData(
      variables: variables,
      object: annotation.objectValue,
    );

    var appConfig = anotations.containsKey('appConfig')
        ? DGAppConfig.fromJson(anotations['appConfig'])
        : const DGAppConfig();

    var envConfig = anotations.containsKey('envConfig')
        ? DGEnvConfig.fromJson(anotations['envConfig'])
        : const DGEnvConfig();

    if (envConfig.enabledGenerator) {
      await envGenerator(envConfig, appConfig);
    }

    if (appConfig.enabledGenerator) {
      await renameGenerator(appConfig);
    }
    var iconConfig = anotations.containsKey('iconConfig')
        ? DGIconConfig.fromJson(anotations['iconConfig'])
        : const DGIconConfig();

    if (iconConfig.enabledGenerator) {
      await iconGenerator(iconConfig);
    }
    await splashGenerator();
  }
}

splashGenerator() async {
  //createSplashByConfig({});
}

envGenerator(DGEnvConfig config, DGAppConfig appConfig) async {
  final path = p.join(
    Directory.current.path,
    'lib',
    'config',
    'global.dart',
  );
  final file = File(path);

  await file.writeAsString('''
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

const appName = '${appConfig.appName}';
const appPackageName = '${appConfig.packageName}';

const isProductionMode = ${config.production};

const devUrl = '${config.devUrl}';
const baseUrl = '${config.baseUrl}';

const apiVersion = '${config.apiVersion}';
const socketVersion = '${config.socketVersion}';

const hostUrl = isProductionMode ? baseUrl : devUrl;

const apiUrl = '\$hostUrl/api/\$apiVersion/';

const secertKey = '${config.secertKey}';
const publicKey = '${config.publicKey}';

var globalRef = ProviderContainer();

Logger logger = Logger();

''');
}

renameGenerator(DGAppConfig config) async {
  var rename = Rename.fromPlatformNames(platformNames: [
    RenamePlatform.ios.name,
    RenamePlatform.android.name,
    RenamePlatform.macOS.name,
    RenamePlatform.linux.name,
    RenamePlatform.web.name,
    RenamePlatform.windows.name,
  ]);

  await rename.applyWithCommand(
      command: RenameCommand.setAppName, value: config.appName);

  await rename.applyWithCommand(
      command: RenameCommand.setBundleId, value: config.packageName);
}

iconGenerator(DGIconConfig config) async {
  // creating logger based on -v flag
  final logger = FLILogger(false);

  final flavors = getFlavors();
  final hasFlavors = flavors.isNotEmpty;

  final flutterLauncherIconsConfigs = Config(
      windowsConfig:
          WindowsConfig(generate: config.window, imagePath: config.windowPath),
      macOSConfig:
          MacOSConfig(generate: config.macos, imagePath: config.macosPath),
      webConfig: WebConfig(
        generate: config.web,
        imagePath: config.webPath,
      ),
      android: config.android,
      ios: config.ios,
      imagePathIOS: config.iosPath,
      imagePath: config.androidPath,
      imagePathAndroid: config.iosPath);

  var prefixPath = 'f';

  if (!hasFlavors) {
    try {
      await createIconsFromConfig(
        flutterLauncherIconsConfigs,
        logger,
        prefixPath,
      );
      print('\n✓ Successfully generated launcher icons');
    } catch (e) {
      stderr.writeln('\n✕ Could not generate launcher icons');
      stderr.writeln(e);
      exit(2);
    }
  } else {
    try {
      for (String flavor in flavors) {
        print('\nFlavor: $flavor');
        final flutterLauncherIconsConfigs =
            Config.loadConfigFromFlavor(flavor, prefixPath);
        if (flutterLauncherIconsConfigs == null) {
          throw NoConfigFoundException(
            'No configuration found for $flavor flavor.',
          );
        }
        await createIconsFromConfig(
          flutterLauncherIconsConfigs,
          logger,
          prefixPath,
          flavor,
        );
      }
      print('\n✓ Successfully generated launcher icons for flavors');
    } catch (e) {
      stderr.writeln('\n✕ Could not generate launcher icons for flavors');
      stderr.writeln(e);
      exit(2);
    }
  }
}

List<String> getFlavors() {
  final List<String> flavors = [];
  for (var item in Directory('.').listSync()) {
    if (item is File) {
      final name = path.basename(item.path);
      final match = RegExp(flavorConfigFilePattern).firstMatch(name);
      if (match != null) {
        flavors.add(match.group(1)!);
      }
    }
  }
  return flavors;
}

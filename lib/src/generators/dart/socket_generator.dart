import 'dart:io';

import 'package:change_case/change_case.dart';
import 'package:mason/mason.dart';

import '../../../dghub_generator.dart';
import '../../bundles/module/dart/dart_module_bundle.dart';
import '../../tools/tools.dart';

class DartSocketGenerator {
  static Future<void> generate(
    String className,
    List<DGModelField> models,
    DGGeneratorConfig config,
    List<DGApi> apis,
  ) async {
    final generator = await MasonGenerator.fromBundle(dartSocketBundle);
    var target = DirectoryGeneratorTarget(Directory.current);
    var generated = await generator.generate(target, vars: {'name': className});

    var file = File(generated.first.path);

    var read = await file.readAsString();

    var import = [];
    var body = [];

    for (var api in apis) {
      if (api.action == DGApiAction.store) {
        body.add('''
  store({required Function(${className.pascalCase}) result}) {
    if (!_socket.hasListeners('store')) {
      _socket.on('store', (response) {
        try {
          result(${className.pascalCase}.fromJson(response));
        } catch (e) {
          logger.e(e);
          throw 'Store socket error';
        }
      });
    }
  }
''');
      }

      ///
      if (api.action == DGApiAction.update) {
        body.add('''
  update({required Function(${className.pascalCase}) result}) {
    if (!_socket.hasListeners('update')) {
      _socket.on('update', (response) {
        try {
          result(${className.pascalCase}.fromJson(response));
        } catch (e) {
          logger.e(e);
          throw 'Update socket error';
        }
      });
    }
  }
''');
      }

      ///
      if (api.action == DGApiAction.login) {
        body.add('''
  login({required Function(${className.pascalCase}) result}) {
    if (!_socket.hasListeners('login')) {
      _socket.on('login', (response) {
        try {
          result(${className.pascalCase}.fromJson(response));
        } catch (e) {
          logger.e(e);
          throw 'Login socket error';
        }
      });
    }
  }
''');
      }

      ///
      if (api.action == DGApiAction.register) {
        body.add('''
  register({required Function(${className.pascalCase}) result}) {
    if (!_socket.hasListeners('register')) {
      _socket.on('register', (response) {
        try {
          result(${className.pascalCase}.fromJson(response));
        } catch (e) {
          logger.e(e);
          throw 'Register socket error';
        }
      });
    }
  }
''');
      }
    }

    var importResult = Tools.getNewLineString(import);
    var bodyParameterResult = Tools.getNewLineString(body);

    read = read.replaceAll('/*import*/', importResult);

    read = read.replaceAll('/*body*/', bodyParameterResult);

    await file.writeAsString(read);
  }
}

import 'dart:io';

import 'package:change_case/change_case.dart';
import 'package:mason/mason.dart';

import '../../../dghub_generator.dart';
import '../../bundles/module/dart/dart_module_bundle.dart';

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
    }
  }
}

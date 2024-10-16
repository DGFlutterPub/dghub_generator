import 'dart:io';

import 'package:change_case/change_case.dart';
import 'package:dghub_generator/dghub_generator.dart';
import 'package:dghub_generator/src/dghub_generator.dart';
import 'package:dghub_generator/src/generators/node/route_generator.dart';
import 'package:mason/mason.dart';

import '../../bundles/module/node/node_module_bundle.dart';

class NodeProviderGenerator {
  static Future<void> generate(
    String folder,
    String name,
    DGApi api,
    DGConfig config,
  ) async {
    final generator = await MasonGenerator.fromBundle(nodeProviderBundle);
    var target = DirectoryGeneratorTarget(Directory.current);
    var generated = await generator
        .generate(target, vars: {'folder': folder, 'name': name});

    var file = File(generated.first.path);

    var read = '';

    if (api.action == DGApiAction.getOne) {
      read = '''
import ${folder.toPascalCase()} from '../models/${folder.toSnakeCase()}.js';

export default (req, res, next) => {
  var id = req.params["id"];
  ${folder.toPascalCase()}.findOne({ _id: id })
    .exec()
    .then((data) => {
      return res.json(data);
    })
    .catch((err) => {
      return res.status(200).json("This ${folder.toPascalCase()} is not exists" );
    });
}''';
    }

    if (api.action == DGApiAction.getAll) {
      read = '''
import ${folder.toPascalCase()} from '../models/${folder.toSnakeCase()}.js';

export default (req, res, next) => {
  
}''';
    }

    if (api.action == DGApiAction.store) {
      read = '''
import ${folder.toPascalCase()} from '../models/${folder.toSnakeCase()}.js';

export default (req, res, next) => {
  
}''';
    }

    if (api.action == DGApiAction.update) {
      read = '''
import ${folder.toPascalCase()} from '../models/${folder.toSnakeCase()}.js';

export default (req, res, next) => {
  
}''';
    }

    if (api.action == DGApiAction.destroy) {
      read = '''
import ${folder.toPascalCase()} from '../models/${folder.toSnakeCase()}.js';

export default (req, res, next) => {
  
}''';
    }

    if (api.action == DGApiAction.destroyAll) {
      read = '''
import ${folder.toPascalCase()} from '../models/${folder.toSnakeCase()}.js';

export default (req, res, next) => {
  
}''';
    }

    if (api.action == DGApiAction.destroyForever) {
      read = '''
import ${folder.toPascalCase()} from '../models/${folder.toSnakeCase()}.js';

export default (req, res, next) => {
  
}''';
    }

    await file.writeAsString(read);
  }
}

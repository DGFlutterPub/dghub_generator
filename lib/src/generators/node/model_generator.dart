import 'dart:io';

import 'package:dghub_generator/dghub_generator.dart';
import 'package:mason/mason.dart';

import '../../bundles/module/node/node_module_bundle.dart';
import '../../models/dg_generator_config.dart';
import '../../tools/tools.dart';

class NodeModelGenerator {
  static Future<void> generate(
    String className,
    List<DGModel> models,
    DGGeneratorConfig config,
  ) async {
    final generator = await MasonGenerator.fromBundle(nodeModelBundle);
    var target = DirectoryGeneratorTarget(Directory.current);
    var generated = await generator.generate(target, vars: {'name': className});

    var file = File(generated.first.path);

    var read = await file.readAsString();

    var form = [];
    var import = [];
    var plugin = [];

    if (config.autoIncrement) {
      import.add('''import mongooseSequence from "mongoose-sequence";''');
      plugin.add(
          '''schema.plugin(mongooseSequence(mongoose),{inc_field: 'autoIncrement'});''');
    }
    import.add('''import populate from "mongoose-autopopulate";''');
    plugin.add('''schema.plugin(populate);''');

    if (config.deletedAt) {
      form.add('''deletedAt: { type: Date, default: null },''');
    }
    if (config.createdAt) {
      form.add('''createdAt: { type: Date, default: Date.now },''');
    }
    if (config.updatedAt) {
      form.add('''updatedAt: { type: Date, default: null },''');
    }

    for (var model in models) {
      form.add('''
        ${model.key}: {
          type: ${Tools.nodeType(model.validate)}, 
          ${model.ref == null ? '' : 'ref: "${model.ref}",'}
          default: ${model.defaultValue},
          
        },
      ''');
    }
    var formResult = Tools.getNewLineString(form);
    var importResult = Tools.getNewLineString(import);
    var pluginResult = Tools.getNewLineString(plugin);

    read = read.replaceAll('/*form*/', formResult);
    read = read.replaceAll('/*import*/', importResult);
    read = read.replaceAll('/*plugin*/', pluginResult);

    await file.writeAsString(read);
  }
}

import 'dart:io';

import 'package:dghub_generator/dghub_generator.dart';
import 'package:mason/mason.dart';

import '../../bundles/module/node/node_module_bundle.dart';
import '../../models/dg_generator_config.dart';
import '../../tools/tools.dart';

class NodeModelGenerator {
  static Future<void> generate(
    String className,
    List<DGModelField> models,
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
    var hidden = [];

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
      var unique = model.validate.isUnique
          ? '''index: {
        unique: true,
        partialFilterExpression: { ${model.key}: { \$type: ${Tools.dartType(model.validate)} } },
      },'''
          : '';

      if (model.ref == null) {
        form.add('''
        ${model.key}: {
          type: ${Tools.nodeType(model.validate)}, 
          default: ${Tools.nodeDefaultValue(model)},
          $unique
        },
      ''');
      } else if (model.ref.toString().contains('List<')) {
        form.add('''
        ${model.key}: {
          type: [{
          type: String,
          ref: '${model.ref.toString().replaceFirst('List<', '').replaceFirst('>', '')}'}], 
          default: [],
            $unique
        },
      ''');
      } else {
        form.add('''
        ${model.key}: {
          type: String, 
          ${model.ref == null ? '' : 'ref: "${model.ref}",'}
          default: ${Tools.dartDefaultValue(model)},
            $unique
        },
      ''');
      }
    }
    var formResult = Tools.getNewLineString(form);
    var importResult = Tools.getNewLineString(import);
    var pluginResult = Tools.getNewLineString(plugin);
    var hiddenResult = Tools.getNewLineString(hidden);

    read = read.replaceAll('/*form*/', formResult);
    read = read.replaceAll('/*import*/', importResult);
    read = read.replaceAll('/*plugin*/', pluginResult);
    read = read.replaceAll('/*hidden*/', hiddenResult);

    await file.writeAsString(read);
  }
}

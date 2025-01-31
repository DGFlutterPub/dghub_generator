import 'dart:io';

import 'package:mason/mason.dart';

import '../../bundles/module/node/node_module_bundle.dart';
import '../../models/dg_api.dart';
import '../../models/dg_generator_config.dart';
import '../../models/dg_model_field.dart';
import '../../tools/tools.dart';

class NodeModelGenerator {
  static Future<void> generate(
    List<DGApi> apis,
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
    var uniques = [];
    var preSave = [];
    var preUpdate = [];
    var hide = [];

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
    var controlAuthenticated = false;
    for (var api in apis) {
      if (api.controlAuthenticatedOnly) {
        controlAuthenticated = true;
      }
    }

    if (controlAuthenticated) {
      form.add('''auths: { type: [String], required: true,},''');
    }

    for (var model in models) {
      var validates = [];

      if (model.validate.minLength != null) {
        validates.add('''minLength: ${model.validate.minLength},''');
      }

      if (model.validate.maxLength != null) {
        validates.add('''maxLength: ${model.validate.maxLength},''');
      }

      if (model.validate.isUnique) {
        validates.add('''unique: true,
          sparse: true,''');
      }

      var validate = Tools.getNewLineString(validates);

      if (model.validate.isPassword) {
        hide.add('''delete ret.${model.key};
        ''');
      }

      if (model.validate.isUnique) {
        uniques.add('''
schema.index(
    { ${model.key}: 1 },
    { unique: true, partialFilterExpression: { ${model.key}: { \$exists: true } } }
);
''');
        preSave.add('''
    if (this.${model.key} === null || this.${model.key} === "") {
        this.${model.key} = undefined;
    }

''');
      }

      if (model.ref == null) {
        form.add('''
        ${model.key}: {
          type: ${Tools.nodeType(model.validate)}, 
          default: ${Tools.nodeDefaultValue(model)},
          required: ${model.validate.isRequired},
          trim: true,
          $validate
        },
      ''');
      } else if (model.ref.toString().contains('List<')) {
        form.add('''
        ${model.key}: {
          type: [{
          $validate
          type: String,
          ref: '${model.ref.toString().replaceFirst('List<', '').replaceFirst('>', '')}'}], 
          default: ${Tools.nodeDefaultValue(model)},
          trim: true,
          
        },
      ''');
      } else {
        form.add('''
        ${model.key}: {
          type: String, 
          ${model.ref == null ? '' : 'ref: "${model.ref}",'}
          default: ${Tools.dartDefaultValue(model)},
          trim: true,
          $validate
        },
      ''');
      }
    }
    var uniqueResult = Tools.getNewLineString(uniques);
    var formResult = Tools.getNewLineString(form);
    var importResult = Tools.getNewLineString(import);
    var pluginResult = Tools.getNewLineString(plugin);
    var hiddenResult = Tools.getNewLineString(hidden);
    var preSaveResult = Tools.getNewLineString(preSave);
    var hideResult = Tools.getNewLineString(hide);
    read = read.replaceAll('/*unique*/', uniqueResult);
    read = read.replaceAll('/*form*/', formResult);
    read = read.replaceAll('/*import*/', importResult);
    read = read.replaceAll('/*plugin*/', pluginResult);
    read = read.replaceAll('/*hidden*/', hiddenResult);
    read = read.replaceAll('/*preSave*/', preSaveResult);
    read = read.replaceAll('/*hide*/', hideResult);

    await file.writeAsString(read);
  }
}

import 'package:analyzer/dart/constant/value.dart';
import 'package:dghub_generator/dghub_generator.dart';
import 'package:source_gen/source_gen.dart';

class DGHubData {
  static DGHubGenerator convert(ConstantReader annotation) {
    var config = annotation.read('config');
    var models = annotation.read('models');
    var controller = annotation.read('controller');
    var apiServices = annotation.read('apiServices');
    var pages = annotation.read('pages');

    return DGHubGenerator(
      models: _getModels(models),
      config: _getConfig(config),
      controller: controller.isNull ? null : const DGController(),
    );
  }

  static DGConfig? _getConfig(ConstantReader config) {
    if (config.isNull) return null;

    return DGConfig(
      id: config.read('id').boolValue,
      node: config.read('node').boolValue,
      python: config.read('python').boolValue,
      createdAt: config.read('createdAt').boolValue,
      updatedAt: config.read('updatedAt').boolValue,
      deletedAt: config.read('deletedAt').boolValue,
      autoIncrement: config.read('autoIncrement').boolValue,
    );
  }

  static List<DGModel>? _getModels(ConstantReader models) {
    if (models.isNull) return null;

    return models.listValue.map((e) {
      var key = e.getField('key')!;
      var type = e.getField('type')!;
      var defaultValue = e.getField('defaultValue')!;
      var validate = e.getField('validate')!;
      var form = e.getField('form')!;
      var unique = e.getField('unique')!;

      return DGModel(
        key: key.toStringValue()!,
        type: type.toTypeValue(),
        form: form.isNull ? false : form.toBoolValue()!,
        unique: unique.isNull ? false : unique.toBoolValue()!,
        defaultValue: defaultValue.isNull ? null : defaultValue.toTypeValue(),
        validate: _getValidate(validate),
      );
    }).toList();
  }

  static DGValidate? _getValidate(DartObject validate) {
    if (validate.isNull) return null;

    return DGValidate(
      isDate: validate.getField('isDate')!.toBoolValue()!,
    );
  }
}

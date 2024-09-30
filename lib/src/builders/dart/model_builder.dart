import 'package:analyzer/dart/constant/value.dart';
import 'package:change_case/change_case.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:mason/mason.dart';

class ModelBuilder {
  String name;
  DartObject? config;
  List<String> imports;
  List<DartObject> models;

  ModelBuilder({
    required this.name,
    this.config,
    required this.models,
    required this.imports,
  });

  var fields = <Field>[];
  var parameters = <Parameter>[];

  String get() {
    for (var e in models) {
      var key = e.getField('key')!.toStringValue()!.toCamelCase();
      var defaultValue = e.getField('defaultValue');
      var type = e.getField('type')?.toTypeValue();

      String? url;

      if (type?.isDartCoreObject == true) {
        url = imports
            .where((e) => e.snakeCase.contains('$type'.snakeCase.toLowerCase()))
            .firstOrNull;
      }

      var field = Field((b) => b
        ..name = key
        ..type = Reference(type == null ? 'dynamic' : '$type', url));

      fields.add(field);

      var parameter = Parameter((b) {
        b.name = key;
        b.toThis = true;
        b.named = true;

        if (defaultValue?.isNull ?? true) {
          b.required = true;
        } else {
          b.defaultTo = Code('"${defaultValue!.toStringValue()!}"');
        }
      });

      parameters.add(parameter);
    }

    _addDataFromConfig('id', 'int');
    _addDataFromConfig('createdAt', 'String');
    _addDataFromConfig('deletedAt', 'String?');

    var constructors = [
      Constructor((b) => b.optionalParameters.addAll(parameters)),
      Constructor((b) => b
        ..factory = true
        ..lambda = true
        ..name = 'fromJson'
        ..body = Code('_\$${name}ModelFromJson(json)')
        ..requiredParameters.add(Parameter(
          (b) => b
            ..name = 'json'
            ..type = const Reference('Map<String,dynamic>'),
        ))),
    ];

    Class model = Class((b) {
      b.name = '${name}Model';
      b.annotations.add(const CodeExpression(
        Code('JsonSerializable(includeIfNull: true, explicitToJson: true)'),
      ));
      b.docs.addAll([
        "import 'package:json_annotation/json_annotation.dart';",
        "part '${name.snakeCase}_model.g.dart';",
      ]);
      b.fields.addAll(fields);
      b.constructors.addAll(constructors);
      b.methods.add(
        Method(
          (b) => b
            ..name = 'toJson'
            ..lambda = true
            ..body = Code('_\$${name}ModelToJson(this)')
            ..returns = const Reference('Map<String,dynamic>'),
        ),
      );
    });

    final emitter = DartEmitter.scoped();
    return DartFormatter().format('${model.accept(emitter)}');
  }

  void _addDataFromConfig(String name, String type) {
    var isTrue = config?.getField(name)?.toBoolValue() ?? false;
    if (!isTrue) return;

    fields.add(Field((b) => b
      ..name = name
      ..type = Reference(type)));

    parameters.add(Parameter((b) {
      b.name = name;
      b.toThis = true;
      b.named = true;

      if (!type.contains('?')) b.required = true;
    }));
  }
}

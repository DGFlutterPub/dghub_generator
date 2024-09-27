import 'package:analyzer/dart/constant/value.dart';
import 'package:change_case/change_case.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:mason/mason.dart';

class ModelBuilder {
  static String get({
    required String name,
    required List<DartObject> models,
  }) {
    var fields = <Field>[];
    var parameters = <Parameter>[];

    for (var e in models) {
      var key = e.getField('key')!.toStringValue()!.toCamelCase();
      var defaultValue = e.getField('defaultValue');

      var field = Field(
        (b) => b
          ..name = key
          ..type = Reference(defaultValue?.type.toString() ?? 'dynamic'),
      );

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
}

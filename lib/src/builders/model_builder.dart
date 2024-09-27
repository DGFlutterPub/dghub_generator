import 'package:analyzer/dart/constant/value.dart';
import 'package:change_case/change_case.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';

class ModelBuilder {
  static String get({
    required String name,
    required List<DartObject> models,
  }) {
    var fields = <Field>[];
    var requiredParameters = <Parameter>[];
    var optionalParameters = <Parameter>[];
    var fromJson = <String>[];
    var toJson = <String>[];

    for (var e in models) {
      var key = e.getField('key')!.toStringValue()!.toCamelCase();
      var defaultValue = e.getField('defaultValue');

      var field = Field(
        (b) => b
          ..name = key
          ..type = Reference(defaultValue?.type.toString() ?? 'dynamic'),
      );

      fields.add(field);

      toJson.add('"$key": $key');

      var parameter = Parameter(
        (b) => b
          ..name = key
          ..toThis = true,
      );

      if (defaultValue?.isNull ?? true) {
        fromJson.add('$key: json["$key"]');

        optionalParameters.add(parameter);
      } else {
        fromJson.add('json["$key"]');

        requiredParameters.add(parameter);
      }
    }

    var fromJsonBody = Code('''
return  ${name}Model(
  ${fromJson.join(',\n')}
);
''');

    var toJsonBody = Code('''
return {
${toJson.join(',\n')}
};
''');

    var constructors = [
      Constructor(
        (b) => b
          ..requiredParameters.addAll(requiredParameters)
          ..optionalParameters.addAll(optionalParameters),
      ),
      Constructor((b) => b
        ..factory = true
        ..name = 'fromJson'
        ..body = fromJsonBody
        ..requiredParameters.add(Parameter(
          (b) => b
            ..name = 'json'
            ..type = const Reference('Map<String,dynamic>'),
        ))),
    ];

    var toJsonMethod = Method(
      (b) => b
        ..name = 'toJson'
        ..body = toJsonBody
        ..returns = const Reference('Map<String,dynamic>'),
    );

    Class model = Class(
      (b) => b
        ..name = '${name}Model'
        ..fields.addAll(fields)
        ..constructors.addAll(constructors)
        ..methods.add(toJsonMethod),
    );

    final emitter = DartEmitter();
    return DartFormatter().format('${model.accept(emitter)}');
  }
}

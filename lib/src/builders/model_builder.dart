import 'package:analyzer/dart/constant/value.dart';
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

    for (var e in models) {
      var key = e.getField('key')!.toStringValue();
      var defaultValue = e.getField('defaultValue');

      var field = Field(
        (b) => b
          ..name = key
          ..type = Reference(defaultValue?.type.toString() ?? 'dynamic'),
      );
      fields.add(field);

      var parameter = Parameter(
        (b) => b
          ..name = key!
          ..toThis = true,
      );

      if (defaultValue?.isNull ?? true) {
        optionalParameters.add(parameter);
      } else {
        requiredParameters.add(parameter);
      }
    }

    var constructor = Constructor(
      (b) => b
        ..requiredParameters.addAll(requiredParameters)
        ..optionalParameters.addAll(optionalParameters),
    );

    var model = Class((b) => b
      ..name = '${name}Model'
      ..fields.addAll(fields)
      ..constructors.add(constructor));

    final emitter = DartEmitter();
    return DartFormatter().format('${model.accept(emitter)}');
  }
}

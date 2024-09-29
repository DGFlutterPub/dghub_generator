
import 'package:analyzer/dart/constant/value.dart';
import 'package:change_case/change_case.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:mason/mason.dart';

class ValidatorBuilder {
  static String get({
    required String name,
    required List<DartObject> models,
  }) {
    final emitter = DartEmitter.scoped();

    Class model = Class((b) {
      b.name = '${name}Validator';
      b.docs.addAll([
        "import 'package:dghub_generator/dghub_generator.dart';",
        "import '../models/${name.snakeCase}_model.dart';",
      ]);

      var map = {};

      for (var e in models) {
        var key = e.getField('key')!.toStringValue()!.toCamelCase();
        var validate = e.getField('validate');

        if (validate == null) continue;

        var buffer = StringBuffer('DGValidator<String>()');

        if (validate.getField('isEmail')?.toBoolValue() ?? false) {
          buffer.write('.email("Invalid email address.")');
        }

        if (validate.getField('isPhone')?.toBoolValue() ?? false) {
          buffer.write('.phone("Invalid phone.")');
        }

        map['"$key"'] = buffer.toString();
      }

      b.methods.add(
        Method((b) => b
          ..lambda = true
          ..name = 'checkModel'
          ..returns = const Reference('ValidateResult')
          ..body = Code('DGValidator.validator($map,data.toJson(),)')
          ..requiredParameters.add(Parameter(
            (b) => b
              ..name = 'data'
              ..type = Reference('${name}Model'),
          ))),
      );
    });

    return DartFormatter().format('${model.accept(emitter)}');
  }
}

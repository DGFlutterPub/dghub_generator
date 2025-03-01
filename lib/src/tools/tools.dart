import 'dart:convert';

import 'package:change_case/change_case.dart';
import 'package:dghub_generator/dghub_generator.dart';
import 'package:dghub_generator/src/models/script_model.dart';
import 'package:pluralize/pluralize.dart';

extension StringExtension on String {
  String toPlural() => Pluralize().plural(this);
}

class Tools {
  static String editScript(
      {required String script, required List<ScriptModel> replaces}) {
    for (var r in replaces) {
      script = script.replaceAll(r.key, '''
${r.replace}
${r.key}
''');
    }

    return script;
  }

  static String getNewLineString(readLines) {
    StringBuffer sb = StringBuffer();
    for (String line in readLines) {
      sb.write("$line\n");
    }
    return sb.toString();
  }

  static nodeType(DGValidate? validate) {
    if (validate == null) return 'String';

    if (validate.isString) return 'String';

    if (validate.isBoolean) return 'Boolean';

    if (validate.isInt || validate.isDouble) return 'Number';

    if (validate.isPhone) return 'String';

    if (validate.isEmail) return 'String';

    if (validate.isList) return '[Object]';

    if (validate.isMap) return 'Object';

    if (validate.isListString) return '[String]';

    if (validate.isToken) return 'String';

    if (validate.isPassword) return 'String';

    return 'String';
  }

  static dartDefaultValue(DGModelField model) {
    if (model.defaultValue == null) return 'null';
    if (model.validate.isString) return '\'${model.defaultValue}\'';
    if (model.validate.isListString) {
      return 'const ${jsonEncode(model.defaultValue).toString()}';
    }
    return model.defaultValue;
  }

  static nodeDefaultValue(DGModelField model) {
    if (model.defaultValue == null) return 'null';
    if (model.validate.isString) return '\'${model.defaultValue}\'';
    if (model.validate.isListString) {
      return jsonEncode(model.defaultValue).toString();
    }
    return model.defaultValue;
  }

  static dartType(DGValidate? validate) {
    if (validate == null) return 'dynamic';

    if (validate.isString) return 'String';

    if (validate.isBoolean) return 'bool';

    if (validate.isInt) return 'int';

    if (validate.isDouble) return 'double';

    if (validate.isPhone) return 'String';

    if (validate.isEmail) return 'String';

    if (validate.isFile) return 'XFile';

    if (validate.isList) return 'List<dynamic>';

    if (validate.isMap) return 'Map<dynamic,dynamic>';

    if (validate.isListString) return 'List<String>';

    if (validate.isRoles) return 'List<String>';

    if (validate.isToken) return 'String';

    if (validate.isPassword) return 'String';

    return 'dynamic';
  }

  static String? getPathName(DGApi api) =>
      api.path?.replaceAll('/', '_').toPascalCase().toSnakeCase();

  static String getClassPathName(String className, DGApi api) {
    var pathName = getPathName(api);

    if (pathName == null) {
      return switch (api.action) {
        DGApiAction.profile => '${className}_profile',
        DGApiAction.login => '${className}_login',
        DGApiAction.register => '${className}_register',
        DGApiAction.forgotPasswordSend => '${className}_forgot_password_send',
        DGApiAction.forgotPasswordUpdate =>
          '${className}_forgot_password_update',
        DGApiAction.emailVerificationSend =>
          '${className}_email_verification_send',
        DGApiAction.emailVerificationUpdate =>
          '${className}_email_verification_update',
        DGApiAction.getOne => className,
        DGApiAction.getAll => className.toPlural(),
        DGApiAction.store => '${className}_store',
        DGApiAction.update => '${className}_update',
        DGApiAction.destroy => '${className}_destroy',
        DGApiAction.destroyAllForever =>
          '${className.toPlural()}_destroy_forever',
        DGApiAction.destroyAll => '${className.toPlural()}_destroy',
        DGApiAction.destroyForever => '${className}_destroy_forever',
        DGApiAction.recoverOne => '${className}_recover',
        DGApiAction.recoverAll => '${className.toPlural()}_recover',
        DGApiAction.getOneRecovery => '${className}_recovery',
        DGApiAction.getAllRecovery => '${className.toPlural()}_recovery',
      };
    } else {
      return '${className}_$pathName'.toSnakeCase();
    }
  }
}

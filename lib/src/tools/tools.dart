import 'package:dghub_generator/dghub_generator.dart';
import 'package:pluralize/pluralize.dart';

extension StringExtension on String {
  String toPlural() => Pluralize().plural(this);
}

class Tools {
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

    return 'String';
  }

  static dartType(DGValidate? validate) {
    if (validate == null) return 'dynamic';

    if (validate.isString) return 'String';

    if (validate.isBoolean) return 'bool';

    if (validate.isInt) return 'int';

    if (validate.isDouble) return 'double';

    if (validate.isPhone) return 'String';

    if (validate.isEmail) return 'String';

    if (validate.isFile) return 'File';

    return 'dynamic';
  }
}

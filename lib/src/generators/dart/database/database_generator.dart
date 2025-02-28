import 'dart:io';

import 'package:dghub_generator/src/generators/dart/database/scripts/database_script.dart';
import 'package:mason/mason.dart';

import '../../../../dghub_generator.dart';

class DartDatabaseGenerator {
  static Future<void> generate(
    String className,
    List<DGModelField> models,
    DGGeneratorConfig config,
  ) async {
    var script = databaseScript(config, className);
    Directory dir = await Directory(
            '${Directory.current.path}/lib/gen/${className.snakeCase}/database')
        .create(recursive: true);

    var file = File('${dir.path}/${className.snakeCase}_database.dart');
    print(file.path);

    await file.writeAsString(script, flush: true);
  }
}

import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:change_case/change_case.dart';

class NodeApiRouteGenerator {
  static generate(
    String className,
  ) async {
    var file = File(
      p.join(
        Directory.current.path,
        'node',
        'routes',
        'api_routes.js',
      ),
    );

    var read = await file.readAsString();
    var import =
        '''import ${className.toPascalCase()}Api from '../gen/${className.toSnakeCase()}/apis/${className.toSnakeCase()}_api.js';''';

    if (!read.contains(import)) {
      read = read.replaceAll('/*import*/', '''
$import
/*import*/
''');
      read = read.replaceAll('/*form*/', '''
 app.use('/api/'+global.apiVersion, ${className.toPascalCase()}Api);
      /*form*/
      ''');
    }

    await file.writeAsString(read);
  }
}

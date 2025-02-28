import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:change_case/change_case.dart';
import 'package:path/path.dart';

import '../../tools/tools.dart';

class NodeApiRouteGenerator {
  static generate() async {
    var file = File(
      p.join(
        Directory.current.path,
        'node',
        'routes',
        'api_routes.js',
      ),
    );

    var folders = Directory(
      p.join(
        Directory.current.path,
        'lib',
        'gen',
      ),
    ).listSync().map((e) => e.path);

    List<String> classNames = [];

    for (var f in folders) {
      if (await Directory(p.join(f, 'apis')).exists()) {
        classNames.add(basename(f));
      }
    }

    var imports = [];
    var forms = [];

    var read = '''
import global from '../config/global.js';

/*import*/

export default (app)=>{
    
 /*form*/
    
}
''';

    for (var className in classNames) {
      var import =
          '''import ${className.toPascalCase()}Api from '../gen/${className.toSnakeCase()}/apis/${className.toSnakeCase()}_api.js';''';

      if (!read.contains(import)) {
        imports.add(import);
        forms.add(
            "app.use('/api/'+global.apiVersion, ${className.toPascalCase()}Api);");
      }
    }

    read = read
        .replaceAll('/*form*/', Tools.getNewLineString(forms))
        .replaceAll('/*import*/', Tools.getNewLineString(imports));

    await file.writeAsString(read);
  }
}

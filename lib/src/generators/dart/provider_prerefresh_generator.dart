import 'package:change_case/change_case.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

class DartProviderPreRefreshGenerator {
  static Future<void> generate(String folder, String name) async {
    var file = File(
      p.join(
        Directory.current.path,
        'lib',
        'config',
        'providers.dart',
      ),
    );

    var read = await file.readAsString();
    var provider =
        'globalRef.read(${name.toCamelCase()}Provider.notifier).refresh();';
    var import =
        '''import '../gen/$folder/providers/${name.toSnakeCase()}_provider.dart';''';

    if (!read.contains(provider)) {
      read.replaceFirst('/*import*/', '''
/*import*/
$import
      ''');
      read.replaceFirst('/*preRefresh*/', '''
$provider
/*preRefresh*/
''');
    }

    await file.writeAsString(read);
  }
}

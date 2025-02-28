import 'package:mason/mason.dart';

import '../../../../../dghub_generator.dart';

String databaseScript(DGGeneratorConfig config, String name) {
  return '''
import '../../../config/global.dart';
import '../../${name.snakeCase}/models/${name.snakeCase}_query.dart';
import 'package:path/path.dart';
import 'package:sembast/sembast_io.dart';
import '../models/${name.snakeCase}.dart';

class ${name.pascalCase}Database {
  static final String _name = '${name.snakeCase}.db';
  static Database? _db;
  static final _store = StoreRef<String, Map<String, dynamic>>.main();

  static _init() async {
    final dbPath = join(globalDir?.path ?? '', _name);
    _db = await databaseFactoryIo.openDatabase(dbPath);
  }

  static put(${name.pascalCase} data,{bool sync = true}) async {
  await _init();
    await _store.record(data.id).put(_db!, {
    "sync": sync,
    "data": data.toJson()
     });
  }

  static Future<${name.pascalCase}> getOne(String id) async {
   await _init();
    try {
      return ${name.pascalCase}.fromJson(await _store.record(id).get(_db!) ?? {});
    } catch (e) {
      throw e.toString();
    }
  }

  static destroy(String id) async {
  await _init();
    await _store.record(id).delete(_db!);
  }

  static Future<List<${name.pascalCase}>> getAll(${name.pascalCase}Query query) async {
   await _init();
    var list = await _store.find(_db!, finder: Finder(filter: Filter.or([])));
    return list.map((e) => ${name.pascalCase}.fromJson(e.value)).toList();
  }
}
''';
}

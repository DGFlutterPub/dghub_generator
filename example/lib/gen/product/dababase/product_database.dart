import 'package:dghub/config/global.dart';
import 'package:dghub/gen/product/models/product_query.dart';
import 'package:path/path.dart';
import 'package:sembast/sembast_io.dart';

import '../models/product.dart';

class ProductDatabase {
  static final String _name = 'product.db';
  static Database? _db;
  static final _store = StoreRef<String, Map<String, dynamic>>.main();

  static init() async {
    final dbPath = join(globalDir?.path ?? '', _name);
    _db = await databaseFactoryIo.openDatabase(dbPath);
  }

  static store(Product data) async {
    await _store.record(data.id).put(_db!, data.toJson());
  }

  static Future<Product> getOne(String id) async {
    try {
      return Product.fromJson(await _store.record(id).get(_db!) ?? {});
    } catch (e) {
      throw e.toString();
    }
  }

  static destroy(String id) async {
    await _store.record(id).delete(_db!);
  }

  static Future<List<Product>> getAll(ProductQuery query) async {
    var list = await _store.find(_db!, finder: Finder(filter: Filter.or([])));
    return list.map((e) => Product.fromJson(e.value)).toList();
  }
}

import 'package:alfatech/model/CartProduct_model.dart';
import 'package:flutter_paytabs_bridge/BaseBillingShippingInfo.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../../const.dart';

class CartDataBaseHelper {
  CartDataBaseHelper._();
  static final CartDataBaseHelper db = CartDataBaseHelper._();
  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    String path = join(await getDatabasesPath(), 'CartProduct.db');
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int verstion) async {
      await db.execute(
          "CREATE TABLE $tableCartProduct ($CloumnName TEXT NOT NULL,$CloumnImage TEXT NOT NULL,$CloumnPrice TEXT NOT NULL,$CloumnQuantity INTEGER NOT NULL,$CloumnId TEXT NOT NULL )");
    });
  }

  insert(CartProductModel model) async {
    var DBClint = await database;
    await DBClint?.insert(tableCartProduct, model.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<CartProductModel>> GetAllProducts() async {
    var DBClint = await database;
    List<Map> maps = await DBClint!.query(tableCartProduct);
    List<CartProductModel> list = maps.isNotEmpty
        ? maps.map((product) => CartProductModel.formJson(product)).toList()
        : [];
    return list;
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:useCubitToKeebUserloginedAnddarkmode/Core/utils/Constant.dart';
import 'package:useCubitToKeebUserloginedAnddarkmode/features/Featshers/data/models/productmodel.dart';

class DataBasesHelper {
  DataBasesHelper._();
  static final DataBasesHelper db = DataBasesHelper._();

  static Database? _dataBases;
  Future<Database?> get dataBases async {
    if (_dataBases == null) {
      _dataBases = await initializeDatabaseMethod();
    }
    return _dataBases;
  }

  Future<Database> initializeDatabaseMethod() async {
    String path = join(await getDatabasesPath(), "database.db");
    Database myData = await openDatabase(path, version: 6, onCreate: onCereate);
    return myData;
  }

  Future<void> onCereate(Database db, int version) async {
    await db.execute('''CREATE TABLE ${constant.CartTable} 
        (id INTEGER PRIMARY KEY AUTOINCREMENT,
         title TEXT,
         description TEXT ,
         image TEXT,
         category TEXT,
        price TEXT,Amount TEXT)''');
    print("+++++++++++++++++ CartTable +++++++++++++++++");
    await db.execute('''CREATE TABLE ${constant.FavoriteTable}
        (id INTEGER PRIMARY KEY AUTOINCREMENT,
         title TEXT,
         description TEXT ,
          image TEXT,
         category TEXT,
          price TEXT,Amount TEXT)''');

    print("+++++++++++++++++FavoriteTable+++++++++++++++++");
  }

  Future<ProductModel?> insertDataInUserModel(ProductModel product) async {
    print(product);
    var dbClient = await dataBases;
    await dbClient!.insert("${constant.CartTable}", product.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    print("+++++++++++++++++${product.toMap()}+++++++++++++++++");
    return product;
  }

  Future<ProductModel?> insertDataInUserModelFromFav(
    ProductModel product,
  ) async {
    print(product);
    var dbClient = await dataBases;
    await dbClient!.insert("${constant.FavoriteTable}", product.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    print("+++++++++++++++++${product.toMap()}+++++++++++++++++");
    return product;
  }

  // static int amounn = 1;
  // Future<ProductModel?> UpdattDataInUserModel(
  //     ProductModel product, int amountfromi) async {
  //   amounn = amountfromi;
  //   emit(Change_Valuefrom_Action());
  //   var dbClient = await dataBases;
  //   await dbClient!.update(
  //     "${constant.CartTable}",
  //     product.toMap(),
  //     where: "id=?",
  //     whereArgs: [product.id],
  //   );
  //   emit(Change_Valuefrom_Action());
  //   print("+++++++++++++++++ Hello Updated +++++++++++++++++");
  // }

  // Future<ProductModel?> readDataOnlyOneRow(int id) async {
  //   var dbClient = await dataBases;
  //   List<Map<String, dynamic>> maps = await dbClient!.query(
  //     "Users",
  //     where: "id=?",
  //     whereArgs: [id],
  //   );

  //   if (maps.length > 0) {
  //     return ProductModel.fromJson(maps.first);
  //   } else {
  //     return null;
  //   }
  // }

  Future<List<ProductModel?>> GetDataAllfromDatabases() async {
    var dbClient = await dataBases;
    List<Map<String, dynamic>> maps = await dbClient!.query(
      "${constant.CartTable}",
    );

    List<ProductModel> list = maps.isNotEmpty
        ? maps.map((product) => ProductModel.fromJson(product)).toList()
        : [];

    return list;
  }

  Future<List<ProductModel?>> GetDataAllfromDatabasesFromFav() async {
    var dbClient = await dataBases;
    List<Map<String, dynamic>> maps = await dbClient!.query(
      "${constant.FavoriteTable}",
    );

    List<ProductModel> list = maps.isNotEmpty
        ? maps.map((product) => ProductModel.fromJson(product)).toList()
        : [];

    return list;
  }

  Future<void> DeleteDataOnlyOneRow(int id) async {
    var dbClient = await dataBases;
    await dbClient!.delete(
      "${constant.CartTable}",
      where: "id = ?",
      whereArgs: [id],
    );
    print("+++++++++++++++++ Hello deleted one cart  +++++++++++++++++");
  }

  Future<void> DeleteDataOnlyOneRowFromFav(int id) async {
    var dbClient = await dataBases;
    await dbClient!.delete(
      "${constant.FavoriteTable}",
      where: "id = ?",
      whereArgs: [id],
    );
    print(
        "+++++++++++++++++ Hello deleted one FavoriteTable +++++++++++++++++");
  }
}

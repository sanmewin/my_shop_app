import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io' as io;
import 'productFdb.dart';

class DatabaseHelper {
  String itemsTable = "itemTable";
  String colId = "id";
  String colTitle = "title";
  String colPrice = "price";
  String colDes = "description";
  String colCategory = "category";
  String colImage = "image";
  String colRating = "rating";
  String colQuantity ="quantity";
  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initializeDb();
    return null;
  }
  Future<Database> initializeDb() async {
    io.Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'items.db');
    var db = await openDatabase(path, version: 1, onCreate: onCreate);
    return db;
  }

  onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $itemsTable ($colId INTEGER PRIMARY KEY, $colTitle TEXT NOT NULL, $colPrice INTEGER NOT NULL,$colDes TEXT NOT NULL, $colImage TEXT NOT NULL, $colCategory TEXT NOT NULL,$colRating INTEGER NOT NULL,$colQuantity INTEGER NOT NULL)');
  }

  Future<Product> insertProducts(Product products) async {
    var db = await initializeDb();
    await db.insert(itemsTable, products.toMap());
    return products;
  }
  Future<List<Product>> retrieveProducts() async {
    var db = await initializeDb();
    final List<Map<String, Object?>> queryResult = await db.query(itemsTable);
    return queryResult.map((e) => Product.fromMap(e)).toList();
  }
 Future<int> deleteItems(int id) async {
    final db = await initializeDb();
  return  await db.delete(
      itemsTable,
      where: "id = ?",
      whereArgs: [id],
    );
  }
   Future<int> updateQuantity(Product products) async {
    var db = await initializeDb();
    print(products.quantity);
   return await db.update(
      itemsTable,
       products.quantityMap(),
        where:  "id = ?", whereArgs: [products.id]);
        
  }
}

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:tarkari_app/features/home_screen/model/product_model.dart';

Database? _database;

List wholeDataList = [];

class LocalDatabase {
  Future get database async {
    if (_database != null) return _database;
    _database = await _initializedDB('Standard_Local.db');
    return _database;
  }

  Future _initializedDB(String filePath) async {
    final dbpath = await getDatabasesPath();
    final path = join(dbpath, filePath);
    return await openDatabase(
      path,
      version: 3,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    try {
      await db.execute(ProductSubCategory.kTableCreationQuery);
      await db.execute(Materials.kTableCreationQuery);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> addCartItem(Materials material) async {
    final db = await database;
    await db.insert(
      Materials.kTableName,
      material.toDB(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Materials>> getAllCartItems() async {
    final db = await database;
    final List<Map<String, dynamic>> maps =
        await db.query(Materials.kTableName);

    return List.generate(maps.length, (i) {
      return Materials.fromDB(maps[i]);
    });
  }

  Future<void> removeCartItem(Materials material) async {
    final db = await database;
    await db.delete(
      Materials.kTableName,
      where: 'materialInfoID = ?',
      whereArgs: [material.materialInfoID],
    );
  }

  //for checking
  Future<void> printCartItems() async {
    final db = await database;
    final List<Map<String, dynamic>> maps =
        await db.query(Materials.kTableName);

    if (maps.isNotEmpty) {
      for (var item in maps) {
        print(Materials.fromDB(item));
      }
    } else {
      print('No items found in the cart.');
    }
  }

  Future<void> clearCart() async {
    final db = await database;
    await db.delete(Materials.kTableName);
  }
}

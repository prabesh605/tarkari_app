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
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    try {
      await db.execute(ProductSubCategory.kTableCreationQuery);
      await db.execute(Material.kTableCreationQuery);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> addCartItem(Material material) async {
    final db = await database;
    await db.insert(
      Material.kTableName,
      material.toDB(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Material>> getAllCartItems() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(Material.kTableName);

    return List.generate(maps.length, (i) {
      return Material.fromDB(maps[i]);
    });
  }

  Future<void> removeCartItem(Material material) async {
    final db = await database;
    await db.delete(
      Material.kTableName,
      where: 'materialInfoID = ?',
      whereArgs: [material.materialInfoID],
    );
  }

  //for checking
  Future<void> printCartItems() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(Material.kTableName);

    if (maps.isNotEmpty) {
      for (var item in maps) {
        print(Material.fromDB(item));
      }
    } else {
      print('No items found in the cart.');
    }
  }

  Future<void> clearCart() async {
    final db = await database;
    await db.delete(Material.kTableName);
  }
}

import 'package:sell/SQFLite/ModelCategory.dart';
import 'package:sell/SQFLite/ModelUser.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  static Database? _db;
  Future<Database?> get db async {
    if (_db == null) {
      _db = await getDB();
      return _db;
    } else {
      return _db;
    }
  }

  Future<Database?> getDB() async {
    return openDatabase(join(await getDatabasesPath(), "mohamad_sell.db"),
        onCreate: (db, version) async {
          await db.execute(
              "CREATE tABLE USER(id integer primary key autoincrement, name varchar(50) , pieces integer );");
          await db.execute(
              "CREATE tABLE category(id integer primary key autoincrement, category varchar(50), price integer,number integer );");
        }, version: 1);
  }


  Future<int> InsertData(User user) async {
    Database? mydb = await db;
    return await mydb!.insert('user', user.toMap());
  }

  Future<int> DeleteData(int id) async {
    Database? mydb = await db;
    return await mydb!.delete('user', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> UpdateData(User usre) async {
    Database? mydb = await db;
    return mydb!
        .update('user', usre.toMap(), where: 'id = ?', whereArgs: [usre.id]);
  }

  Future<List<User>>? RedAllData() async {
    Database? mydb = await db;
    final List<Map<String, dynamic>> maps = await mydb!.query('user');
    return List.generate(maps.length, (index) => User.fromMap(maps[index]));
  }

//---------------------------------------------------------------------------//

  Future<int> InsertDataCategory(Category category) async {
    Database? mydb = await db;
    return await mydb!.insert('category', category.toMap());
  }

  Future<int> DeleteDataCategory(int id) async {
    Database? mydb = await db;
    return await mydb!.delete('category', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> UpdateDataCategory(Category category) async {
    Database? mydb = await db;
    return mydb!.update('category', category.toMap(),
        where: 'id = ?', whereArgs: [category.id]);
  }
  Future<List<Category>>? RedAllDataCatgory() async {
    Database? mydb = await db;
    final List<Map<String, dynamic>> maps = await mydb!.query('category');
    return List.generate(maps.length, (index) => Category.fromMap(maps[index]));
  }
  countprice(String sql) async {
    Database? mydb = await getDB();
    await mydb!.rawQuery(sql);
  }
}

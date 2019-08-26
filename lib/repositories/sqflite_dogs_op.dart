import 'package:firewood/entity/dog.dart';
import "package:path/path.dart";
import "package:sqflite/sqflite.dart";

class InitDB {
  static Future<Database> dbInit() async {
    final database = openDatabase(
      join(await getDatabasesPath(), 'doggie_database.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)",
        );
      },
      version: 1,
    );

    return database;
  }
}

class DogDAO {
  ///
  /// 向sqflite中插入信息
  ///
  static Future<void> insertDogInfo(Dog dog) async {
    // Get a reference to the database.
    final Database db = await InitDB.dbInit();

    // Insert the Dog into the correct table. Also specify the
    // `conflictAlgorithm`. In this case, if the same dog is inserted
    // multiple times, it replaces the previous data.
    await db.insert(
      'dogs',
      dog.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Dog>> dogs() async {
    // Get a reference to the database.
    // final Database db = await database;
    final Database db = await InitDB.dbInit();

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('dogs');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return Dog(
        id: maps[i]['id'],
        name: maps[i]['name'],
        age: maps[i]['age'],
      );
    });
  }

  static Future<void> updateDog(Dog dog) async {
    // Get a reference to the database.
    final db = await InitDB.dbInit();

    // Update the given Dog.
    await db.update(
      'dogs',
      dog.toMap(),
      // Ensure that the Dog has a matching id.
      where: "id = ?",
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [dog.id],
    );
  }

  static Future<void> deleteDog(int id) async {
    // Get a reference to the database.
    final db = await InitDB.dbInit();

    // Remove the Dog from the database.
    await db.delete(
      'dogs',
      // Use a `where` clause to delete a specific dog.
      where: "id = ?",
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }
}

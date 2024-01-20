import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseContext {
  late Database _database;

  Future<void> open() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'your_database_name.db');

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        // Create tables when the database is created
        await db.execute('''
          CREATE TABLE todo_items (
            id INTEGER PRIMARY KEY,
            title TEXT,
            description TEXT,
            is_completed INTEGER
          )
        ''');
      },
    );
  }

  Future<void> close() async {
    await _database.close();
  }
  
  Database get database => _database;
}
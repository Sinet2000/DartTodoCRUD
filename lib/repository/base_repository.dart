import 'package:todo_app_crud/data/database_context.dart';
import 'package:todo_app_crud/repository/disposable.dart';

import '../models/base_model.dart';
import 'repository.dart';

class BaseRepository<T extends BaseModel> implements Repository<T>, Disposable {

  final List<T> _data; // Simulates a data store (e.g., database, in-memory list)

  final DatabaseContext _dbContext;

  DatabaseContext get dbContext => _dbContext;

  BaseRepository(List<T> initialData, this._dbContext) : _data = List<T>.from(initialData) {
    _openConnection();
  }

  Future<void> _openConnection() async {
    await _dbContext.open();
  }

  // Close the database connection
  Future<void> closeConnection() async {
    await _dbContext.close();
  }

  @override
  void dispose() {
    closeConnection();
  }

  @override
  Future<void> create(T item) async {
    _data.add(item);
  }

  @override
  Future<void> delete(int id) async {
    _data.removeWhere((item) => item.id == id);
  }

  @override
  Future<List<T>> getAll() async {
    return List<T>.from(_data);
  }

  @override
  Future<T?>? getById(int id) async {
    T? result;
    try {
      result = _data.firstWhere((item) => item.id == id);
    } catch (e) {
      rethrow;
    }

    return result;
  }

  @override
  Future<T?>? getSingleWhere(bool Function(T) predicate) async {
    T? result;
    try {
      result = _data.firstWhere(predicate);
    } catch (e) {
      rethrow;
    }
    return result;
  }

  @override
  Future<void> update(T item) async {
    final existingItem = _data.firstWhere((e) => e.id == item.id, orElse: () => throw Exception('Item not found'));
    final index = _data.indexOf(existingItem);
    _data[index] = item;
  }
}


// @override
//   Future<void> create(T item) async {
//     await _dbContext.database.insert(T.tableName, item.toMap());
//   }

//   @override
//   Future<void> update(T item) async {
//     await _dbContext.database.update(
//       T.tableName,
//       item.toMap(),
//       where: 'id = ?',
//       whereArgs: [item.id],
//     );
//   }

//   @override
//   Future<void> delete(int id) async {
//     await _dbContext.database.delete(
//       T.tableName,
//       where: 'id = ?',
//       whereArgs: [id],
//     );
//   }

//   @override
//   Future<List<T>> getAll() async {
//     final result = await _dbContext.database.query(T.tableName);
//     return result.map((e) => T.fromMap(e)).toList();
//   }

//   @override
//   Future<T?> getById(int id) async {
//     final result = await _dbContext.database.query(
//       T.tableName,
//       where: 'id = ?',
//       whereArgs: [id],
//     );
//     return result.isNotEmpty ? T.fromMap(result.first) : null;
//   }

//   @override
//   Future<T?> getSingleWhere(bool Function(T) predicate) async {
//     final allItems = await getAll();
//     return allItems.firstWhereOrNull(predicate);
//   }
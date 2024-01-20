import '../models/base_model.dart';

abstract class Repository<T extends BaseModel> {
  Future<void> create(T item);
  Future<void> update(T item);
  Future<void> delete(int id);
  Future<List<T>> getAll();
  Future<T?>? getById(int id); 
  Future<T?>? getSingleWhere(bool Function(T) predicate);
}
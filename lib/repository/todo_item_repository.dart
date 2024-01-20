import '../models/todo_item.dart';
import 'base_repository.dart';

class TodoItemRepository extends BaseRepository<TodoItem> {
  // Constructor to seed initial data for Todo items
  TodoItemRepository(List<TodoItem> initialData) : super(initialData);

  // Future<List<TodoItem>> getCompletedItems() async {
  //   // Example: Get all completed Todo items
  //   final completedItems = await dbContext.database.query(
  //     'todo_items',
  //     where: 'is_completed = ?',
  //     whereArgs: [1],
  //   );
  //   return completedItems.map((e) => TodoItem.fromMap(e)).toList();
  // }
}
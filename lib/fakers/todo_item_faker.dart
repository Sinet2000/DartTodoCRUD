import 'package:todo_app_crud/models/todo_item.dart';
import 'package:faker/faker.dart';

class TodoItemFaker {
  static TodoItem generateTodoItem(int id) {
    return TodoItem(
      id: id,
      title: faker.lorem.word(),
      description: faker.lorem.sentence(),
      isCompleted: faker.randomGenerator.boolean(),
    );
  }

  static List<TodoItem> generateTodoItems(int amount) {
    return List.generate(amount, (index) => generateTodoItem(index + 1));
  }
}
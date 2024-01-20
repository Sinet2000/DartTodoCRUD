import 'package:todo_app_crud/data/database_context.dart';
import 'package:todo_app_crud/fakers/todo_item_faker.dart';
import 'package:todo_app_crud/models/todo_item.dart';
import 'package:todo_app_crud/repository/todo_item_repository.dart';
import 'package:faker/faker.dart';
import 'package:todo_app_crud/todo_app_crud.dart' as todo_app_crud;

void main(List<String> arguments) async {
  final todoItem = TodoItemFaker.generateTodoItem(1);
  print('Generated TodoItem: $todoItem');

  const int totalCount = 5;
  final todoItems = TodoItemFaker.generateTodoItems(totalCount);
  print('Generated TodoItems: $todoItems');

  final dbContext = DatabaseContext();
  await dbContext.open(); // Open the database connection

  final todoItemRepository = TodoItemRepository(todoItems, dbContext);

  print('Initial Data:');
  print(await todoItemRepository.getAll());

  final newTodoItem = TodoItem(
    id: totalCount + 1,
    title: faker.lorem.word(),
    description: faker.lorem.sentence(),
    isCompleted: faker.randomGenerator.boolean()
  );
  await todoItemRepository.create(newTodoItem);

  print(await todoItemRepository.getAll());

  final updatedItem = await todoItemRepository.getById(1);
  if (updatedItem != null) {
    updatedItem.title = 'Updated Todo';
    await todoItemRepository.update(updatedItem);
  }
  print('\nAfter Update:');
  print(await todoItemRepository.getAll());
  
  await dbContext.close();
}

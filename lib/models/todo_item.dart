import 'base_model.dart';

class TodoItem extends BaseModel {
    String title;
    String description;
    bool isCompleted;
    
    TodoItem({
        required int id,
        required this.title,
        required this.description,
        required this.isCompleted,
    }): super(id: id);

    TodoItem.defaults({
    required int id,
    required this.title,
    required this.description,
  }) : isCompleted = false, super(id: id);

  // Factory method to create a Todo from a map (e.g., when loading from a database)
  factory TodoItem.fromMap(Map<String, dynamic> map) {
    return TodoItem(
      id: map['id'] ?? 0,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      isCompleted: map['isCompleted'] ?? false,
    );
  }

  // Method to convert Todo to a map (e.g., when saving to a database)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isCompleted': isCompleted,
    };
  }

  @override
  String toString() {
    return 'Todo{id: $id, title: $title, description: $description, isCompleted: $isCompleted}';
  }
}
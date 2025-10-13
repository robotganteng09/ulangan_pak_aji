class TodoModel {
  final int id;
  final String title;
  final String description;
  final String category;
  final bool isDone;
  final DateTime? dueDate;

  TodoModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.isDone,
    required this.dueDate,
  });
}

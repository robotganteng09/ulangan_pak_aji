class ToDoLIst {
  String Title;
  String Description;
  bool isDone;
  String category;
  DateTime? dueDate;

  ToDoLIst({
    required this.Title,
    required this.Description,
    required this.isDone,
    this.dueDate,
    required this.category,
  });
}

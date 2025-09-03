import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  final String title;
  final String description;
  final bool isDone;
  final VoidCallback? onTap;

  const TodoCard({
    super.key,
    required this.title,
    required this.description,
    this.isDone = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        onTap: onTap,
        leading: Icon(
          isDone ? Icons.check_circle : Icons.radio_button_unchecked,
          color: isDone ? Colors.green : Colors.grey,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            decoration: isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Text(
          description,
          style: TextStyle(
            decoration: isDone ? TextDecoration.lineThrough : null,
          ),
        ),
      ),
    );
  }
}

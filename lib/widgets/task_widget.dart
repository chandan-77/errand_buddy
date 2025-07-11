import 'package:flutter/material.dart';
import '../models/task.dart'; // Import the Task model

class TaskWidget extends StatelessWidget {
  final Task task; // Task data passed to the widget

  const TaskWidget({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.title), // Display task title

      subtitle: Text(
        // Show priority and formatted due date
        'Priority: ${task.priority} | Due: ${task.dueDate.toLocal().toString().split(' ')[0]}',
      ),

      // Show a red warning icon if overdue, else a check icon
      trailing: task.isOverdue
          ? Icon(Icons.warning, color: Colors.red)
          : Icon(Icons.check_circle_outline),
    );
  }
}

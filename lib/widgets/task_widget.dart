import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskWidget extends StatelessWidget {
  final Task task;

  const TaskWidget({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.title),
      subtitle: Text(
        'Priority: ${task.priority} | Due: ${task.dueDate.toLocal().toString().split(' ')[0]}',
      ),
      trailing: task.isOverdue
          ? Icon(Icons.warning, color: Colors.red)
          : Icon(Icons.check_circle_outline),
    );
  }
}

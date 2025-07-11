import 'package:flutter/material.dart';
import '../models/task.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';
  String priority = 'Low';
  DateTime dueDate = DateTime.now();

  void _saveTask() {
    _formKey.currentState?.save();
    Task newTask = Task(title: title, priority: priority, dueDate: dueDate);
    Navigator.pop(context, newTask);
  }

  Widget _buildPriorityButton(String level) {
    final isSelected = priority == level;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => priority = level),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? Colors.blue : Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              level,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: dueDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 30)),
    );
    if (picked != null) setState(() => dueDate = picked);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text('Add Task', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title Field
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Task Title',
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                onSaved: (value) => title = value ?? '',
              ),
              SizedBox(height: 16),

              // Description Field
              TextFormField(
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: 'Task Description',
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                onSaved: (value) => description = value ?? '',
              ),
              SizedBox(height: 16),

              // Priority Label
              Text(
                'Priority',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 8),

              // Priority Buttons
              Row(
                children: [
                  _buildPriorityButton('High'),
                  SizedBox(width: 8),
                  _buildPriorityButton('Medium'),
                  SizedBox(width: 8),
                  _buildPriorityButton('Low'),
                ],
              ),
              SizedBox(height: 16),

              // Assignee Label
              Text(
                'Assignee',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 8),

              // Assignee Images
              Row(
                children: [
                  CircleAvatar(backgroundImage: AssetImage('assets/p2.png')),
                  SizedBox(width: 8),
                  CircleAvatar(backgroundImage: AssetImage('assets/p3.png')),
                  SizedBox(width: 8),
                  CircleAvatar(backgroundImage: AssetImage('assets/p4.png')),
                ],
              ),
              SizedBox(height: 16),

              // Due Date Field
              GestureDetector(
                onTap: _pickDate,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'Due Date: ${dueDate.toLocal().toString().split(' ')[0]}',
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                ),
              ),
              Spacer(),

              // Save Task Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _saveTask,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text('Add Task', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

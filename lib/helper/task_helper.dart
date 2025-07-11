import 'dart:convert'; 
import 'package:shared_preferences/shared_preferences.dart'; 
import '../models/task.dart'; 

class TaskStorage {
  // Key used to store task list in SharedPreferences
  static const String _taskKey = 'tasks';

  // Save a list of Task objects to SharedPreferences
  static Future<void> saveTasks(List<Task> tasks) async {
    final prefs = await SharedPreferences.getInstance(); 
    List<String> jsonTasks =
        tasks.map((task) => jsonEncode(task.toJson())).toList(); 
    await prefs.setStringList(_taskKey, jsonTasks); 
  }

  // Load a list of Task objects from SharedPreferences
  static Future<List<Task>> loadTasks() async {
    final prefs = await SharedPreferences.getInstance(); 
    final List<String>? jsonTasks = prefs.getStringList(_taskKey); 

    if (jsonTasks == null) return []; 

    // Convert each JSON string back to a Task object
    return jsonTasks.map((jsonStr) {
      Map<String, dynamic> json = jsonDecode(jsonStr); 
      return Task.fromJson(json); 
    }).toList();
  }
}

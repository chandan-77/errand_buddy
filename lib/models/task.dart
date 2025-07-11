class Task {
  String title;
  String priority;
  DateTime dueDate;
  bool completed;

  Task({
    required this.title,
    required this.priority,
    required this.dueDate,
    this.completed = false,
  });

  bool get isOverdue => dueDate.isBefore(DateTime.now()) && !completed;

  Map<String, dynamic> toJson() => {
        'title': title,
        'priority': priority,
        'dueDate': dueDate.toIso8601String(),
        'completed': completed,
      };

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      title: json['title'],
      priority: json['priority'],
      dueDate: DateTime.parse(json['dueDate']),
      completed: json['completed'],
    );
  }
}

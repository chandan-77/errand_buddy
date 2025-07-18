import 'package:flutter/material.dart';

class EscalationLogScreen extends StatelessWidget {
  // Sample escalated task data (title, who it was assigned to, and hours overdue)
  final List<Map<String, String>> escalatedTasks = [
    {'title': 'Grocery Shopping', 'assignedTo': 'Alex', 'overdue': '24'},
    {'title': 'Pay Bills', 'assignedTo': 'Sarah', 'overdue': '12'},
    {'title': 'Clean the House', 'assignedTo': 'David', 'overdue': '36'},
    {'title': 'Laundry', 'assignedTo': 'Emily', 'overdue': '48'},
    {'title': 'Walk the Dog', 'assignedTo': 'Michael', 'overdue': '6'},
  ];

  EscalationLogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // background color for the entire screen
      backgroundColor: const Color(0xFFF7FAFC),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // Show either empty message or the escalated task list
        child: escalatedTasks.isEmpty
            ? Center(child: Text('No escalated tasks yet.'))
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Section Title
                  Text(
                    'Escalated Tasks',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12),
                  // Scrollable task list
                  Expanded(
                    child: ListView.builder(
                      itemCount: escalatedTasks.length,
                      itemBuilder: (context, index) {
                        final task = escalatedTasks[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Task Title and Assignee
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      task['title']!,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: Color(0xFF0D141C),
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      'Originally assigned to ${task['assignedTo']}',
                                      style: TextStyle(
                                        color: Color(0xFF4F7396),
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Overdue Time
                              Text(
                                'Overdue by ${task['overdue']} hours',
                                style: TextStyle(
                                  color: Color(0xFF0D141C),
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
      ),

      // Optional bottom navigation bar (commented out)
      // Uncomment and adjust index if using navigation
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: 2,
      //   type: BottomNavigationBarType.fixed,
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Members'),
      //     BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Tasks'),
      //     BottomNavigationBarItem(icon: Icon(Icons.refresh), label: 'Escalations'),
      //     BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      //   ],
      // ),
    );
  }
}


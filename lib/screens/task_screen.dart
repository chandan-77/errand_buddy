import 'package:flutter/material.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample task data (you can later replace this with a model or backend data)
    final tasks = [
      {
        "priority": "High Priority",
        "title": "Grocery Shopping",
        "due": "Tomorrow",
        "image": "assets/vegetable.png",
      },
      {
        "priority": "Medium Priority",
        "title": "Pay Bills",
        "due": "2 Days",
        "image": "assets/money.png",
      },
      {
        "priority": "Low Priority",
        "title": "Laundry",
        "due": "3 Days",
        "image": "assets/laundry.png",
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFC), // Light background
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0), // Side padding
        child: ListView.separated(
          itemCount: tasks.length,
          separatorBuilder: (_, __) => const SizedBox(height: 16), // Space between items
          itemBuilder: (_, index) {
            final task = tasks[index];

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 📝 Text Info (Left)
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Priority label
                      Text(
                        task["priority"]!,
                        style: const TextStyle(
                          fontFamily: 'PlusJakartaSans',
                          fontSize: 14,
                          color: Colors.blueGrey,
                        ),
                      ),
                      const SizedBox(height: 4),
                      // Task title
                      Text(
                        task["title"]!,
                        style: const TextStyle(
                          fontFamily: 'PlusJakartaSans',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 2),
                      // Due date
                      Text(
                        "Due: ${task["due"]}",
                        style: const TextStyle(
                          fontFamily: 'PlusJakartaSans',
                          fontSize: 14,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 12), // Gap between text and image

                // 🖼 Task Image (Right)
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    task["image"]!,
                    height: 72,
                    width: 96,
                    fit: BoxFit.cover, // Ensures image fills container
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

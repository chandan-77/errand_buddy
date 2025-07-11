import 'package:flutter/material.dart';

class MemberScreen extends StatelessWidget {
  MemberScreen({super.key});

  // Dummy member data list with name, image, and task stats
  final List<Map<String, dynamic>> members = [
    {
      'name': 'Sophia',
      'image': 'assets/p1.png',
      'assigned': 3,
      'overdue': 1,
      'completed': 5,
    },
    {
      'name': 'Ethan',
      'image': 'assets/p2.png',
      'assigned': 2,
      'overdue': 0,
      'completed': 7,
    },
    {
      'name': 'Liam',
      'image': 'assets/p3.png',
      'assigned': 4,
      'overdue': 2,
      'completed': 3,
    },
    {
      'name': 'Olivia',
      'image': 'assets/p1.png',
      'assigned': 1,
      'overdue': 0,
      'completed': 6,
    },
    {
      'name': 'Noah',
      'image': 'assets/p4.png',
      'assigned': 3,
      'overdue': 1,
      'completed': 4,
    },
    {
      'name': 'Ava',
      'image': 'assets/p5.png',
      'assigned': 2,
      'overdue': 0,
      'completed': 5,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFC), // Light background color
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: GridView.builder(
          itemCount: members.length, // Total number of members
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,         // Two cards per row
            childAspectRatio: 0.9,     // Adjusts card height vs width
            crossAxisSpacing: 12,      // Space between columns
            mainAxisSpacing: 12,       // Space between rows
          ),
          itemBuilder: (context, index) {
            final member = members[index];

            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: const Color(0xFFD9E2EC)), // Light border
                borderRadius: BorderRadius.circular(12), // Rounded corners
              ),
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile image
                  CircleAvatar(
                    backgroundImage: AssetImage(member['image']),
                    radius: 20,
                  ),

                  const SizedBox(height: 12),

                  // Member name
                  Text(
                    member['name'],
                    style: const TextStyle(
                      fontFamily: 'PlusJakartaSans',
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Assigned task count
                  Text(
                    "Assigned: ${member['assigned']},",
                    style: const TextStyle(
                      fontFamily: 'PlusJakartaSans',
                      fontSize: 13,
                      color: Color(0xFF4F7396),
                    ),
                  ),

                  // Overdue task count
                  Text(
                    "Overdue: ${member['overdue']},",
                    style: const TextStyle(
                      fontFamily: 'PlusJakartaSans',
                      fontSize: 13,
                      color: Color(0xFF4F7396),
                    ),
                  ),

                  // Completed task count
                  Text(
                    "Completed: ${member['completed']}",
                    style: const TextStyle(
                      fontFamily: 'PlusJakartaSans',
                      fontSize: 13,
                      color: Color(0xFF4F7396),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}


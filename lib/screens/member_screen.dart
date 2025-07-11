import 'package:flutter/material.dart';

// class MemberScreen extends StatelessWidget {
//   final List<Map<String, String>> members = [
//     {'name': 'Alice', 'image': 'assets/p2.png'},
//     {'name': 'Bob', 'image': 'assets/p3.png'},
//     {'name': 'Charlie', 'image': 'assets/p4.png'},
//   ];

//   MemberScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   // title: const Text(
//       //   //   'Members',
//       //   //   style: TextStyle(fontWeight: FontWeight.bold),
//       //   // ),
//       //   // backgroundColor: const Color(0xFFF7FAFC),
//       //   foregroundColor: Colors.teal,
//       //   centerTitle: true,
//       //   elevation: 0,
//       // ),
//       backgroundColor: const Color(0xFFF7FAFC),
//       body: ListView.builder(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//         itemCount: members.length,
//         itemBuilder: (context, index) {
//           return Card(
//             elevation: 2,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(12),
//             ),
//             margin: const EdgeInsets.only(bottom: 12),
//             child: Padding(
//               padding: const EdgeInsets.all(12),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(30),
//                     child: Image.asset(
//                       members[index]['image']!,
//                       width: 48,
//                       height: 48,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   const SizedBox(width: 16),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           members[index]['name']!,
//                           style: const TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const SizedBox(height: 4),
//                         const Text(
//                           "Member of Task Team",
//                           style: TextStyle(fontSize: 14, color: Colors.grey),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const Icon(Icons.check_circle_outline, color: Colors.teal),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//       // bottomNavigationBar: BottomNavigationBar(
//       //   currentIndex: 0, // Members
//       //   onTap: (index) {
//       //     if (index == 0) return; // Already here
//       //     if (index == 1) Navigator.pushReplacementNamed(context, '/tasks');
//       //     if (index == 2)
//       //       Navigator.pushReplacementNamed(context, '/escalation');
//       //     if (index == 3) {} // Profile not implemented yet
//       //   },
//       //   selectedItemColor: Colors.teal,
//       //   unselectedItemColor: Colors.grey,
//       //   items: const [
//       //     BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Members'),
//       //     BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Tasks'),
//       //     BottomNavigationBarItem(
//       //       icon: Icon(Icons.access_time),
//       //       label: 'Escalations',
//       //     ),
//       //     BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
//       //   ],
//       // ),
//     );
//   }
// }



class MemberScreen extends StatelessWidget {
  MemberScreen({super.key});

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
      backgroundColor: const Color(0xFFF7FAFC),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: GridView.builder(
          itemCount: members.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.9,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemBuilder: (context, index) {
            final member = members[index];
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: const Color(0xFFD9E2EC)),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(member['image']),
                    radius: 20,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    member['name'],
                    style: const TextStyle(
                      fontFamily: 'PlusJakartaSans',
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Assigned: ${member['assigned']},",
                    style: const TextStyle(
                      fontFamily: 'PlusJakartaSans',
                      fontSize: 13,
                      color: Color(0xFF4F7396),
                    ),
                  ),
                  Text(
                    "Overdue: ${member['overdue']},",
                    style: const TextStyle(
                      fontFamily: 'PlusJakartaSans',
                      fontSize: 13,
                      color: Color(0xFF4F7396),
                    ),
                  ),
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


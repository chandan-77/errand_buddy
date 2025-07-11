import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFC), // Light background color
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32), // Page padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile picture
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/p1.png'), // Replace with actual user image if needed
              ),

              const SizedBox(height: 16),

              // User name
              const Text(
                'John Doe',
                style: TextStyle(
                  fontFamily: 'PlusJakartaSans',
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              // User email
              const Text(
                'johndoe@email.com',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 32),

              // --- Action tiles ---
              
              // Edit Profile option
              ListTile(
                leading: const Icon(Icons.edit, color: Colors.teal),
                title: const Text('Edit Profile'),
                onTap: () {
                  // Add navigation to edit profile screen
                },
              ),

              // Notifications option
              ListTile(
                leading: const Icon(Icons.notifications, color: Colors.teal),
                title: const Text('Notifications'),
                onTap: () {
                  // Add navigation to notification settings
                },
              ),

              // Logout option
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.teal),
                title: const Text('Logout'),
                onTap: () {
                  // Handle logout logic or navigate to login
                  // Navigator.popUntil(context, ModalRoute.withName('/'));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

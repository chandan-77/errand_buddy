import 'package:flutter/material.dart';

// Import screens used in routing
import 'package:errand_buddy/screens/first_screen.dart';
import 'package:errand_buddy/screens/onbroading_screen.dart';
import 'package:errand_buddy/screens/spalash_screen.dart';
import 'package:errand_buddy/screens/add_task.dart';

void main() {
  runApp(const ErrandBuddyApp()); // Launch the app
}

class ErrandBuddyApp extends StatelessWidget {
  const ErrandBuddyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Errand Buddy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: 'PlusJakartaSans',
        scaffoldBackgroundColor: const Color(0xFFF7FAFC),
      ),
      initialRoute: '/', // First screen to show when app launches
      routes: {
        '/': (context) => const SplashScreen(),
        '/onboarding': (context) => const OnboardingScreen(), // Shown after splash
        '/home': (context) => const MainScreen(), // Main task page
        '/add': (context) => const AddTaskScreen(), // Page to add new tasks
      },
    );
  }
}

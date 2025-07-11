import 'package:errand_buddy/screens/first_screen.dart';
import 'package:errand_buddy/screens/onbroading_screen.dart';
import 'package:flutter/material.dart';
import 'package:errand_buddy/screens/spalash_screen.dart';
import 'package:errand_buddy/screens/add_task.dart';

void main() {
  runApp(const ErrandBuddyApp());
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
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/onboarding': (context) => const OnboardingScreen(),
        '/home': (context) => const MainScreen(),
        '/add': (context) => const AddTaskScreen(),
      },
    );
  }
}

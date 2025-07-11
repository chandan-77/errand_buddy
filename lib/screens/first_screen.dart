import 'package:errand_buddy/screens/member_screen.dart';
import 'package:errand_buddy/screens/profile_screen.dart';
import 'package:errand_buddy/screens/task_screen.dart';
import 'package:flutter/material.dart';
import 'escalation_log_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    TaskPage(),
    MemberScreen(),
    EscalationLogScreen(),
    ProfileScreen(),
  ];

  final List<String> _titles = [
    'Tasks',
    'Members',
    'Escalation Log',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7FAFC),
        centerTitle: true,
        elevation: 0,
        foregroundColor: Colors.black,
        title: Text(
          _titles[_currentIndex],
          style: const TextStyle(
            fontFamily: 'PlusJakartaSans',
            fontWeight: FontWeight.w700,
            fontSize: 18,
            height: 23 / 18,
            letterSpacing: 0,
          ),
          textAlign: TextAlign.center,
        ),
        leading:
            (_currentIndex == 2 || _currentIndex == 3)
                ? IconButton(
                  icon: const Icon(Icons.arrow_back),
                  color: Colors.black,
                  onPressed: () {
                    setState(() {
                      _currentIndex = 0; // Go back to "Tasks"
                    });
                  },
                )
                : null,
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Color(0xFF4F7396),
        backgroundColor: Colors.white,
        selectedLabelStyle: TextStyle(
          fontFamily: 'PlusJakartaSans',
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelStyle: TextStyle(
          fontFamily: 'PlusJakartaSans',
          fontWeight: FontWeight.w500,
        ),
        type: BottomNavigationBarType.fixed, // ensures label is always shown
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Members'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Tasks'),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Escalation',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

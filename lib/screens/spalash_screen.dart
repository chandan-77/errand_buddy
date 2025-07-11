import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Waits 2 seconds before navigating to the onboarding screen
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/onboarding');
    });

    return Scaffold(
      backgroundColor: Color(0xFF2A5555), // Dark green background
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Slight upward nudge to reduce gap between logo and title
            Transform.translate(
              offset: const Offset(0, 2),
              child: Image.asset('assets/logo.png', height: 120),
            ),

            // App name below the logo
            const Text(
              'ERRAND BUDDY',
              style: TextStyle(
                fontFamily: 'PlaypenSans',
                fontSize: 40,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

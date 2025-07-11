import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _pages = [
    {
      'image': 'assets/second_screen.png',
      'title': 'Errand Buddy',
      'subtitle': 'Simplify shared errands together',
    },
    {
      'image': 'assets/second_screen.png',
      'title': 'Assign Tasks',
      'subtitle': 'Easily assign errands to friends or roommates',
    },
    {
      'image': 'assets/second_screen.png',
      'title': 'Track Progress',
      'subtitle': 'Stay updated on every errand status',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFC),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) => setState(() => _currentPage = index),
              itemCount: _pages.length,
              itemBuilder: (_, index) {
                final page = _pages[index];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(2),
                      width: double.infinity,
                      constraints: const BoxConstraints(
                        maxWidth: 358,
                        maxHeight: 537,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFF2A5555),
                        borderRadius: BorderRadius.circular(8),
                      ),
                
                      child: Image.asset(page['image']!, fit: BoxFit.fill),
                    ),
                    const SizedBox(height: 4), // Gap between image and title
                    Text(
                      page['title']!,
                      style: const TextStyle(
                        fontSize: 24,
                        fontFamily: 'PlusJakartaSans',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      page['subtitle']!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'PlusJakartaSans',
                        color: Colors.black54,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _pages.length,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 20),
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      _currentPage == index
                          ? Colors.blue
                          : Colors.grey.shade300,
                ),
              ),
            ),
          ),
          if (_currentPage == _pages.length - 1)
            Padding(
              padding: const EdgeInsets.only(bottom: 32.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/home');
                },
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                    fontFamily: 'PlusJakartaSans',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

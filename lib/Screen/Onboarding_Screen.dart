import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
<<<<<<< HEAD
import 'package:easy_localization/easy_localization.dart'; 
import 'package:to_do_app_development/Screen/Splash_Screen.dart';
import 'package:to_do_app_development/Screen/Started_Screen.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});
  final PageController _pageController = PageController();
  final ValueNotifier<int> _currentPageNotifier = ValueNotifier<int>(0);

  final List<Map<String, String>> _pages = [
    {
      'title_key': 'manage_tasks_title',
      'subtitle_key': 'manage_tasks_subtitle',
      'image': 'assets/onboarding1.png',
    },
    {
      'title_key': 'create_routine_title',
      'subtitle_key': 'create_routine_subtitle',
      'image': 'assets/onboarding2.png',
    },
    {
      'title_key': 'organize_tasks_title',
      'subtitle_key': 'organize_tasks_subtitle',
=======
import 'package:to_do_app_development/Screen/Splash_Screen.dart';
import 'package:to_do_app_development/Screen/Started_Screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _pages = [
    {
      'title': 'Manage your tasks',
      'subtitle':
          'You can easily manage all of your daily \n tasks in DoMe for free',
      'image': 'assets/onboarding1.png',
    },
    {
      'title': 'Create daily routine',
      'subtitle':
          'In Uptodo  you can create your\n personalized routine to stay productive',
      'image': 'assets/onboarding2.png',
    },
    {
      'title': 'Orgonaize your tasks',
      'subtitle':
          'You can organize your daily tasks by \n adding your tasks into separate categories',
>>>>>>> cdd6b355a4275f9c1fc6085dd11dcb1a41ec23ed
      'image': 'assets/onboarding3.png',
    },
  ];

<<<<<<< HEAD
  void _toggleLanguage(BuildContext context) {
    final currentLang = context.locale.languageCode;
    final newLocale = currentLang == 'en' ? const Locale('ar') : const Locale('en');
    context.setLocale(newLocale);
=======
  @override
  void initState() {
    super.initState();
    // Show system status bar and nav bar (with edge-to-edge layout)
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
>>>>>>> cdd6b355a4275f9c1fc6085dd11dcb1a41ec23ed
  }

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(
        child: Column(
          children: [
            // Top row: Skip button on left, single language toggle icon on right
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
=======
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      body: SafeArea(
        child: Column(
          children: [
            // Skip Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
>>>>>>> cdd6b355a4275f9c1fc6085dd11dcb1a41ec23ed
                children: [
                  TextButton(
                    onPressed: () {
                      _pageController.animateToPage(
                        _pages.length - 1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
<<<<<<< HEAD
                      _currentPageNotifier.value = _pages.length - 1;
                    },
                    child: Text(
                      tr('skip'),
                      style: const TextStyle(color: Colors.white70),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.language, color: Colors.white),
                    onPressed: () => _toggleLanguage(context),
                  ),
=======
                    },
                    child: const Text(
                      "SKIP",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
>>>>>>> cdd6b355a4275f9c1fc6085dd11dcb1a41ec23ed
                ],
              ),
            ),

            // PageView
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
<<<<<<< HEAD
                onPageChanged: (index) => _currentPageNotifier.value = index,
=======
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
>>>>>>> cdd6b355a4275f9c1fc6085dd11dcb1a41ec23ed
                itemBuilder: (context, index) {
                  final page = _pages[index];
                  return Column(
                    children: [
                      const SizedBox(height: 40),
                      Center(
                        child: Image.asset(
                          page['image']!,
                          width: 271,
                          height: 350,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(height: 40),
<<<<<<< HEAD
                      ValueListenableBuilder<int>(
                        valueListenable: _currentPageNotifier,
                        builder: (context, currentPage, _) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(_pages.length, (idx) {
                              final isActive = currentPage == idx;
                              return AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                margin: const EdgeInsets.symmetric(horizontal: 4),
                                width: 24,
                                height: 4,
                                decoration: BoxDecoration(
                                  color: isActive ? Colors.white : Colors.white30,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              );
                            }),
                          );
                        },
                      ),
=======
                      _buildPageIndicator(),
>>>>>>> cdd6b355a4275f9c1fc6085dd11dcb1a41ec23ed
                      const SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          children: [
                            Text(
<<<<<<< HEAD
                              tr(page['title_key']!),
=======
                              page['title']!,
>>>>>>> cdd6b355a4275f9c1fc6085dd11dcb1a41ec23ed
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 20),
                            Text(
<<<<<<< HEAD
                              tr(page['subtitle_key']!),
=======
                              page['subtitle']!,
>>>>>>> cdd6b355a4275f9c1fc6085dd11dcb1a41ec23ed
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white70,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

<<<<<<< HEAD
        
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: ValueListenableBuilder<int>(
                valueListenable: _currentPageNotifier,
                builder: (context, currentPage, _) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          if (currentPage == 0) {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (_) =>  SplashScreen(),
                              ),
                            );
                          } else {
                            _pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                        child: Text(
                          tr('back'),
                          style: const TextStyle(color: Colors.white70),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF8875FF),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        onPressed: () {
                          if (currentPage == _pages.length - 1) {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (_) => StartedScreen()),
                            );
                          } else {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                        child: Text(
                          currentPage == _pages.length - 1 ? tr('get_started') : tr('next'),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  );
                },
=======
            // Navigation Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      if (_currentPage == 0) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (_) => const SplashScreen(),
                          ),
                        );
                      } else {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: const Text(
                      "BACK",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF8875FF),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    onPressed: () {
                      if (_currentPage == _pages.length - 1) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) => StartedScreen()),
                        );
                      } else {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Text(
                      _currentPage == _pages.length - 1
                          ? "GET STARTED"
                          : "NEXT",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
>>>>>>> cdd6b355a4275f9c1fc6085dd11dcb1a41ec23ed
              ),
            ),
          ],
        ),
      ),
    );
  }
<<<<<<< HEAD
=======

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(_pages.length, (index) {
        bool isActive = _currentPage == index;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: 24,
          height: 4,
          decoration: BoxDecoration(
            color: isActive ? Colors.white : Colors.white30,
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
>>>>>>> cdd6b355a4275f9c1fc6085dd11dcb1a41ec23ed
}

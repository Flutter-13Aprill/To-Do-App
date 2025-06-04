import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      'image': 'assets/onboarding3.png',
    },
  ];

  void _toggleLanguage(BuildContext context) {
    final currentLang = context.locale.languageCode;
    final newLocale = currentLang == 'en' ? const Locale('ar') : const Locale('en');
    context.setLocale(newLocale);
  }

  @override
  Widget build(BuildContext context) {
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
                children: [
                  TextButton(
                    onPressed: () {
                      _pageController.animateToPage(
                        _pages.length - 1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
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
                ],
              ),
            ),

            // PageView
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                onPageChanged: (index) => _currentPageNotifier.value = index,
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
                      const SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          children: [
                            Text(
                              tr(page['title_key']!),
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              tr(page['subtitle_key']!),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}

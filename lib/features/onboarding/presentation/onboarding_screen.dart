import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:subtrack/features/onboarding/models/onboarding_item.dart';

import '../../../core/di/injection.dart';
import '../../../core/navigation/app_routes.dart';
import '../../../data/preferences/app_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController _controller;

  int _currentPage = 0;

  @override
  void initState() {
    super.initState();

    _controller = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _finish() async {
    await getIt<AppPreferences>().completeOnboarding();

    if (!mounted) return;

    context.go(AppRoutes.addSubscription);
  }

  @override
  Widget build(BuildContext context) {
    final isLastPage = _currentPage == onboardingItems.length - 1;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: AnimatedOpacity(
                  opacity: isLastPage ? 0 : 1,
                  duration: const Duration(milliseconds: 250),
                  child: IgnorePointer(
                    ignoring: isLastPage,
                    child: TextButton(onPressed: _finish, child: const Text('Skip')),
                  ),
                ),
              ),

              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: onboardingItems.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    final page = onboardingItems[index];

                    return Column(
                      children: [
                        const Spacer(),

                        Expanded(flex: 5, child: Image.asset(page.image)),

                        const SizedBox(height: 40),

                        Text(
                          page.title,
                          textAlign: TextAlign.center,
                          style: Theme.of(
                            context,
                          ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                        ),

                        const SizedBox(height: 16),

                        Text(
                          page.description,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),

                        const Spacer(),
                      ],
                    );
                  },
                ),
              ),

              SmoothPageIndicator(
                controller: _controller,
                count: onboardingItems.length,
                effect: const ExpandingDotsEffect(dotHeight: 10, dotWidth: 10, expansionFactor: 3),
              ),

              const SizedBox(height: 32),

              SizedBox(
                width: double.infinity,
                height: 56,
                child: FilledButton(
                  onPressed: () async {
                    if (isLastPage) {
                      await _finish();
                      return;
                    }

                    await _controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Text(isLastPage ? 'Get Started' : 'Next'),
                ),
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

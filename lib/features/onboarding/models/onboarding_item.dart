class OnboardingItem {
  final String title;
  final String description;
  final String image;

  const OnboardingItem({required this.title, required this.description, required this.image});
}

const onboardingItems = [
  OnboardingItem(
    // image: 'assets/images/onboarding_1.png',
    image: 'assets/logos/netflix.png',
    title: 'Never Miss Another Renewal',
    description: 'Track all your subscriptions in one place and get reminded before you’re charged.',
  ),
  OnboardingItem(
    // image: 'assets/images/onboarding_2.png',
    image: 'assets/logos/netflix.png',

    title: 'Know Where Your Money Goes',
    description: 'See your monthly and yearly subscription spending with beautiful insights.',
  ),
  OnboardingItem(
    // image: 'assets/images/onboarding_3.png',
    image: 'assets/logos/netflix.png',

    title: 'Start With One Subscription',
    description: 'Add your first subscription in less than a minute and let Subtrack handle the rest.',
  ),
];

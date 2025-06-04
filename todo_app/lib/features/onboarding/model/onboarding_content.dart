///Class represent OnboardingContent
class OnboardingContent {
  String imageUrl;
  String title;
  String subTitle;

  // Constructor to initialize
  OnboardingContent({
    required this.imageUrl,
    required this.title,
    required this.subTitle,
  });
}

// List onboardingContent
final List<OnboardingContent> onboardingContent = [
  OnboardingContent(
    imageUrl: 'assets/images/Onboading1.png',
    title: 'titleOnboard1',
    subTitle: 'subTitleOnboard1',
  ),
  OnboardingContent(
    imageUrl: 'assets/images/Onboading2.png',
    title: 'titleOnboard2',
    subTitle: 'subTitleOnboard2',
  ),
  OnboardingContent(
    imageUrl: 'assets/images/Onboading3.png',
    title: 'titleOnboard3',
    subTitle: 'subTitleOnboard3',
  ),
];

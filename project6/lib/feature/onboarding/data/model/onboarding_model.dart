import 'package:project6/core/text/app_text.dart';

class OnboardingModel {
  final String image;
  final String title;
  final String subTitle;

  OnboardingModel({
    required this.image,
    required this.title,
    required this.subTitle,
  });
}

List<OnboardingModel> onboardingData = [
  OnboardingModel(
    image: "asset/image/onboarding1.png",
    title: AppText.title1,
    subTitle: AppText.subTitle1,
  ),
  OnboardingModel(
    image: "asset/image/onboarding2.png",
    title: AppText.title2,
    subTitle: AppText.subTitle2,
  ),
  OnboardingModel(
    image: "asset/image/onboarding3.png",
    title: AppText.title3,
    subTitle: AppText.subTitle3,
  ),
];

import 'package:to_do_project/core/text/app_text.dart';

class OnbordingModel {
  final String image;
  final String title;
  final String subtitle;

  OnbordingModel({
    required this.image,
    required this.title,
    required this.subtitle,
  });
}

List<OnbordingModel> onbordingData = [
  OnbordingModel(
    image: "assets/images/onbording1.png",
    title: AppText.onbordingTitle1,
    subtitle: AppText.onbordingSupTitle1,
  ),
  OnbordingModel(
    image: "assets/images/onbording2.png",
    title: AppText.onbordingTitle2,
    subtitle: AppText.onbordingSupTitle2,
  ),
  OnbordingModel(
    image: "assets/images/onbording3.png",
    title: AppText.onbordingTitle3,
    subtitle: AppText.onbordingSupTitle3,
  ),
];

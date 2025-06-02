import 'package:equatable/equatable.dart';
import 'package:to_do_project/featuers/onbording/data/model/onbording_model.dart';

class OnboardingState extends Equatable {
  final int currentPageIndex;
  final List<OnbordingModel> pages;

  const OnboardingState({this.currentPageIndex = 0, required this.pages});

  OnboardingState copyWith({
    int? currentPageIndex,
    List<OnbordingModel>? pages,
  }) {
    return OnboardingState(
      currentPageIndex: currentPageIndex ?? this.currentPageIndex,
      pages: pages ?? this.pages,
    );
  }

  @override
  List<Object> get props => [currentPageIndex, pages];
}

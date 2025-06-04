part of 'introbording_bloc.dart';

@immutable
sealed class IntrobordingState {}

final class IntrobordingInitial extends IntrobordingState {}
final class changethepagestate extends IntrobordingState{
  final int index ;

  changethepagestate({required this.index}); 

// changethepagestate copywith({int? index}){
//   return  changethepagestate(index: index??this.index);
// }
  
}
part of 'my_app_bloc.dart';

@immutable
abstract class MyAppState {}


class PageChangedState extends MyAppState {
  final int currentIndex;

   PageChangedState(this.currentIndex);

  @override
  List<Object?> get props => [currentIndex];
}

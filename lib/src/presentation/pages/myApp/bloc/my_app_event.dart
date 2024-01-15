part of 'my_app_bloc.dart';

@immutable
abstract class MyAppEvent {}

class OnChangePageEvent extends MyAppEvent {
  final int newIndex;

   OnChangePageEvent( this.newIndex);

  @override
  List<Object?> get props => [newIndex];
}

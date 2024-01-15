part of 'home_bloc.dart';

@immutable
abstract class HomeState {

  Map<String, dynamic> getDateSave() {
    return {};
  }
}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {
  final String? countName;
  final String? userName;
  final DateTime? dateTime;
  final bool? available;
  Map<String, dynamic> dateSave;
  HomeSuccess({
     this.countName,
     this.userName,
     this.dateTime,
     this.available,
     required this.dateSave
  });
  @override
  Map<String, dynamic> getDateSave() {
    return dateSave;
  }
}

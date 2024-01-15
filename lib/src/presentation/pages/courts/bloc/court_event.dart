part of 'court_bloc.dart';

@immutable
abstract class CourtEvent {}

class OnCourtLoading extends CourtEvent {}

class OnCourtSuccess extends CourtEvent {}

class OnCourtDetail extends CourtEvent {
  final String courtId;
  OnCourtDetail({required this.courtId});
}

class OnsaveCourtDate extends CourtEvent {
  final String nameCourt;
  final String date;
  final String name;
  final bool available;
  final String img;
  OnsaveCourtDate({
    required this.nameCourt,
    required this.date,
    required this.name,
    required this.available,
    required this.img
  });
}

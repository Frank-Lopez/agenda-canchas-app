part of 'court_bloc.dart';

@immutable
abstract class CourtState {
  bool isLoading() {
    return false;
  }

  CourtModel getCourts() {
    return CourtModel();
  }
  CourtElement getCourt(){
    return CourtElement();
  }
}

final class CourtLoading extends CourtState {
  @override
  bool isLoading() {
    return true;
  }
}

 class CourtSuccess extends CourtState {
  final String msg;
  final CourtModel courtsModel;

  CourtSuccess({
    required this.msg,
    required this.courtsModel,
  });
  @override
  CourtModel getCourts() {
    return courtsModel;
  }
}

class CourtNavigateToDetail extends CourtState {
  final String courtId;

  CourtNavigateToDetail({required this.courtId});
}

class CourtDetailSuccess extends CourtState{
  CourtElement court;
  CourtDetailSuccess({required this.court});
  @override 
  CourtElement getCourt(){
    return court;
  }
}

 class CourtFail extends CourtState {
  final String msgError;
  CourtFail({required this.msgError});
}

class SaveDate extends CourtState{
  
}

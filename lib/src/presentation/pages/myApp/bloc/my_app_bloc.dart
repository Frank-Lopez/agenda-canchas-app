import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'my_app_event.dart';
part 'my_app_state.dart';

class MyAppBloc extends Bloc<MyAppEvent, MyAppState> {
  MyAppBloc() : super(PageChangedState(0)) {
    on<OnChangePageEvent>(_onChangePageEvent);
  }
     _onChangePageEvent(OnChangePageEvent event, Emitter<MyAppState> emit) async {
    emit( PageChangedState(event.newIndex));
  }
  }

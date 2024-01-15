import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<OnHomeSuccess>(_onHomeSuccess);
  }
  _onHomeSuccess(OnHomeSuccess even, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String json = prefs.getString("savedate") ?? "";
      Map<String, dynamic> date = jsonDecode(json);
     


      emit(
      HomeSuccess(dateSave: date)
      );
    } catch (e) {
      print("Error $e");
    }
  }
}

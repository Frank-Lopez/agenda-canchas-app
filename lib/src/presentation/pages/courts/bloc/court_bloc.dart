import 'dart:convert';

import 'package:agenda_canchas_app/src/data/a/court_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'court_event.dart';
part 'court_state.dart';

class CourtBloc extends Bloc<CourtEvent, CourtState> {
        Map<String, dynamic> listCourt = {
        "courts": [
          {
            "id": "123",
            "name": "A",
            "img": "assets/img/cancha A.jpg",
            "description": "Diseñadas para ofrecer velocidad y agilidad en la cancha. \nTecnología Air Zoom en la suela para una amortiguación receptiva. \nParte superior transpirable y ajuste ceñido para mayor estabilidad.",
            "available": true
          },
          {
            "id": "456",
            "name": "B",
            "img": "assets/img/cancha B.jpg",
            "description": "Construcción robusta para resistir el desgaste constante en la pista. \nTecnología Boost en la entresuela para una comodidad y retorno de energía óptimos.\nSuela exterior de alta tracción para un agarre excepcional en diferentes superficies.",
            "available": true
          },
          {
            "id": "789",
            "name": "C",
            "img": "assets/img/cancha c.jpeg",
            "description": "Ofrece un equilibrio entre soporte y comodidad durante los movimientos laterales. \nTecnología Gel en el talón y el antepié para una absorción de impactos eficiente. \nParte superior flexible que se adapta al pie y proporciona ventilación.",
            "available": true
          }
        ]
      };

      
    late CourtModel courtsList; 
  CourtBloc() : super(CourtLoading()) {
    on<OnCourtLoading>(_onCourtLoading);
    on<OnCourtSuccess>(_onCourtSuccess);
    on<OnCourtDetail>(_onCourtDetail);
    on<OnsaveCourtDate>(_onSaveCourtDetail);
  }

  void _onCourtLoading(OnCourtLoading event, Emitter<CourtState> emit) {
    // Puedes realizar alguna lógica específica cuando estás cargando los datos
  }

  void _onCourtSuccess(OnCourtSuccess event, Emitter<CourtState> emit) async {

    try {


      courtsList = CourtModel.fromJson(listCourt);

      emit(CourtSuccess(msg: "Exitoso", courtsModel: courtsList));
    } catch (e) {
      //emit(e);
    }
  }

  void _onCourtDetail(OnCourtDetail event, Emitter<CourtState> emit) {
    try {
    emit(CourtNavigateToDetail(courtId:event.courtId));
   courtsList = CourtModel.fromJson(listCourt);
   for (var element in courtsList.courts!) {
    if (event.courtId == element.id) {
      CourtElement court = element;
    emit(CourtDetailSuccess(court: court));
    }
   }
    } catch (e) {
      
    }
  }

  _onSaveCourtDetail(OnsaveCourtDate even, Emitter<CourtState>emit)async{
   try {
    Map<String, dynamic> saveDate = {
      "namecourt": even.nameCourt,
      "name": even.name,
      "date": even.date,
      "available": even.available,
      "img": even.img
    };

   
    String jsonString = jsonEncode(saveDate);

    
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("savedate", jsonString);

  
  } catch (e) {
    // Manejar excepciones según sea necesario
    print("Error al guardar en SharedPreferences: $e");
  }
  }
}

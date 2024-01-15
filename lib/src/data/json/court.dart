import 'dart:convert';

class courtDate {
  Map<String, dynamic> listCourt = {
    "courts": [
      {
        "name": "Cancha",
        "img": "img",
        "description": "lalala",
        "available": true
      },
      {
        "name": "Cancha",
        "img": "img",
        "description": "lalala",
        "available": true
      },
      {
        "name": "Cancha",
        "img": "img",
        "description": "lalala",
        "available": true
      }
    ]
  };
   creatJson(){
    String jsonString = jsonEncode(listCourt);
    return jsonString;
  }
}

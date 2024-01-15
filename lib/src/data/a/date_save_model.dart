import 'dart:convert';

class DateSaveModel {
    final String? namecourt;
    final String? name;
    final String? date;
    final String? available;

    DateSaveModel({
         this.namecourt,
         this.name,
         this.date,
         this.available,
    });

    factory DateSaveModel.fromRawJson(String str) => DateSaveModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DateSaveModel.fromJson(Map<String, dynamic> json) => DateSaveModel(
        namecourt: json["namecourt"],
        name: json["name"],
        date: json["date"],
        available: json["available"],
    );

    Map<String, dynamic> toJson() => {
        "namecourt": namecourt,
        "name": name,
        "date": date,
        "available": available,
    };
}

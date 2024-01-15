import 'dart:convert';

class CourtModel {
    final List<CourtElement>? courts;

    CourtModel({
       this.courts,
    });

    factory CourtModel.fromRawJson(String str) => CourtModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CourtModel.fromJson(Map<String, dynamic> json) => CourtModel(
        courts: List<CourtElement>.from(json["courts"].map((x) => CourtElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "courts": List<dynamic>.from(courts!.map((x) => x.toJson())),
    };
}

class CourtElement {
    final String? id;
    final String? name;
    final String? img;
    final String? description;
    final bool? available;

    CourtElement({
      this.id,
         this.name,
         this.img,
         this.description,
         this.available,
    });

    factory CourtElement.fromRawJson(String str) => CourtElement.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CourtElement.fromJson(Map<String, dynamic> json) => CourtElement(
        id: json["id"],
        name: json["name"],
        img: json["img"],
        description: json["description"],
        available: json["available"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "img": img,
        "description": description,
        "available": available,
    };
}

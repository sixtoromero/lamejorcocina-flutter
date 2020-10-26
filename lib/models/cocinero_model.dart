import 'dart:convert';

CocineroModel cocineroModelFromJson(String str) => CocineroModel.fromJson(json.decode(str));

String cocineroModelToJson(CocineroModel data) => json.encode(data.toJson());

class CocineroModel {
    CocineroModel({
        this.idCocinero,
        this.nombre,
        this.apellido1,
        this.apellido2,
    });

    int idCocinero;
    String nombre;
    String apellido1;
    String apellido2;

    factory CocineroModel.fromJson(Map<String, dynamic> json) => CocineroModel(
        idCocinero: json["IdCocinero"],
        nombre: json["Nombre"],
        apellido1: json["Apellido1"],
        apellido2: json["Apellido2"],
    );

    Map<String, dynamic> toJson() => {
        "IdCocinero": idCocinero,
        "Nombre": nombre,
        "Apellido1": apellido1,
        "Apellido2": apellido2,
    };
}
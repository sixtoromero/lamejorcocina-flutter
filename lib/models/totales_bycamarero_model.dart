import 'dart:convert';

TotalesByCamareroModel totalesByCamareroModelFromJson(String str) => TotalesByCamareroModel.fromJson(json.decode(str));

String totalesByCamareroModelToJson(TotalesByCamareroModel data) => json.encode(data.toJson());

class TotalesByCamareroModel {
    TotalesByCamareroModel({
        this.idCamarero,
        this.nombre,
        this.apellido1,
        this.apellido2,
        this.mes,
        this.total,
    });

    int idCamarero;
    String nombre;
    String apellido1;
    String apellido2;
    String mes;
    double total;

    factory TotalesByCamareroModel.fromJson(Map<String, dynamic> json) => TotalesByCamareroModel(
        idCamarero: json["IdCamarero"],
        nombre: json["Nombre"],
        apellido1: json["Apellido1"],
        apellido2: json["Apellido2"],
        mes: json["Mes"],
        total: json["Total"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "IdCamarero": idCamarero,
        "Nombre": nombre,
        "Apellido1": apellido1,
        "Apellido2": apellido2,
        "Mes": mes,
        "Total": total,
    };
}
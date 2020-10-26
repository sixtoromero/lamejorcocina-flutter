// To parse this JSON data, do
//
//     final clientesMayorCompraModel = clientesMayorCompraModelFromJson(jsonString);

import 'dart:convert';

ClientesMayorCompraModel clientesMayorCompraModelFromJson(String str) => ClientesMayorCompraModel.fromJson(json.decode(str));

String clientesMayorCompraModelToJson(ClientesMayorCompraModel data) => json.encode(data.toJson());

class ClientesMayorCompraModel {
    ClientesMayorCompraModel({
        this.idCliente,
        this.nombre,
        this.apellido1,
        this.apellido2,
        this.observaciones,
        this.total,
    });

    int idCliente;
    String nombre;
    String apellido1;
    String apellido2;
    String observaciones;
    double total;

    factory ClientesMayorCompraModel.fromJson(Map<String, dynamic> json) => ClientesMayorCompraModel(
        idCliente: json["IdCliente"],
        nombre: json["Nombre"],
        apellido1: json["Apellido1"],
        apellido2: json["Apellido2"],
        observaciones: json["Observaciones"],
        total: json["Total"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "IdCliente": idCliente,
        "Nombre": nombre,
        "Apellido1": apellido1,
        "Apellido2": apellido2,
        "Observaciones": observaciones,
        "Total": total,
    };
}

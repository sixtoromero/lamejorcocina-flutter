import 'dart:convert';

ViewFacturaModel viewFacturaModelFromJson(String str) => ViewFacturaModel.fromJson(json.decode(str));

String viewFacturaModelToJson(ViewFacturaModel data) => json.encode(data.toJson());

class ViewFacturaModel {
    ViewFacturaModel({
        this.idFactura,
        this.cliente,
        this.camarero,
        this.mesa,
        this.fecha,
    });

    int idFactura;
    String cliente;
    String camarero;
    String mesa;
    String fecha;

    factory ViewFacturaModel.fromJson(Map<String, dynamic> json) => ViewFacturaModel(
        idFactura: json["IdFactura"],
        cliente: json["Cliente"],
        camarero: json["Camarero"],
        mesa: json["Mesa"],
        fecha: json["Fecha"],
    );

    Map<String, dynamic> toJson() => {
        "IdFactura": idFactura,
        "Cliente": cliente,
        "Camarero": camarero,
        "Mesa": mesa,
        "Fecha": fecha,
    };
}

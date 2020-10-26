import 'dart:convert';

UsuarioModel usuarioModelFromJson(String str) => UsuarioModel.fromJson(json.decode(str));

String usuarioModelToJson(UsuarioModel data) => json.encode(data.toJson());

class UsuarioModel {
    
    int idUsuario;
    String nombreUsuario;
    String clave;
    String token;

    UsuarioModel({
        this.idUsuario,
        this.nombreUsuario = '',
        this.clave = '',
        this.token = '',
    });    

    factory UsuarioModel.fromJson(Map<String, dynamic> json) => UsuarioModel(
        idUsuario       : json["IdUsuario"],
        nombreUsuario   : json["NombreUsuario"],
        clave           : json["Clave"],
        token           : json["Token"],
    );

    Map<String, dynamic> toJson() => {
        "IdUsuario"     : idUsuario,
        "NombreUsuario" : nombreUsuario,
        "Clave"         : clave,
        "Token"         : token,
    };
}

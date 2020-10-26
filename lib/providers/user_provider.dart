import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lamejorcocina/models/users_model.dart';

class UserProvider {
  final String _url = 'http://94d069513ca0.ngrok.io';

  Future<UsuarioModel> login(UsuarioModel model) async {

    final url = '$_url/api/Auth/getLogin';
    final authData = {
      'IdUsuario': 0,
      'NombreUsuario': model.nombreUsuario,
      'Clave': model.clave,
      'Token': ''
    };    

    final resp = await http.post(url, body: json.encode(authData), headers: {
      "Accept": "application/json",
      "content-type": "application/json"
    });

    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final UsuarioModel user = new UsuarioModel();
      
    //print(decodedData);

    if (decodedData == null) return new UsuarioModel();

    if (decodedData["IsSuccess"] == true) {

      dynamic result = decodedData['Data'];

      final itemTemp = UsuarioModel.fromJson(result);
      user.idUsuario = itemTemp.idUsuario;
      user.nombreUsuario = itemTemp.nombreUsuario;
      user.token = itemTemp.token;

    } else {
      user.token = '';
      return user;
    }

    return user;

  }

  Future<String> register(UsuarioModel model) async {

    final url = '$_url/api/Auth/InsertAsync';
    final authData = {
      'NombreUsuario': model.nombreUsuario,
      'Clave': model.clave
    };

    final resp = await http.post(url, body: json.encode(authData), headers: {
      "Accept": "application/json",
      "content-type": "application/json"
    });

    final Map<String, dynamic> decodedData = json.decode(resp.body);    
    if (decodedData == null) return 'No pudiste registrarte inténtalo nuevamente';

    if (decodedData["IsSuccess"] == true) {
      return "success";
    } else {
      return decodedData['Data'];
    }
  }
}
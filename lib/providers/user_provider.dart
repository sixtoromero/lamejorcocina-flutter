import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lamejorcocina/models/users_model.dart';

class UserProvider {
  final String _url = 'http://5cf0e071e976.ngrok.io';

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

    print(resp.body);

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
  
}
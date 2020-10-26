import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lamejorcocina/models/cocinero_model.dart';

class ChefProvider {
  final String _url = 'http://94d069513ca0.ngrok.io';

  Future<List<CocineroModel>> getAllAsync() async {

    final url = '$_url/api/Cocinero/GetAllAsync';
    final resp = await http.get(url);
    
    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final List<CocineroModel> reporte = new List();
    
    if (decodedData == null) return [];

    if (decodedData["IsSuccess"] == true) {

      dynamic result = decodedData['Data'];
     
      result.forEach((item) {
          final itemTemp = CocineroModel.fromJson(item);
          reporte.add(itemTemp);
        }
      );
    } else {
      return reporte;
    }

    return reporte;
  }
  
}
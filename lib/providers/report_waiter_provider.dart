import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lamejorcocina/models/cliente_model.dart';
import 'package:lamejorcocina/models/response_model.dart';
import 'package:lamejorcocina/models/totales_bycamarero_model.dart';


class ReportWaiterProvider {
  final String _url = 'http://94d069513ca0.ngrok.io';

  Future<List<ClienteModel>> getClientesMayorCompra() async {

    final url = '$_url/api/Cliente/GetClientesMayorCompra';
    final resp = await http.get(url);
    
    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final List<ClienteModel> reporte = new List();
    
    if (decodedData == null) return [];

    if (decodedData["IsSuccess"] == true) {

      dynamic result = decodedData['Data'];
     
      result.forEach((item) {
          final itemTemp = ClienteModel.fromJson(item);
          reporte.add(itemTemp);
        }
      );
    } else {
      return reporte;
    }

    print(reporte);

    return reporte;
  }

  /*Future<ResponseModel<List<ClienteModel>>> getClientesMayorCompraV2() async {

    final url = '$_url/api/Cliente/GetClientesMayorCompra';
    final resp = await http.get(url);
    
    final Map<String, ResponseModel<List<ClienteModel>>> decodedData = json.decode(resp.body);
    final ResponseModel<List<ClienteModel>> reporte = new ResponseModel<List<ClienteModel>>();
    
    if (decodedData == null) return ResponseModel<List<ClienteModel>>();

    if (decodedData["IsSuccess"] == true) {

      dynamic result = decodedData['Data'];
     
      result.forEach((item) {
          final itemTemp = ClienteModel.fromJson(item);
          reporte.data.add(itemTemp);
        }
      );
    } else {
      return reporte;
    }

    print(reporte);

    return reporte;
  }*/

  Future<List<TotalesByCamareroModel>> getTotalesporCamarero() async {

    final url = '$_url/api/ViewFactura/GetTotalesporCamarero';
    final resp = await http.get(url);
    
    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final List<TotalesByCamareroModel> reporte = new List();
    
    if (decodedData == null) return [];

    if (decodedData["IsSuccess"] == true) {

      dynamic result = decodedData['Data'];
     
      result.forEach((item) {
          final itemTemp = TotalesByCamareroModel.fromJson(item);
          reporte.add(itemTemp);
        }
      );
    } else {
      return reporte;
    }

    return reporte;
  }

}
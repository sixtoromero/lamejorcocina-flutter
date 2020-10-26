import 'package:flutter/material.dart';
import 'package:lamejorcocina/models/cliente_mayor_compra_model.dart';
import 'package:lamejorcocina/models/cliente_model.dart';
import 'package:lamejorcocina/providers/report_waiter_provider.dart';
import 'package:intl/intl.dart';

class ReportCustomerView extends StatelessWidget {

  final report = new ReportWaiterProvider();
  final oCcy = new NumberFormat("#,##0.00", "es_US");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF26ADC1),
      appBar: AppBar(
        title: Text('Compras mayores a 100.000'),
      ),
      body: _crearListado(),
    );    
  }

  Widget _crearListado() {
    return FutureBuilder(
      future: report.getClientesMayorCompra(),
      builder: (BuildContext context, AsyncSnapshot<List<ClienteModel>> snapshot){
        if (snapshot.hasData){
          
          final items = snapshot.data;

          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (countext, i) => _crearItem(items[i]),
          );

        } else {
          return Center(child: CircularProgressIndicator(
            backgroundColor: Colors.white,
          ),);
        }
      },
    );
  }

  Widget _crearItem(ClienteModel model) {
    
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 5.0, right: 10.0, bottom: 2.0),
      child: Stack(
        children: [
          Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
            child: ListTile(
              trailing: Column(
                children: [
                  Icon(Icons.attach_money, color: Colors.black,),
                  Text(oCcy.format(model.total), style: TextStyle(color: Color(0XFF26ADC1), fontSize: 15, fontWeight: FontWeight.bold),)                  
                ],
              ),
              title: Text('${model.nombre} ${model.apellido1} ${model.apellido2}'),
              subtitle: Text(model.observaciones, style: TextStyle(color: Color(0XFF26ADC1), fontWeight: FontWeight.bold),),
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:lamejorcocina/models/totales_bycamarero_model.dart';
import 'package:lamejorcocina/providers/report_waiter_provider.dart';
import 'package:intl/intl.dart';

//import 'package:lamejorcocina/models/users_model.dart';

class ReportWaiterView extends StatelessWidget {
  

  //const ReportWaiterView({Key key}) : super(key: key);

  final report = new ReportWaiterProvider();
  final oCcy = new NumberFormat("#,##0.00", "es_US");

  @override
  Widget build(BuildContext context) {    

    return Scaffold(
      backgroundColor: Color(0XFF26ADC1),
      appBar: AppBar(title: Text('Venta por Camarero'),),
      body: _crearListado(),
    );
  }

  Widget _crearListado() {
    return FutureBuilder(
      future: report.getTotalesporCamarero(),
      builder: (BuildContext context, AsyncSnapshot<List<TotalesByCamareroModel>> snapshot){
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

  Widget _crearItem(TotalesByCamareroModel model) {

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
                  Icon(Icons.calendar_today, color: Colors.black,),
                  Text(model.mes)
                ],
              ),
              title: Text('${model.nombre} ${model.apellido1} ${model.apellido2}'),
              subtitle: Text(oCcy.format(model.total), style: TextStyle(color: Color(0XFF26ADC1), fontSize: 15, fontWeight: FontWeight.bold),),
            ),
          ),
        ],
      ),
    );
  }
}
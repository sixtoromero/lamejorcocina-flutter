import 'package:flutter/material.dart';

import 'package:lamejorcocina/models/cocinero_model.dart';
import 'package:lamejorcocina/providers/chef_provider.dart';

class ChefView extends StatefulWidget {
  //const ChefView({Key key}) : super(key: key);

  @override
  _ChefViewState createState() => _ChefViewState();
}

class _ChefViewState extends State<ChefView> {
  final provider = new ChefProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chef')),
      body: SafeArea(
        child: _crearListado(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
            Navigator.pushNamed(context, 'addchef');
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }

  Widget _crearListado() {
    return FutureBuilder(
      future: provider.getAllAsync(),
      builder: (BuildContext context, AsyncSnapshot<List<CocineroModel>> snapshot){
        if (snapshot.hasData){
          
          final items = snapshot.data;

          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (countext, i) => _crearItem(context, items[i]),
          );

        } else {
          return Center(child: CircularProgressIndicator(
            backgroundColor: Colors.white,
          ),);
        }
      },
    );
  }

  Widget _crearItem(BuildContext context, CocineroModel model) {
    return Stack(
      children: [
        Divider(thickness: 2.0,),
        Dismissible(
          key: UniqueKey(),
          background: Container(
            color: Color(0XFF26ADC1),
          ),
          child: ListTile(
            title: Text('${model.nombre} ${model.apellido1} ${model.apellido2}'),
            subtitle: Text('ID Chef: ${model.idCocinero}'),
            trailing: Icon(Icons.drag_indicator_outlined, color: Colors.black,),
            onTap: () => Navigator.pushNamed(context, 'addchef'),
          ),
        ),
        Divider(thickness: 2.0,),
      ],
    );
  }
}
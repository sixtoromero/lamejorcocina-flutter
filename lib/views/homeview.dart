import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:lamejorcocina/views/reportcustomerview.dart';
import 'package:lamejorcocina/views/reportwaiterview.dart';
import 'package:elastic_drawer/elastic_drawer.dart';


class Homeview extends StatefulWidget {
  const Homeview({Key key}) : super(key: key);

  @override
  _HomeviewState createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  
  int _page = 0;

  final _pageOptions = [
    ReportWaiterView(),
    ReportCustomerView(),
  ];

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: ElasticDrawer(
        mainColor: Color(0XFF26ADC1),
        drawerColor: Colors.blue,
        mainChild: Scaffold(          
          body: _pageOptions[_page],
          bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: Color(0XFF26ADC1),
            items: [
              Icon(Icons.list_alt_rounded, size: 20, color: Colors.black),
              Icon(Icons.list_outlined, size: 20, color: Colors.black),
            ],
            animationDuration: Duration(
              milliseconds: 500
            ),
            //index: pageindex,
            animationCurve: Curves.bounceOut,
            onTap: (index){
              setState(() {
                _page = index;
              });
            },
          ),
        ),
        drawerChild: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Divider(thickness: 2.0,),
              ListTile(
                leading: Icon(Icons.person_pin, color: Colors.white,),
                title: Text('Cocineros', style: TextStyle(color: Colors.white),),
                onTap: () => {
                  ElasticDrawerKey.drawer.currentState.closeElasticDrawer(context),
                  Navigator.pushNamed(context, 'chef')
                },
              ),
              Divider(thickness: 2.0,),
              ListTile(
                leading: Icon(Icons.person_outline_rounded, color: Colors.white,),
                title: Text('Camarero', style: TextStyle(color: Colors.white),),
                onTap: () => {
                  ElasticDrawerKey.drawer.currentState.closeElasticDrawer(context)
                },
              ),
              Divider(thickness: 2.0,),
              ListTile(
                leading: Icon(Icons.table_chart_outlined, color: Colors.white,),
                title: Text('Mesa', style: TextStyle(color: Colors.white),),
                onTap: () => {
                  ElasticDrawerKey.drawer.currentState.closeElasticDrawer(context)
                },
              ),
              Divider(thickness: 2.0,),
              ListTile(
                leading: Icon(Icons.person_rounded, color: Colors.white,),
                title: Text('Cliente', style: TextStyle(color: Colors.white),),
                onTap: () => {
                  ElasticDrawerKey.drawer.currentState.closeElasticDrawer(context),
                  Navigator.pushNamed(context, 'chef')
                },
              ),
              Divider(thickness: 2.0,),
              ListTile(
                leading: Icon(Icons.attach_money, color: Colors.white,),
                title: Text('Compras', style: TextStyle(color: Colors.white),),
                onTap: () => {
                  ElasticDrawerKey.drawer.currentState.closeElasticDrawer(context)
                },
              ),
              Divider(thickness: 2.0,),
              ListTile(
                leading: Icon(Icons.close, color: Colors.white,),
                title: Text('Cerrar Sessión', style: TextStyle(color: Colors.white),),
                onTap: () => {
                  ElasticDrawerKey.drawer.currentState.closeElasticDrawer(context),
                  Navigator.pushReplacementNamed(context, 'login'),
                },
              ),
              
              Divider(thickness: 2.0,),
            ],
          ),
        ),
      )
    );
  }
}
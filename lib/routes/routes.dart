import 'package:flutter/material.dart';
import 'package:lamejorcocina/views/addchef.dart';
import 'package:lamejorcocina/views/adduserview.dart';
import 'package:lamejorcocina/views/chefview.dart';
import 'package:lamejorcocina/views/customerview.dart';
import 'package:lamejorcocina/views/example.dart';
import 'package:lamejorcocina/views/homeview.dart';
import 'package:lamejorcocina/views/loginview.dart';
import 'package:lamejorcocina/views/tableview.dart';
import 'package:lamejorcocina/views/waiterview.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return  <String, WidgetBuilder>{
    'home'          : (BuildContext context) => Homeview(),
    'login'         : (BuildContext context) => LoginView(),
    'addUser'       : (BuildContext context) => AddUserView(), 
    'customer'      : (BuildContext context) => CustomerView(),
    'chef'          : (BuildContext context) => ChefView(),
    'addchef'       : (BuildContext context) => AddChefView(),
    'waiter'        : (BuildContext context) => WaiterView(),
    'table'         : (BuildContext context) => TableView(),
    'example'       : (BuildContext context) => ExampleView(),
  };
}
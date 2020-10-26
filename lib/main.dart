import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lamejorcocina/bloc/provider.dart';

import 'package:lamejorcocina/routes/routes.dart';
import 'package:lamejorcocina/views/loginview.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        title: 'La Mejor Cocina',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          // ... app-specific localization delegate[s] here
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [        
            const Locale('es', 'ES'),
        ],
        initialRoute: 'login',
        routes: getApplicationRoutes(),
        onGenerateRoute: (RouteSettings settings){
          return MaterialPageRoute(
            builder: (BuildContext context) => LoginView()
          );
        },
        home: Scaffold(
          appBar: AppBar(
            title: Text('La Mejor Cocina'),
          ),
          body: Center(
            child: Container(
              child: Text('Hello World'),
            ),
          ),
        ),
      ),
    );
  }
}

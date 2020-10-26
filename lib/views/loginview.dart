import 'package:flutter/material.dart';
import 'package:lamejorcocina/bloc/login_bloc.dart';
import 'package:lamejorcocina/bloc/provider.dart';
import 'package:lamejorcocina/models/users_model.dart';
import 'package:lamejorcocina/providers/user_provider.dart';

class LoginView extends StatelessWidget {
  //const LoginView({Key key}) : super(key: key);

  final provider = new UserProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            _crearfondo(context),
            _loginForm(context)
          ],
        ),
      )
    );
  }

  _crearfondo(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final backgroundColor = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color> [
            Color.fromRGBO(0, 51, 102, 1.0),
            Color.fromRGBO(38, 173, 193, 1.0)
          ]
        )
      ),
    );

    return Stack(
      children: [
        backgroundColor,
        Opacity(
          opacity: 0.2,
          child: Stack(
            children: [
              Positioned(top: 10.0, left: 20.0, child: _crearCirculo('food4.jpg')),
              Positioned(top: 110.0, left: 200.0, child: _crearCirculo('food2.jpg')),
            ],
          ),
        ),        
        Container(
          padding: EdgeInsets.only(top: 80.0),
          child: Column(
            children: <Widget>[ 
              SizedBox(height: 10.0, width: double.infinity),
              Icon(Icons.food_bank_outlined, color: Colors.white, size: 100.0),
              Text('La Mejor Cocina', style: TextStyle(color: Colors.white, fontSize: 25.0))
            ],
          )
        )

      ],
    );
  }

  Widget _crearCirculo(String image) {    
    return Container(
      width: 200.0,
      height: 200.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Color.fromRGBO(255, 255, 255, 0.05),
        image: DecorationImage(
          image: AssetImage('assets/images/$image'),
          fit: BoxFit.fill,
        )
      ),
    );
  }

  Widget _loginForm(BuildContext context) {
    
    final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          SafeArea(
            child: Container(
              height: 180.0,
            )
          ),
          Container(
            width: size.width * 0.85,
            margin: EdgeInsets.symmetric(vertical: 50.0),
            padding: EdgeInsets.symmetric(vertical: 50.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3.0,
                  offset: Offset(0.0, 5.0),
                  spreadRadius: 1.0
                )
              ]
            ),
            child: Column(
              children: [
                Text('Login', style: TextStyle(fontSize: 20.0)),
                SizedBox(height: 60.0),
                _crearUserName(bloc),
                SizedBox(height: 20.0),
                _crearPassword(bloc),
                SizedBox(height: 20.0),
                _crearBotonIngresar(bloc),
                SizedBox(height: 10.0),
                _crearBotonRegistrar(context),

              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _crearUserName(LoginBloc bloc) {
    return StreamBuilder(
      stream:   bloc.usernameStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
          return Container(
              child: Container ( 
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(            
                  decoration: InputDecoration(
                    icon: Icon(Icons.input_outlined, color: Color(0XFF26ADC1)),
                    hintText: 'Nombre de Usuario',
                    labelText: 'Ingrese un usuario válido',
                    errorText: snapshot.error
                  ),
                  onChanged: bloc.changeUserName,
                ),
            ),
        );
      },
    );
  }

  _crearPassword(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container(
            child: Container ( 
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(           
                obscureText: true, 
                decoration: InputDecoration(
                  icon: Icon(Icons.security_outlined, color: Color(0XFF26ADC1)),
                  hintText: 'Contraseña',
                  labelText: 'Ingrese una contraseña válida',
                  //counterText: snapshot.data,
                  errorText: snapshot.error
                ),
                onChanged: bloc.changePassword,
              )
          )
        );
      },
    );
  }

  Widget _crearBotonIngresar(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return RaisedButton (
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: Text('Ingresar'),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0)
          ),
              elevation: 0.0,
              color: Color(0XFF26ADC1),
              textColor: Colors.white,
              onPressed: snapshot.hasData ? ()=> _login(bloc, context) : null,
        );
      },
    );
    
  }

  Widget _crearBotonRegistrar(BuildContext context) {    
    return OutlineButton (
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 65.0, vertical: 0.0),
        child: Text('Registrarme', style: TextStyle(color: Color(0XFF26ADC1)),),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0)
      ),          
      color: Color(0XFF26ADC1),
      textColor: Colors.white,
      onPressed: (){
        //Navigator.pushReplacementNamed(context, 'home');
        Navigator.pushNamed(context, 'addUser');
      },
    );
  }

  _login(LoginBloc bloc, BuildContext context) async {

    UsuarioModel model = new UsuarioModel();
    model.nombreUsuario = bloc.username;
    model.clave = bloc.password;

    final resp = await provider.login(model);

    if (resp.token != '' && resp.token != null){
      Navigator.pushReplacementNamed(context, 'home');
    } else {
      _showToast(context, 'Usuario o clave incorrecto');
    }

  }

  void _showToast(BuildContext context, String message) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(message),
        action: SnackBarAction(
            label: 'aceptar', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}
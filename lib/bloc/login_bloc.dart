import 'dart:async';
import 'package:lamejorcocina/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators {
  
  final _usernameController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();  

  Stream<String> get usernameStream => _usernameController.stream.transform(validarLength);
  Stream<String> get passwordStream => _passwordController.stream.transform(validarLength);
  
  Stream<bool> get formValidStream => 
      Rx.combineLatest2(usernameStream, passwordStream, (e, p) => true);

  //Insertar valores al Stream
  Function(String) get changeUserName => _usernameController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  //Obtener el último valor ingresado a los streams
  String get username => _usernameController.value;
  String get password => _passwordController.value;

  dispose() {
    _usernameController?.close();
    _passwordController?.close();
  }


}
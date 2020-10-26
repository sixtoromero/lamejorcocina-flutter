import 'dart:async';

class Validators {

  final validarEmail = StreamTransformer<String, String>.fromHandlers(
      handleData: (email, sink) {
        //Expresión regular para correos
        Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
        RegExp regExp = new RegExp(pattern);
        if (regExp.hasMatch(email)) {
          sink.add(email);
        } else {
          sink.addError('Email no es correcto');
        }
      }        
  );

  // final validarPassword = StreamTransformer<String, String>.fromHandlers(
  //   handleData: (password, sink) {
  //     if (password.length >= 5 ){
  //       sink.add(password);
  //     } else {
  //       sink.addError('Más de 6 caracteres por favor');
  //     }
  //   }      
  // );


  final validarLength = StreamTransformer<String, String>.fromHandlers(
    handleData: (value, sink) {
      if (value.length >= 5 ){
        sink.add(value);
      } else {
        sink.addError('Más de 5 caracteres por favor');
      }
    }
  );

}
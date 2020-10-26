import 'package:flutter/material.dart';
import 'package:lamejorcocina/models/cocinero_model.dart';

class AddChefView extends StatefulWidget {
  //const AddChefView({Key key}) : super(key: key);

  @override
  _AddChefViewState createState() => _AddChefViewState();
}

class _AddChefViewState extends State<AddChefView> {
  
  final formKey = GlobalKey<FormState>();

  CocineroModel chef = new CocineroModel();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Chef'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                _crearNombres(),
                _crearApellido1(),
                _crearApellido2(),                
              ],
            ),
          )
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _saveChef(),
        child: Icon(Icons.save),
        backgroundColor: Color(0XFF26ADC1),
      ),
    );
  }

  Widget _crearNombres(){
    return TextFormField(
      initialValue: chef.nombre,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Nombres'
      ),
      onSaved: (value) => chef.nombre,
      validator: (value) {
        if (value.length < 5) {
          return 'Ingrese los nombres del Chef';
        } 
        else {
          return null;
        }
      },
    );
  }

  Widget _crearApellido1() {
    return TextFormField(
      initialValue: chef.apellido1,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Primer Apellido'
      ),
      onSaved: (value) => chef.apellido1,
      validator: (value) {
        if (value.length < 5) {
          return 'Ingrese el primer apellido del Chef';
        } 
        else {
          return null;
        }
      },
    );
  }

  Widget _crearApellido2() {
    return TextFormField(
      initialValue: chef.apellido2,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Segundo Apellido'
      ),
      onSaved: (value) => chef.apellido2,
      validator: (value) {
        if (value.length < 5) {
          return 'Ingrese el segundo apellido del Chef';
        } 
        else {
          return null;
        }
      },
    );
  }

  Widget _crearBoton() {
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      color: Color(0XFF26ADC1),
      label: Text('Guardar'),
      icon: Icon(Icons.save),
      onPressed: (){},
    );
  }

  void _saveChef() {
    
    if(!formKey.currentState.validate()) return;
    


  }
}
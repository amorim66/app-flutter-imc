
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyWidget(),
  ));
}

class MyWidget extends StatefulWidget{
  const MyWidget({super.key});
  
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget>{
  String _info = "Informe seus dados:";

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController etanolController = TextEditingController();
  TextEditingController gasolinaController = TextEditingController();

  void _resetFields(){
    gasolinaController.text = '';
    etanolController.text = '';
    setState(() {
      _info ="Informe seus dados.";
      _formKey = GlobalKey<FormState>();
    });
  }

  void _calcular(){
    setState(() {
      double gasolina = double.parse(gasolinaController.text);
      double etanol = double.parse(etanolController.text);
      

      if (etanol <= gasolina * 0.7) {
        _info = 'É vantajoso colocar Etanol! ';
      } else{
        _info = 'É vantajoso colocar Gasolina! ';
      }

      // if (imc < 18.6) {
      //   _info = 'Abaixo do Peso (${imc.toStringAsPrecision(3)})';
      // } else if (imc >= 18.6 && imc < 24.9){
      //   _info = 'Peso Ideal (${imc.toStringAsPrecision(3)})';
      // } else if (imc >= 24.9 && imc < 29.9){
      //   _info = 'Levemente Acima do Peso (${imc.toStringAsPrecision(3)})';
      // } else if (imc >= 29.9 && imc < 34.9){
      //   _info = 'Obesidade Grau I (${imc.toStringAsPrecision(3)})';
      // } else if (imc >= 34.9 && imc < 39.9){
      //   _info = 'Obesidade Grau II (${imc.toStringAsPrecision(3)})';
      // } else if (imc >= 40){
      //   _info = 'Obesidade Grau III (${imc.toStringAsPrecision(3)})';
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(
        title: const Text("Etenol ou Gasolina?"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 175, 76, 76),
        actions: <Widget>[
          IconButton(onPressed: _resetFields, icon: const Icon(Icons.refresh))
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const Icon(Icons.whatshot_rounded,
                      size: 120.0, color: Color.fromARGB(255, 175, 76, 76)),
                  TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          labelText: "Digite o valor do Etanol",
                          labelStyle: TextStyle(color: Color.fromARGB(255, 175, 76, 76))),
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Color.fromARGB(255, 175, 76, 76), fontSize: 20.0),
                          controller: etanolController,
                          validator: (value) {
                            if(value!.isEmpty){
                              return "Insira seu Peso!";
                            }
                            return null;
                          },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                          labelText: "Digite o valor da gasolina",
                          labelStyle: TextStyle(color: Color.fromARGB(255, 175, 76, 76))),
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Color.fromARGB(255, 175, 76, 76), fontSize: 20.0),
                    controller: gasolinaController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Insira sua Altura!";
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: ElevatedButton(
                      onPressed:() {
                        if (_formKey.currentState!.validate()) {
                          _calcular();
                        }
                      },
                      child: const Text(
                        'Calcular',
                        style: TextStyle(color: Color.fromARGB(255, 175, 76, 76), fontSize: 25.0),
                      ),
                    ),
                  ),
                  Text(
                    _info,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Color.fromARGB(255, 175, 76, 76), fontSize: 25.0),
                  )
                ],
              )))
    ));
  }
}





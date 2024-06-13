import 'package:flutter/material.dart';
import 'package:first_app/gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        //backgroundColor: Colors.indigo,
       
        body: GradientContainer(<Color>[Color.fromRGBO(0, 242, 255, 1),
              Color.fromARGB(255, 1, 33, 123)]),
      ),
    ),
  );
}

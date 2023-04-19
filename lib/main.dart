import 'package:calculator_app/calculator_view.dart';
import 'package:flutter/material.dart';
void main() =>
    runApp(MyApp(
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //import calculator_view.dart function
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator App',
        //call class 'CalculatorHome'
        home: CalculatorHome(

      ),
    );
  }
}



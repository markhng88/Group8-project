import 'package:calculator_app/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';
//import 'dart:math' as math;
import 'package:math_expressions/math_expressions.dart';
import 'package:calculator_app/ui/styles/text_styles.dart';
import 'package:calculator_app/ui/styles/color_styles.dart';
import 'package:calculator_app/ui/constants/contextExtension.dart';

class CalculatorHome extends StatefulWidget {
  @override
  _CalculatorHomeState createState() => _CalculatorHomeState();
}

class _CalculatorHomeState extends State<CalculatorHome> {

  var assetsImage = new AssetImage('images/icon.png');

  //User input/output data information
  var userAsk = '';
  var userAnswer = '';

  //calculator button list
  final List<String> buttons = [
    'C',
    'DEL',
    '.',
    '+',
    '-',
    '9',
    '8',
    '7',
    '*',
    '/',
    '4',
    '5',
    '6',
    '(',
    ')',
    '3',
    '2',
    '1',
    '0',
    '='

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // take the background color setting from color_styles.dart
      backgroundColor: UIColorStyles.background,
        body: Column(
        children: [
          Expanded(
            flex:1,
            child: Align(
              alignment: Alignment.topLeft,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                  'images/icon.png',
                  width: 50,
                  height: 50,
                ),
                  Text(
                    ' Calculator App',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF6A5ACD),
                      letterSpacing: 1.0,
                      wordSpacing: 2.0,
                      height: 1.5,
                      shadows: [
                        Shadow(
                          blurRadius: 2.0,
                          color: Colors.grey,
                          offset: Offset(5.0, 1.0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
              ),

          Expanded(
              flex: 2,
              child: Container(
                child: calculateField(),
              )),
          Expanded(
            flex: 3,
            child: buildContainerButtonsField(),
          ),
        ],
      ),
    );
  }

  //button width setting
  Container buildContainerButtonsField() {
    return Container(
      child: GridView.builder(
          itemCount: buttons.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
          itemBuilder: (BuildContext context, int index) {
            // Clear Number Button
            if (index == 0) {
              return CalculatorButton(
                buttonTapped: () {
                  setState(() {
                    userAsk = '';
                    userAnswer = '';
                  });
                },
                buttonText: buttons[index],
                color: UIColorStyles.GREEN_MODE,
              );
            }
            // Delete function
            else if (index == 1) {
              return CalculatorButton(
                buttonTapped: () {
                  setState(() {
                    userAsk = userAsk.substring(0, userAsk.length - 1);
                  });
                },
                buttonText: buttons[index],
                color: UIColorStyles.RED_MODE,
              );
            }
            // Equal function
            else if (index == buttons.length - 1) {
              return CalculatorButton(
                buttonTapped: () {
                  setState(() {
                    equalPressed();
                  });
                },
                buttonText: buttons[index],
                color: UIColorStyles.DEEP_MODE,
              );
            }
            // return button with different color
            else {
              return CalculatorButton(
                buttonTapped: () {
                  setState(() {
                    userAsk += buttons[index];
                  });
                },
                buttonText: buttons[index],
                color: isOperator(buttons[index])
                    ? Colors.black
                    : Colors.white,
                textColor: isOperator(buttons[index])
                    ? Colors.white
                    : Colors.black,
              );
            }
          }),
    );
  }

  Column calculateField() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
            padding: context.paddingAllow,
            alignment: Alignment.centerLeft,
            child: Text(
              userAsk,
              style: UITextStyles.buttonTextStyle,
            )),
        Container(
            padding: context.paddingAllow,
            alignment: Alignment.centerRight,
            child: Text(
              userAnswer,
              style: UITextStyles.buttonTextStyle,
            )),
      ],
    );
  }

  //usual calculation setting
  bool isOperator(String x) {
    if (x == '%' || x == '/' || x == '*' || x == '-' || x == '+' || x == '=') {
      return true; //answer
    }
    return false;//non-result found
  }

  //output after calculation
  void equalPressed() {
    String finalAsk = userAsk;
    Parser p = Parser();
    Expression exp = p.parse(finalAsk);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    userAnswer = eval.toString();
  }
}

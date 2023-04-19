import 'package:flutter/material.dart';
import 'package:calculator_app/ui/constants/contextExtension.dart';

class CalculatorButton extends StatelessWidget {
  final color;
  final textColor;
  final String buttonText;
  final buttonTapped;

  const CalculatorButton(
      {Key key, this.color, this.textColor, this.buttonText, this.buttonTapped})
      : super(key: key);

  //The button setting style about size , padding , text , color , line number
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              color: color,
              child: Center(
                child: Text(
                  buttonText,
                  style: TextStyle(color: textColor, fontSize: 25),
                ),
              ),
            )),
      ),
    );
  }
}

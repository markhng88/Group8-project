import 'package:flutter/material.dart';

//padding calculation of user input text box
extension ContextExtension on BuildContext {
  double dynamicWidth(double val) => MediaQuery.of(this).size.width * val;
  double dynamicHeight(double val) => MediaQuery.of(this).size.height * val;

  ThemeData get theme => Theme.of(this);
}

//call the padding calculation
extension PaddingExtension on BuildContext {
  EdgeInsets get paddingAllow => EdgeInsets.all(dynamicHeight(0.05));
}

import 'package:calculator_final/constants.dart';
import 'package:calculator_final/provider/calculator_data.dart';
import 'package:calculator_final/provider/conversion_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';

class OperatorButton extends StatelessWidget {
  final String buttonText;
  final List<String> buttonList;
  const OperatorButton(
      {Key? key, required this.buttonText, required this.buttonList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (buttonList == kButtonNames) {
          Provider.of<CalculatorData>(context, listen: false)
              .operatorButtonPressed(buttonText: buttonText);
        } else {
          Provider.of<ConversionData>(context, listen: false)
              .operatorButtonPressed(buttonText: buttonText);
        }
      },
      child: Text(
        buttonText,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 24.0,
          color: kOperatorTextColor,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          ThemeProvider.themeOf(context).id == 'dark_theme'
              ? kOperatorColorDark
              : kOperatorColorLight,
        ),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(),
        ),
      ),
    );
  }
}

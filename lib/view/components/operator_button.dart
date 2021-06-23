import 'package:calculator_final/constants.dart';
import 'package:calculator_final/provider/calculator_data.dart';
import 'package:calculator_final/provider/conversion_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OperatorButton extends StatelessWidget {
  final String buttonText;
  final List<String> buttonList;
  const OperatorButton(
      {Key? key, required this.buttonText, required this.buttonList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: TextButton(
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
            color: Colors.white,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            Color(0xff004f94),
          ),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            CircleBorder(),
          ),
        ),
      ),
    );
  }
}

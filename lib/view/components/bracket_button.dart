import 'package:calculator_final/constants.dart';
import 'package:calculator_final/provider/calculator_data.dart';
import 'package:calculator_final/provider/conversion_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BracketButton extends StatelessWidget {
  final String buttonText;
  final List<String> buttonList;
  const BracketButton({
    required this.buttonText,
    required this.buttonList,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (buttonList == kButtonNames) {
          Provider.of<CalculatorData>(context, listen: false)
              .bracketPressed(buttonText: buttonText);
        } else {
          Provider.of<ConversionData>(context, listen: false)
              .bracketPressed(buttonText: buttonText);
        }
      },
      child: Text(
        buttonText,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 24.0,
          color: Colors.grey[700],
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          Color(0xffffffff),
        ),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          CircleBorder(),
        ),
      ),
    );
  }
}

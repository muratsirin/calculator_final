import 'package:calculator_final/constants.dart';
import 'package:calculator_final/provider/calculator_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScientificButton extends StatelessWidget {
  final String buttonText;
  const ScientificButton({
    Key? key,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Provider.of<CalculatorData>(context, listen: false)
            .scientificButtonPressed(buttonText: buttonText);
      },
      child: Text(
        buttonText,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 20.0,
          color: kScientificButtonTextColor,
        ),
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(),
        ),
      ),
    );
  }
}

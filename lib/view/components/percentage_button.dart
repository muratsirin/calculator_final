import 'package:calculator_final/provider/calculator_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PercentageButton extends StatelessWidget {
  final String buttonText;
  const PercentageButton({
    required this.buttonText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Provider.of<CalculatorData>(context, listen: false)
            .percentageButtonPressed(buttonText: buttonText);
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
          Color(0xfff0f0f0),
        ),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          CircleBorder(),
        ),
      ),
    );
  }
}

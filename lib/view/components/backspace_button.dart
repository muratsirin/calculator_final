import 'package:calculator_final/provider/calculator_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BackSpaceButton extends StatelessWidget {
  const BackSpaceButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Provider.of<CalculatorData>(context, listen: false).backSpacePressed();
      },
      onLongPress: () {
        Provider.of<CalculatorData>(context, listen: false).clearPressed();
      },
      child: Icon(
        Icons.backspace,
        size: 24.0,
        color: Colors.grey,
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

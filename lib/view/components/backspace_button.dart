import 'package:calculator_final/constants.dart';
import 'package:calculator_final/provider/calculator_data.dart';
import 'package:calculator_final/provider/conversion_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BackSpaceButton extends StatelessWidget {
  final List<String> buttonList;
  const BackSpaceButton({
    required this.buttonList,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (buttonList == kButtonNames) {
          Provider.of<CalculatorData>(context, listen: false)
              .backSpacePressed();
        } else {
          Provider.of<ConversionData>(context, listen: false).deleteCharacter();
        }
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
          Color(0xffF8F8F8),
        ),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(),
        ),
      ),
    );
  }
}

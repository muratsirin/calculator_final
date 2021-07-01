import 'package:calculator_final/constants.dart';
import 'package:calculator_final/provider/calculator_data.dart';
import 'package:calculator_final/provider/conversion_data.dart';
import 'package:calculator_final/provider/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';

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

import 'package:calculator_final/constants.dart';
import 'package:calculator_final/view/components/backspace_button.dart';
import 'package:calculator_final/view/components/bracket_button.dart';
import 'package:calculator_final/view/components/button.dart';
import 'package:calculator_final/view/components/equal_button.dart';
import 'package:calculator_final/view/components/operator_button.dart';
import 'package:calculator_final/view/components/percentage_button.dart';
import 'package:flutter/material.dart';

class Numpad extends StatelessWidget {
  const Numpad({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, BoxConstraints constraints) {
        return GridView.count(
          crossAxisCount: 4,
          childAspectRatio: constraints.maxWidth / constraints.maxHeight / 0.8,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: kButtonNames.map<Widget>((e) {
            switch (e) {
              case '÷':
                return OperatorButton(buttonText: e, buttonList: kButtonNames);
              case '×':
                return OperatorButton(buttonText: e, buttonList: kButtonNames);
              case '-':
                return OperatorButton(buttonText: e, buttonList: kButtonNames);
              case '+':
                return OperatorButton(buttonText: e, buttonList: kButtonNames);
              case '(':
                return BracketButton(buttonText: e, buttonList: kButtonNames);
              case ')':
                return BracketButton(buttonText: e, buttonList: kButtonNames);
              case '%':
                return PercentageButton(buttonText: e);
              case '⌫':
                return BackSpaceButton(buttonList: kButtonNames);
              case '=':
                return EqualButton(buttonText: e, buttonList: kButtonNames);
              default:
                return Button(
                  buttonText: e,
                  buttonList: kButtonNames,
                );
            }
          }).toList(),
        );
      },
    );
  }
}

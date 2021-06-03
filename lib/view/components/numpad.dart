import 'package:calculator_final/constants.dart';
import 'package:calculator_final/view/components/backspace_button.dart';
import 'package:calculator_final/view/components/bracket_button.dart';
import 'package:calculator_final/view/components/button.dart';
import 'package:calculator_final/view/components/equal_button.dart';
import 'package:calculator_final/view/components/operator_button.dart';
import 'package:flutter/material.dart';

class Numpad extends StatelessWidget {
  const Numpad({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfff0f0f0),
      child: LayoutBuilder(
        builder: (context, BoxConstraints constraints) {
          return GridView.count(
            crossAxisCount: 4,
            childAspectRatio:
                constraints.maxWidth / constraints.maxHeight / 0.8,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: kButtonNames.map<Widget>((e) {
              switch (e) {
                case '÷':
                  return OperatorButton(buttonText: e);
                case '×':
                  return OperatorButton(buttonText: e);
                case '-':
                  return OperatorButton(buttonText: e);
                case '+':
                  return OperatorButton(buttonText: e);
                case '(':
                  return BracketButton(buttonText: e);
                case ')':
                  return BracketButton(buttonText: e);
                case '⌫':
                  return BackSpaceButton();
                case '=':
                  return EqualButton();
                default:
                  return Button(buttonText: e);
              }
            }).toList(),
          );
        },
      ),
    );
  }
}

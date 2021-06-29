import 'package:calculator_final/constants.dart';
import 'package:calculator_final/view/components/scientific_button.dart';
import 'package:flutter/material.dart';
import 'backspace_button.dart';
import 'bracket_button.dart';
import 'button.dart';
import 'equal_button.dart';
import 'operator_button.dart';

class ScientificNumpad extends StatelessWidget {
  const ScientificNumpad({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffffffff),
      child: LayoutBuilder(
        builder: (context, BoxConstraints constraints) {
          return GridView.count(
            crossAxisCount: 5,
            childAspectRatio:
                constraints.maxWidth / constraints.maxHeight / 0.84,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: kScientificButtonNames.map<Widget>((e) {
              switch (e) {
                case '÷':
                  return OperatorButton(
                      buttonText: e, buttonList: kButtonNames);
                case '×':
                  return OperatorButton(
                      buttonText: e, buttonList: kButtonNames);
                case '-':
                  return OperatorButton(
                      buttonText: e, buttonList: kButtonNames);
                case '+':
                  return OperatorButton(
                      buttonText: e, buttonList: kButtonNames);
                case '⌫':
                  return BackSpaceButton(buttonList: kButtonNames);
                case '=':
                  return EqualButton(buttonText: e, buttonList: kButtonNames);
                case 'ln':
                  return ScientificButton(buttonText: e);
                case 'log':
                  return ScientificButton(buttonText: e);
                case 'sin':
                  return ScientificButton(buttonText: e);
                case 'cos':
                  return ScientificButton(buttonText: e);
                case 'tan':
                  return ScientificButton(buttonText: e);
                case '^':
                  return ScientificButton(buttonText: e);
                case '√':
                  return ScientificButton(buttonText: e);
                case 'π':
                  return ScientificButton(buttonText: e);
                case 'e':
                  return ScientificButton(buttonText: e);
                case '!':
                  return ScientificButton(buttonText: e);
                case '(':
                  return BracketButton(buttonText: e, buttonList: kButtonNames);
                case ')':
                  return BracketButton(buttonText: e, buttonList: kButtonNames);
                case '%':
                  return BracketButton(buttonText: e, buttonList: kButtonNames);
                default:
                  return Button(
                    buttonText: e,
                    buttonList: kButtonNames,
                  );
              }
            }).toList(),
          );
        },
      ),
    );
  }
}

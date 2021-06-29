import 'package:calculator_final/constants.dart';
import 'package:calculator_final/view/components/backspace_button.dart';
import 'package:calculator_final/view/components/bracket_button.dart';
import 'package:calculator_final/view/components/button.dart';
import 'package:calculator_final/view/components/equal_button.dart';
import 'package:calculator_final/view/components/operator_button.dart';
import 'package:flutter/material.dart';

class ConversionNumpad extends StatelessWidget {
  const ConversionNumpad({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffffffff),
      child: LayoutBuilder(
        builder: (context, BoxConstraints constraints) {
          return GridView.count(
            crossAxisCount: 4,
            childAspectRatio:
                constraints.maxWidth / constraints.maxHeight / 0.8,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: kConversionButtonNames.map<Widget>((e) {
              switch (e) {
                case '÷':
                  return OperatorButton(
                      buttonText: e, buttonList: kConversionButtonNames);
                case '×':
                  return OperatorButton(
                      buttonText: e, buttonList: kConversionButtonNames);
                case '-':
                  return OperatorButton(
                      buttonText: e, buttonList: kConversionButtonNames);
                case '+':
                  return OperatorButton(
                      buttonText: e, buttonList: kConversionButtonNames);
                case '(':
                  return BracketButton(
                      buttonText: e, buttonList: kConversionButtonNames);
                case ')':
                  return BracketButton(
                      buttonText: e, buttonList: kConversionButtonNames);
                case '⌫':
                  return BackSpaceButton(
                    buttonList: kConversionButtonNames,
                  );
                case 'OK':
                  return EqualButton(
                      buttonText: e, buttonList: kConversionButtonNames);
                default:
                  return Button(
                    buttonText: e,
                    buttonList: kConversionButtonNames,
                  );
              }
            }).toList(),
          );
        },
      ),
    );
  }
}

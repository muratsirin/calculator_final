import 'package:auto_size_text/auto_size_text.dart';
import 'package:calculator_final/provider/calculator_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Process extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 10, 5),
      child: Consumer<CalculatorData>(
        builder: (context, calculatorData, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AutoSizeText(
                calculatorData.displayText,
                maxLines: 2,
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
              AutoSizeText(
                calculatorData.textResult(),
                maxLines: 1,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.grey,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

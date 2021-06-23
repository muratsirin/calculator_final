import 'package:calculator_final/provider/calculator_data.dart';
import 'package:calculator_final/provider/history_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EqualButton extends StatelessWidget {
  final String buttonText;
  final List<String> buttonList;
  const EqualButton({
    required this.buttonText,
    required this.buttonList,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Consumer<CalculatorData>(
        builder: (context, calculatorData, child) {
          return TextButton(
            onPressed: () {
              Provider.of<HistoryData>(context, listen: false).addHistory(
                  processText: calculatorData.processText,
                  result: calculatorData.result);
            },
            child: Text(
              buttonText,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 24.0,
                color: Colors.white,
              ),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                Colors.green,
              ),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                CircleBorder(),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:calculator_final/provider/calculator_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Process extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffffffff),
      padding: EdgeInsets.fromLTRB(0, 0, 10, 5),
      child: Consumer<CalculatorData>(
        builder: (context, calculatorData, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextField(
                controller: calculatorData.textEditingController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                autofocus: true,
                showCursor: true,
                cursorColor: Colors.grey,
                readOnly: true,
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.grey[700],
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  counterText: '',
                ),
              ),
              Text(
                calculatorData.textResult(),
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

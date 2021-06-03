import 'package:calculator_final/provider/calculator_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Process extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 20,
          )
        ]),
        child: Material(
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
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
                        color: Colors.black,
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
          ),
        ),
      ),
    );
  }
}

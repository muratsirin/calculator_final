import 'package:calculator_final/provider/calculator_data.dart';
import 'package:calculator_final/provider/conversion_data.dart';
import 'package:calculator_final/provider/utils.dart';
import 'package:calculator_final/view/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Calculator());
}

class Calculator extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => Utils(),
        ),
        ChangeNotifierProvider(
          create: (context) => CalculatorData(),
        ),
        ChangeNotifierProvider(
          create: (context) => ConversionData(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        home: HomeScreen(),
      ),
    );
  }
}

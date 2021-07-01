import 'package:calculator_final/provider/calculator_data.dart';
import 'package:calculator_final/provider/conversion_data.dart';
import 'package:calculator_final/provider/history_data.dart';
import 'package:calculator_final/provider/utils.dart';
import 'package:calculator_final/view/components/my_behavior.dart';
import 'package:calculator_final/view/components/theme_data_dark.dart';
import 'package:calculator_final/view/components/theme_data_light.dart';
import 'package:calculator_final/view/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';

void main() {
  runApp(Calculator());
}

class Calculator extends StatelessWidget {
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
        ChangeNotifierProvider(
          create: (context) => HistoryData(),
        ),
      ],
      builder: (context, child) {
        return ThemeProvider(
          saveThemesOnChange: true,
          loadThemeOnInit: true,
          themes: [
            AppTheme(
              id: 'light_theme',
              data: themeDataLight(context),
              description: 'Light Theme',
            ),
            AppTheme(
              id: 'dark_theme',
              data: themeDataDark(context),
              description: 'Dark Theme',
            ),
          ],
          child: ThemeConsumer(
            child: Builder(
              builder: (themeContext) {
                return MaterialApp(
                  builder: (context, child) {
                    return ScrollConfiguration(
                      behavior: MyBehavior(),
                      child: child!,
                    );
                  },
                  home: HomeScreen(),
                  theme: ThemeProvider.themeOf(themeContext).data,
                );
              },
            ),
          ),
        );
      },
    );
  }
}

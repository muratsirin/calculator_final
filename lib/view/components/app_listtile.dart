import 'package:calculator_final/view/screens/conversion_screen.dart';
import 'package:calculator_final/view/screens/home_screen.dart';
import 'package:flutter/material.dart';

class AppListTile extends StatelessWidget {
  final IconData iconData;
  final String title;
  final int conversionIndex;

  const AppListTile(
      {Key? key,
      required this.iconData,
      required this.title,
      required this.conversionIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        iconData,
        size: 30,
        color: Color(0xff004f94),
      ),
      onTap: () {
        if (conversionIndex != 0) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ConversionScreen(
                conversionIndex: conversionIndex,
              ),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
          );
        }
      },
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 18,
        ),
      ),
    );
  }
}

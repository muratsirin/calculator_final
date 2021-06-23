import 'package:flutter/material.dart';

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
      child: TextButton(
        onPressed: () {},
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
      ),
    );
  }
}

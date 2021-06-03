import 'package:flutter/material.dart';

class AppListTile extends StatelessWidget {
  final IconData iconData;
  final String title;
  const AppListTile({
    Key? key,
    required this.iconData,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        iconData,
        size: 30,
        color: Color(0xff004f94),
      ),
      onTap: () {},
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

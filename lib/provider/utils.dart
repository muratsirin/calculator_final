import 'package:calculator_final/model/drawer_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:theme_provider/theme_provider.dart';

class Utils {
  void setThemeMode({required value, required BuildContext context}) {
    switch (value) {
      case true:
        ThemeProvider.controllerOf(context).setTheme('dark_theme');
        break;
      case false:
        ThemeProvider.controllerOf(context).setTheme('light_theme');
        break;
    }
  }

  List<DrawerMenu> drawerMenuList = [
    DrawerMenu(
      iconData: FontAwesomeIcons.calculator,
      title: 'Hesap Makinesi',
    ),
    DrawerMenu(
      iconData: FontAwesomeIcons.rulerHorizontal,
      title: 'Uzunluk',
    ),
    DrawerMenu(
      iconData: FontAwesomeIcons.chartArea,
      title: 'Alan',
    ),
    DrawerMenu(
      iconData: FontAwesomeIcons.weightHanging,
      title: 'Kütle',
    ),
    DrawerMenu(
      iconData: FontAwesomeIcons.volumeUp,
      title: 'Ses',
    ),
    DrawerMenu(
      iconData: FontAwesomeIcons.temperatureHigh,
      title: 'Sıcaklık',
    ),
    DrawerMenu(
      iconData: FontAwesomeIcons.utensils,
      title: 'Pişirme',
    ),
  ];
}

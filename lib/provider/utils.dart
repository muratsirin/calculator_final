import 'package:calculator_final/model/drawer_menu.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Utils {
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
      iconData: FontAwesomeIcons.gasPump,
      title: 'Yakıt',
    ),
    DrawerMenu(
      iconData: FontAwesomeIcons.utensils,
      title: 'Pişirme',
    ),
  ];
}

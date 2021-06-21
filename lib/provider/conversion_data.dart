import 'package:calculator_final/model/conversion.dart';
import 'package:calculator_final/provider/helpers/conversion_list.dart';
import 'package:calculator_final/view/screens/conversion_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConversionData extends ConversionList with ChangeNotifier {
  List<Conversion> selectedList = [];
  String selectedItem = '';
  String resultValue = '';
  int listIndex = 0;

  void setSelectedItem({required String value}) {
    selectedItem = value;
    notifyListeners();
  }

  void updateSelectedItem({required int index}) {
    switch (index) {
      case 0:
        selectedItem = '';
        break;
      case 1:
        selectedItem = length.first.unitName;
        break;
      case 2:
        selectedItem = area.first.unitName;
        break;
      case 3:
        selectedItem = weight.first.unitName;
        break;
      case 4:
        selectedItem = volume.first.unitName;
        break;
      case 5:
        selectedItem = temperature.first.unitName;
        break;
      case 6:
        selectedItem = cooking.first.unitName;
        break;
    }
    notifyListeners();
  }

  List<Conversion> getConversionList({required String unitType}) {
    switch (unitType) {
      case 'Uzunluk':
        selectedList = length;
        return length;
      case 'Alan':
        selectedList = area;
        return area;
      case 'Kütle':
        selectedList = weight;
        return weight;
      case 'Ses':
        selectedList = volume;
        return volume;
      case 'Sıcaklık':
        selectedList = temperature;
        return temperature;
      case 'Pişirme':
        selectedList = cooking;
        return cooking;
      default:
        return length;
    }
  }

  String result({
    required double unitFactor,
    required String unitName,
  }) {
    try {
      print('listIndex:' + listIndex.toString());
      print('selectedItem:' + selectedItem);
      print('unitName:' + unitName);
      double value = 1;
      switch (selectedItem) {
        case 'Kelvin':
          if (unitName == 'Santigrat') {
            value = value * (-272.15);
          } else if (unitName == 'Fahrenhayt') {
            value = value * (-457.87);
          }
          break;
        case 'Fahrenhayt':
          if (unitName == 'Santigrat') {
            value = value * (-17.2222222);
          } else if (unitName == 'Kelvin') {
            value = value * (255.927778);
          }
          break;
        default:
          value = value *
              conversionFactors[selectedItem] *
              (1 / conversionFactors[unitName]);
          break;
      }

      if (value < 1e-8)
        return value.toStringAsExponential(6);
      else
        resultValue = value.toStringAsFixed(6);
      resultValue = resultValue.replaceAll(RegExp(r"([.]*000000)(?!.*\d)"), "");
    } catch (e) {}
    return resultValue;
  }
}

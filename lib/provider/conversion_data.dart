import 'package:calculator_final/model/conversion.dart';
import 'package:calculator_final/provider/helpers/conversion_list.dart';
import 'package:flutter/cupertino.dart';

class ConversionData extends ConversionList with ChangeNotifier {
  List<Conversion> selectedList = [];
  String selectedItem = '';
  String resultValue = '';
  int selectedIndex = 0;

  List<Conversion> getConversionList({conversionIndex}) {
    switch (conversionIndex) {
      case 1:
        selectedList = length;
        return length;
      case 2:
        selectedList = area;
        return area;
      case 3:
        selectedList = weight;
        return weight;
      case 4:
        selectedList = volume;
        return volume;
      case 5:
        selectedList = temperature;
        return temperature;
      case 6:
        selectedList = cooking;
        return cooking;
      default:
        return length;
    }
  }

  void setSelectedIndex({required int value}) {
    selectedIndex = value;
    notifyListeners();
  }

  String result({
    required double unitFactor,
    required String unitName,
  }) {
    double value = 1;
    switch (selectedList[1].unitName) {
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
        value =
            value * selectedList[selectedIndex].unitFactor * (1 / unitFactor);
        break;
    }

    if (value < 1e-8)
      return value.toStringAsExponential(6);
    else
      resultValue = value.toStringAsFixed(6);
    resultValue = resultValue.replaceAll(RegExp(r"([.]*000000)(?!.*\d)"), "");
    return resultValue;
  }
}

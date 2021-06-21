import 'package:calculator_final/model/conversion.dart';
import 'package:calculator_final/provider/helpers/conversion_list.dart';
import 'package:flutter/cupertino.dart';

class ConversionData extends ConversionList with ChangeNotifier {
  List<Conversion> selectedList = [];
  String selectedItem = '';
  String selectedItemLength = 'Metre';
  String selectedItemArea = 'Metrekare';
  String selectedItemWeight = 'Kilogram';
  String selectedItemVolume = 'Metreküp';
  String selectedItemTemperature = 'Santigrat';
  String selectedItemCooking = 'Mililitre';
  String resultValue = '';

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

  String getSelectedItem() {
    if (selectedList == length) {
      selectedItem = selectedItemLength;
    } else if (selectedList == area) {
      selectedItem = selectedItemArea;
    } else if (selectedList == weight) {
      selectedItem = selectedItemWeight;
    } else if (selectedList == volume) {
      selectedItem = selectedItemVolume;
    } else if (selectedList == temperature) {
      selectedItem = selectedItemTemperature;
    } else if (selectedList == cooking) {
      selectedItem = selectedItemCooking;
    }

    return selectedItem;
  }

  void setSelectedItem({required String value}) {
    if (selectedList == length) {
      selectedItemLength = value;
    } else if (selectedList == area) {
      selectedItemArea = value;
    } else if (selectedList == weight) {
      selectedItemWeight = value;
    } else if (selectedList == volume) {
      selectedItemVolume = value;
    } else if (selectedList == temperature) {
      selectedItemTemperature = value;
    } else if (selectedList == cooking) {
      selectedItemCooking = value;
    }
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
        value = value * selectedList[listIndex()].unitFactor * (1 / unitFactor);
        break;
    }

    if (value < 1e-8)
      return value.toStringAsExponential(6);
    else
      resultValue = value.toStringAsFixed(6);
    resultValue = resultValue.replaceAll(RegExp(r"([.]*000000)(?!.*\d)"), "");
    return resultValue;
  }

  int listIndex() {
    int listIndex = 0;
    try {
      if (selectedList == length) {
        listIndex = selectedList
            .indexWhere((element) => element.unitName == selectedItemLength);
      } else if (selectedList == area) {
        listIndex = selectedList
            .indexWhere((element) => element.unitName == selectedItemArea);
      } else if (selectedList == weight) {
        listIndex = selectedList
            .indexWhere((element) => element.unitName == selectedItemWeight);
      } else if (selectedList == volume) {
        listIndex = selectedList
            .indexWhere((element) => element.unitName == selectedItemVolume);
      } else if (selectedList == temperature) {
        listIndex = selectedList.indexWhere(
            (element) => element.unitName == selectedItemTemperature);
      } else if (selectedList == cooking) {
        listIndex = selectedList
            .indexWhere((element) => element.unitName == selectedItemCooking);
      }
    } catch (e) {}

    return listIndex;
  }
}

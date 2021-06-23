import 'package:calculator_final/model/conversion.dart';
import 'package:calculator_final/provider/helpers/conversion_button_data.dart';
import 'package:calculator_final/provider/helpers/conversion_list.dart';

class ConversionData extends ConversionButtonData with ConversionList {
  String selectedItem = '';
  String selectedItemAbbreviation = '';
  String resultValue = '';

  void setSelectedItem(
      {required String unitName, required String unitAbbreviation}) {
    selectedItem = unitName;
    selectedItemAbbreviation = unitAbbreviation;
    notifyListeners();
  }

  void updateSelectedItem({required int index}) {
    switch (index) {
      case 0:
        text = '1';
        processText = '1';
        selectedItem = '';
        selectedItemAbbreviation = '';
        break;
      case 1:
        text = '1';
        processText = '1';
        selectedItemAbbreviation = length.first.unitAbbreviation;
        selectedItem = length.first.unitName;
        break;
      case 2:
        text = '1';
        processText = '1';
        selectedItemAbbreviation = area.first.unitAbbreviation;
        selectedItem = area.first.unitName;
        break;
      case 3:
        text = '1';
        processText = '1';
        selectedItemAbbreviation = weight.first.unitAbbreviation;
        selectedItem = weight.first.unitName;
        break;
      case 4:
        text = '1';
        processText = '1';
        selectedItemAbbreviation = volume.first.unitAbbreviation;
        selectedItem = volume.first.unitName;
        break;
      case 5:
        text = '1';
        processText = '1';
        selectedItemAbbreviation = temperature.first.unitAbbreviation;
        selectedItem = temperature.first.unitName;
        break;
      case 6:
        text = '1';
        ;
        processText = '1';
        selectedItemAbbreviation = cooking.first.unitAbbreviation;
        selectedItem = cooking.first.unitName;
        break;
    }
    notifyListeners();
  }

  List<Conversion> getConversionList({required String unitType}) {
    switch (unitType) {
      case 'Uzunluk':
        return length;
      case 'Alan':
        return area;
      case 'Kütle':
        return weight;
      case 'Ses':
        return volume;
      case 'Sıcaklık':
        return temperature;
      case 'Pişirme':
        return cooking;
      default:
        return length;
    }
  }

  String result({required String unitName}) {
    try {
      double inputValue = double.parse(getInputResult());

      switch (selectedItem) {
        case 'Kelvin':
          if (unitName == 'Santigrat') {
            inputValue = inputValue * (-272.15);
          } else if (unitName == 'Fahrenhayt') {
            inputValue = inputValue * (-457.87);
          }
          break;
        case 'Fahrenhayt':
          if (unitName == 'Santigrat') {
            inputValue = inputValue * (-17.2222222);
          } else if (unitName == 'Kelvin') {
            inputValue = inputValue * (255.927778);
          }
          break;
        default:
          inputValue = inputValue *
              conversionFactors[selectedItem] *
              (1 / conversionFactors[unitName]);
          break;
      }
      resultValue = inputValue.toStringAsFixed(6);
      resultValue = resultValue.replaceAll(RegExp(r"([.]*000000)(?!.*\d)"), "");
    } catch (e) {}
    return resultValue;
  }
}

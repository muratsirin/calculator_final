import 'package:calculator_final/model/conversion.dart';
import 'package:calculator_final/provider/calculator_data.dart';

class ConversionData extends CalculatorData {
  List<Conversion> length = [
    Conversion(unitName: 'Metre', unitAbbreviation: 'm'),
    Conversion(unitName: 'Kilometre', unitAbbreviation: 'km'),
    Conversion(unitName: 'Milimetre', unitAbbreviation: 'mm'),
    Conversion(unitName: 'Santimetre', unitAbbreviation: 'cm'),
    Conversion(unitName: 'Mil', unitAbbreviation: 'mi'),
    Conversion(unitName: 'Yarda', unitAbbreviation: 'yd'),
    Conversion(unitName: 'Fit', unitAbbreviation: 'ft'),
    Conversion(unitName: 'İnç', unitAbbreviation: 'in'),
    Conversion(unitName: 'Deniz mili', unitAbbreviation: 'nmi'),
  ];

  List<Conversion> area = [
    Conversion(unitName: 'Metrekare', unitAbbreviation: 'm2'),
    Conversion(unitName: 'Milimetrekare', unitAbbreviation: 'mm2'),
    Conversion(unitName: 'Santimetrekare', unitAbbreviation: 'cm2'),
    Conversion(unitName: 'inç kare', unitAbbreviation: 'in2'),
    Conversion(unitName: 'Fit kare', unitAbbreviation: 'ft2'),
    Conversion(unitName: 'Yarda kare', unitAbbreviation: 'yd2'),
    Conversion(unitName: 'Hektar', unitAbbreviation: 'ha'),
    Conversion(unitName: 'Kilometrekare', unitAbbreviation: 'km2'),
    Conversion(unitName: 'Akre', unitAbbreviation: 'ac'),
    Conversion(unitName: 'Milkare', unitAbbreviation: 'mi2'),
  ];

  List<Conversion> getConversionList({conversionIndex}) {
    switch (conversionIndex) {
      case 1:
        return length;
      case 2:
        return area;
      default:
        return length;
    }
  }
}

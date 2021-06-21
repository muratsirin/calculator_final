import 'package:calculator_final/model/conversion.dart';

class ConversionList {
  List<Conversion> length = [
    Conversion(unitName: 'Metre', unitAbbreviation: 'm', unitFactor: 1),
    Conversion(unitName: 'Kilometre', unitAbbreviation: 'km', unitFactor: 1000),
    Conversion(
        unitName: 'Milimetre', unitAbbreviation: 'mm', unitFactor: 0.001),
    Conversion(
        unitName: 'Santimetre', unitAbbreviation: 'cm', unitFactor: 0.01),
    Conversion(
        unitName: 'Mil', unitAbbreviation: 'mi', unitFactor: 1610.3059581),
    Conversion(unitName: 'Yarda', unitAbbreviation: 'yd', unitFactor: 0.9144),
    Conversion(
        unitName: 'Fit',
        unitAbbreviation: 'ft',
        unitFactor: 0.3047999902464003),
    Conversion(
        unitName: 'İnç', unitAbbreviation: 'in', unitFactor: 0.02539999983236),
    Conversion(
        unitName: 'Deniz mili',
        unitAbbreviation: 'nmi',
        unitFactor: 1851.851851851852),
  ];

  dynamic conversionFactors = {
    'Metre': 1,
    'Kilometre': 1000,
    'Milimetre': 0.001,
    'Santimetre': 0.01,
    'Mil': 1610.3059581,
    'Yarda': 0.9144,
    'Fit': 0.3047999902464003,
    'İnç': 0.02539999983236,
    'Deniz mili': 1851.851851851852,
    'Metrekare': 1,
    'Milimetrekare': 0.000001,
    'Santimetrekare': 0.0001,
    'inç kare': 0.00064516,
    'Fit kare': 0.09290304359,
    'Yarda kare': 0.83612739237,
    'Hektar': 10000,
    'Kilometrekare': 1e6,
    'Akre': 4048.58299595,
    'Milkare': 2589988.11
  };

  List<Conversion> area = [
    Conversion(unitName: 'Metrekare', unitAbbreviation: 'm2', unitFactor: 1),
    Conversion(
        unitName: 'Milimetrekare',
        unitAbbreviation: 'mm2',
        unitFactor: 0.000001),
    Conversion(
        unitName: 'Santimetrekare',
        unitAbbreviation: 'cm2',
        unitFactor: 0.0001),
    Conversion(
        unitName: 'inç kare', unitAbbreviation: 'in2', unitFactor: 0.00064516),
    Conversion(
        unitName: 'Fit kare',
        unitAbbreviation: 'ft2',
        unitFactor: 0.09290304359),
    Conversion(
        unitName: 'Yarda kare',
        unitAbbreviation: 'yd2',
        unitFactor: 0.83612739237),
    Conversion(unitName: 'Hektar', unitAbbreviation: 'ha', unitFactor: 10000),
    Conversion(
        unitName: 'Kilometrekare', unitAbbreviation: 'km2', unitFactor: 1e6),
    Conversion(
        unitName: 'Akre', unitAbbreviation: 'ac', unitFactor: 4048.58299595),
    Conversion(
        unitName: 'Milkare', unitAbbreviation: 'mi2', unitFactor: 2589988.11),
  ];

  List<Conversion> weight = [
    Conversion(unitName: 'Kilogram', unitAbbreviation: 'kg', unitFactor: 1),
    Conversion(
        unitName: 'Miligram', unitAbbreviation: 'mg', unitFactor: 0.000001),
    Conversion(unitName: 'Gram', unitAbbreviation: 'g', unitFactor: 0.001),
    Conversion(unitName: 'Metrik ton', unitAbbreviation: 't', unitFactor: 1000),
    Conversion(
        unitName: 'Büyük ton',
        unitAbbreviation: 'ton uk',
        unitFactor: 1016.2601626),
    Conversion(
        unitName: 'Küçük ton',
        unitAbbreviation: 'ton us',
        unitFactor: 909.090909091),
    Conversion(
        unitName: 'Libre', unitAbbreviation: 'lb', unitFactor: 0.45359249794),
    Conversion(
        unitName: 'Ons', unitAbbreviation: 'oz', unitFactor: 0.02834949977),
    Conversion(
        unitName: 'Taş', unitAbbreviation: 'st', unitFactor: 6.36942675159),
    Conversion(unitName: 'Karat', unitAbbreviation: 'ct', unitFactor: 0.0002),
  ];

  List<Conversion> volume = [
    Conversion(unitName: 'Metreküp', unitAbbreviation: 'm3', unitFactor: 1),
    Conversion(
        unitName: 'Milimetreküp', unitAbbreviation: 'mm3', unitFactor: 1E-9),
    Conversion(
        unitName: 'Santimetreküp',
        unitAbbreviation: 'cm3',
        unitFactor: 0.000001),
    Conversion(
        unitName: 'Desimetreküp', unitAbbreviation: 'dm3', unitFactor: 0.001),
    Conversion(
        unitName: 'Mililitre',
        unitAbbreviation: 'mL(cc)',
        unitFactor: 0.000001),
    Conversion(unitName: 'Litre', unitAbbreviation: 'L', unitFactor: 0.001),
    Conversion(
        unitName: 'Fit küp',
        unitAbbreviation: 'ft3',
        unitFactor: 0.02831679986),
    Conversion(
        unitName: 'İnç küp',
        unitAbbreviation: 'in3',
        unitFactor: 0.00001638703),
    Conversion(
        unitName: 'Galon (ABD)',
        unitAbbreviation: 'gal',
        unitFactor: 0.00378541178),
    Conversion(
        unitName: 'Kuart (ABD)',
        unitAbbreviation: 'qt lqd',
        unitFactor: 0.00094635294),
    Conversion(
        unitName: 'Pint (ABD)',
        unitAbbreviation: 'pt lqd',
        unitFactor: 0.00047317647),
    Conversion(
        unitName: 'Ons (ABD)',
        unitAbbreviation: 'oz',
        unitFactor: 0.00002957352),
    Conversion(
        unitName: 'Kupa (ABD)',
        unitAbbreviation: 'cup',
        unitFactor: 0.00023658823),
    Conversion(
        unitName: 'Yemek kaşığı (ABD)',
        unitAbbreviation: 'tbsp',
        unitFactor: 0.00001478676),
    Conversion(
        unitName: 'Çay kaşığı (ABD)',
        unitAbbreviation: 'tsp',
        unitFactor: 0.00000492892),
    Conversion(
        unitName: 'Galon (BK)',
        unitAbbreviation: 'gal',
        unitFactor: 0.00454609188),
    Conversion(
        unitName: 'Kuart (BK)',
        unitAbbreviation: 'qt',
        unitFactor: 0.00113649999),
    Conversion(
        unitName: 'Pint (BK)', unitAbbreviation: 'pt', unitFactor: 0.0005683),
    Conversion(
        unitName: 'Ons (BK)',
        unitAbbreviation: 'oz',
        unitFactor: 0.00002841306),
    Conversion(
        unitName: 'Kupa (BK)',
        unitAbbreviation: 'cup',
        unitFactor: 0.00028413099),
    Conversion(
        unitName: 'Yemek kaşığı (BK)',
        unitAbbreviation: 'tbsp',
        unitFactor: 0.00001775799),
    Conversion(
        unitName: 'Çay kaşığı (BK)',
        unitAbbreviation: 'tsp',
        unitFactor: 0.00000591899),
    Conversion(
        unitName: 'Dirhem', unitAbbreviation: 'dr', unitFactor: 0.00000369669),
    Conversion(
        unitName: 'Varil', unitAbbreviation: 'bbl', unitFactor: 0.15898728912),
    Conversion(
        unitName: 'Kordon', unitAbbreviation: 'cord', unitFactor: 3.6231884058),
    Conversion(
        unitName: 'Gill', unitAbbreviation: 'gill', unitFactor: 0.00011829),
  ];

  List<Conversion> temperature = [
    Conversion(unitName: 'Santigrat', unitAbbreviation: 'C', unitFactor: 1),
    Conversion(
        unitName: 'Kelvin', unitAbbreviation: 'K', unitFactor: 0.00364763815),
    Conversion(
        unitName: 'Fahrenhayt',
        unitAbbreviation: 'F',
        unitFactor: 0.02958579881),
  ];

  // List<Conversion> fuel = [
  //   Conversion(
  //       unitName: 'Litre/100 kilometre',
  //       unitAbbreviation: 'L/100km',
  //       unitFactor: 1),
  //   Conversion(
  //       unitName: 'Galon (BK)/100 mil',
  //       unitAbbreviation: 'gal(UK)/100 miles',
  //       unitFactor: 2.82485875706),
  //   Conversion(
  //       unitName: 'Galon (ABD)/100 mil',
  //       unitAbbreviation: 'gal(US)/100miles',
  //       unitFactor: 2.35294117647),
  //   Conversion(
  //       unitName: 'Kilometre/litre',
  //       unitAbbreviation: 'km/L',
  //       unitFactor: 0.01),
  //   Conversion(
  //       unitName: 'Galon (BK)/mil',
  //       unitAbbreviation: 'MPG(UK)',
  //       unitFactor: 0.0035400619),
  //   Conversion(
  //       unitName: 'Galon (ABD)/mill',
  //       unitAbbreviation: 'MPG(US)',
  //       unitFactor: 0.00425143708),
  // ];

  List<Conversion> cooking = [
    Conversion(
        unitName: 'Mililitre', unitAbbreviation: 'mL (cc)', unitFactor: 1),
    Conversion(
        unitName: 'Galon (ABD)',
        unitAbbreviation: 'gal',
        unitFactor: 3787.87878788),
    Conversion(
        unitName: 'Kuart (ABD)',
        unitAbbreviation: 'qt lqd',
        unitFactor: 943.396226415),
    Conversion(
        unitName: 'Pint (ABD)',
        unitAbbreviation: 'pt lqd',
        unitFactor: 473.933649289),
    Conversion(
        unitName: 'Ons (ABD)',
        unitAbbreviation: 'fl. oz',
        unitFactor: 29.5857988166),
    Conversion(
        unitName: 'Kupa (ABD)',
        unitAbbreviation: 'cup',
        unitFactor: 236.406619385),
    Conversion(
        unitName: 'Yemek kaşığı (ABD)',
        unitAbbreviation: 'tbsp',
        unitFactor: 14.7928994083),
    Conversion(
        unitName: 'Çay kaşığı (ABD)',
        unitAbbreviation: 'tsp',
        unitFactor: 4.92610837438),
    Conversion(
        unitName: 'Galon (BK)',
        unitAbbreviation: 'gal',
        unitFactor: 4545.45454545),
    Conversion(
        unitName: 'Kuart (BK)',
        unitAbbreviation: 'qt',
        unitFactor: 1136.36363636),
    Conversion(
        unitName: 'Pint (BK)',
        unitAbbreviation: 'pt',
        unitFactor: 568.181818182),
    Conversion(
        unitName: 'Ons (BK)',
        unitAbbreviation: 'fl oz',
        unitFactor: 28.4090909091),
    Conversion(
        unitName: 'Kupa (BK)',
        unitAbbreviation: 'cup',
        unitFactor: 284.090909091),
    Conversion(
        unitName: 'Yemek kaşığı (BK)',
        unitAbbreviation: 'tbsp',
        unitFactor: 17.7619893428),
    Conversion(
        unitName: 'Çay kaşığı (BK)',
        unitAbbreviation: 'tsp',
        unitFactor: 5.91715976331),
  ];
}

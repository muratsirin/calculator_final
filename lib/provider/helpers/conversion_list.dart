import 'package:calculator_final/model/conversion.dart';

class ConversionList {
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

  List<Conversion> weight = [
    Conversion(unitName: 'Kilogram', unitAbbreviation: 'kg'),
    Conversion(unitName: 'Miligram', unitAbbreviation: 'mg'),
    Conversion(unitName: 'Gram', unitAbbreviation: 'g'),
    Conversion(unitName: 'Metrik ton', unitAbbreviation: 't'),
    Conversion(unitName: 'Büyük ton', unitAbbreviation: 'ton uk'),
    Conversion(unitName: 'Küçük ton', unitAbbreviation: 'ton us'),
    Conversion(unitName: 'Libre', unitAbbreviation: 'lb'),
    Conversion(unitName: 'Ons', unitAbbreviation: 'oz'),
    Conversion(unitName: 'Taş', unitAbbreviation: 'st'),
    Conversion(unitName: 'Karat', unitAbbreviation: 'ct'),
  ];

  List<Conversion> volume = [
    Conversion(unitName: 'Metreküp', unitAbbreviation: 'm3'),
    Conversion(unitName: 'Milimetreküp', unitAbbreviation: 'mm3'),
    Conversion(unitName: 'Santimetreküp', unitAbbreviation: 'cm3'),
    Conversion(unitName: 'Desimetreküp', unitAbbreviation: 'dm3'),
    Conversion(unitName: 'Mililitre', unitAbbreviation: 'mL(cc)'),
    Conversion(unitName: 'Litre', unitAbbreviation: 'L'),
    Conversion(unitName: 'Fit küp', unitAbbreviation: 'ft3'),
    Conversion(unitName: 'İnç küp', unitAbbreviation: 'in3'),
    Conversion(unitName: 'Galon (ABD)', unitAbbreviation: 'gal'),
    Conversion(unitName: 'Kuart (ABD)', unitAbbreviation: 'qt lqd'),
    Conversion(unitName: 'Pint (ABD)', unitAbbreviation: 'pt lqd'),
    Conversion(unitName: 'Ons (ABD)', unitAbbreviation: 'oz'),
    Conversion(unitName: 'Kupa (ABD)', unitAbbreviation: 'cup'),
    Conversion(unitName: 'Yemek kaşığı (ABD)', unitAbbreviation: 'tbsp'),
    Conversion(unitName: 'Çay kaşığı (ABD)', unitAbbreviation: 'tsp'),
    Conversion(unitName: 'Galon (BK)', unitAbbreviation: 'gal'),
    Conversion(unitName: 'Kuart (BK)', unitAbbreviation: 'qt'),
    Conversion(unitName: 'Pint (BK)', unitAbbreviation: 'pt'),
    Conversion(unitName: 'Ons (BK)', unitAbbreviation: 'oz'),
    Conversion(unitName: 'Kupa (BK)', unitAbbreviation: 'cup'),
    Conversion(unitName: 'Yemek kaşığı (BK)', unitAbbreviation: 'tbsp'),
    Conversion(unitName: 'Çay kaşığı (BK)', unitAbbreviation: 'tsp'),
    Conversion(unitName: 'Dirhem', unitAbbreviation: 'dr'),
    Conversion(unitName: 'Varil', unitAbbreviation: 'bbl'),
    Conversion(unitName: 'Kordon', unitAbbreviation: 'cord'),
    Conversion(unitName: 'Gill', unitAbbreviation: 'gill'),
  ];

  List<Conversion> temperature = [
    Conversion(unitName: 'Santigrat', unitAbbreviation: 'C'),
    Conversion(unitName: 'Kelvin', unitAbbreviation: 'K'),
    Conversion(unitName: 'Fahrenhayt', unitAbbreviation: 'F'),
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
    Conversion(unitName: 'mililitre', unitAbbreviation: 'mL (cc)'),
    Conversion(unitName: 'galon (ABD)', unitAbbreviation: 'gal'),
    Conversion(unitName: 'kuart (ABD)', unitAbbreviation: 'qt lqd'),
    Conversion(unitName: 'pint (ABD)', unitAbbreviation: 'pt lqd'),
    Conversion(unitName: 'ons (ABD)', unitAbbreviation: 'fl. oz'),
    Conversion(unitName: 'kupa (ABD)', unitAbbreviation: 'cup'),
    Conversion(unitName: 'yemek kaşığı (ABD)', unitAbbreviation: 'tbsp'),
    Conversion(unitName: 'çay kaşığı (ABD)', unitAbbreviation: 'tsp'),
    Conversion(unitName: 'galon (BK)', unitAbbreviation: 'gal'),
    Conversion(unitName: 'kuart (BK)', unitAbbreviation: 'qt'),
    Conversion(unitName: 'pint (BK)', unitAbbreviation: 'pt'),
    Conversion(unitName: 'ons (BK)', unitAbbreviation: 'fl oz'),
    Conversion(unitName: 'kupa (BK)', unitAbbreviation: 'cup'),
    Conversion(unitName: 'yemek kaşığı (BK)', unitAbbreviation: 'tbsp'),
    Conversion(unitName: 'çay kaşığı (BK)', unitAbbreviation: 'tsp'),
  ];

  dynamic conversionFactors = {
    //length
    'Metre': 1,
    'Kilometre': 1000,
    'Milimetre': 0.001,
    'Santimetre': 0.01,
    'Mil': 1610.3059581,
    'Yarda': 0.9144,
    'Fit': 0.3047999902464003,
    'İnç': 0.02539999983236,
    'Deniz mili': 1851.851851851852,
    //area
    'Metrekare': 1,
    'Milimetrekare': 0.000001,
    'Santimetrekare': 0.0001,
    'inç kare': 0.00064516,
    'Fit kare': 0.09290304359,
    'Yarda kare': 0.83612739237,
    'Hektar': 10000,
    'Kilometrekare': 1e6,
    'Akre': 4048.58299595,
    'Milkare': 2589988.11,
    //weight
    'Kilogram': 1,
    'Miligram': 0.000001,
    'Gram': 0.001,
    'Metrik ton': 1000,
    'Büyük ton': 1016.2601626,
    'Küçük ton': 909.090909091,
    'Libre': 0.45359249794,
    'Ons': 0.02834949977,
    'Taş': 6.36942675159,
    'Karat': 0.0002,
    //volume
    'Metreküp': 1,
    'Milimetreküp': 1E-9,
    'Santimetreküp': 0.000001,
    'Desimetreküp': 0.001,
    'Mililitre': 0.000001,
    'Litre': 0.001,
    'Fit küp': 0.02831679986,
    'İnç küp': 0.00001638703,
    'Galon (ABD)': 0.00378541178,
    'Kuart (ABD)': 0.00094635294,
    'Pint (ABD)': 0.00047317647,
    'Ons (ABD)': 0.00002957352,
    'Kupa (ABD)': 0.00023658823,
    'Yemek kaşığı (ABD)': 0.00001478676,
    'Çay kaşığı (ABD)': 0.00000492892,
    'Galon (BK)': 0.00454609188,
    'Kuart (BK)': 0.00113649999,
    'Pint (BK)': 0.0005683,
    'Ons (BK)': 0.00002841306,
    'Kupa (BK)': 0.00028413099,
    'Yemek kaşığı (BK)': 0.00001775799,
    'Çay kaşığı (BK)': 0.00000591899,
    'Dirhem': 0.00000369669,
    'Varil': 0.15898728912,
    'Kordon': 3.6231884058,
    'Gill': 0.00011829,
    //temperature
    'Santigrat': 1,
    'Kelvin': 0.00364763815,
    'Fahrenhayt': 0.02958579881,
    //cooking
    'mililitre': 1,
    'galon (ABD)': 3787.87878788,
    'kuart (ABD)': 943.396226415,
    'pint (ABD)': 473.933649289,
    'ons (ABD)': 29.5857988166,
    'kupa (ABD)': 236.406619385,
    'yemek kaşığı (ABD)': 14.7928994083,
    'çay kaşığı (ABD)': 4.92610837438,
    'galon (BK)': 4545.45454545,
    'kuart (BK)': 1136.36363636,
    'pint (BK)': 568.181818182,
    'ons (BK)': 28.4090909091,
    'kupa (BK)': 284.090909091,
    'yemek kaşığı (BK)': 17.7619893428,
    'çay kaşığı (BK)': 5.91715976331
  };
}

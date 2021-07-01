import 'package:auto_size_text/auto_size_text.dart';
import 'package:calculator_final/model/conversion.dart';
import 'package:calculator_final/provider/conversion_data.dart';
import 'package:calculator_final/view/components/app_drawer.dart';
import 'package:calculator_final/view/components/conversion_numpad.dart';
import 'package:calculator_final/view/components/show_bottom_unit_list.dart';
import 'package:calculator_final/view/components/unit_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConversionScreen extends StatelessWidget {
  final String unitType;
  const ConversionScreen({
    Key? key,
    required this.unitType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            unitType,
          ),
          elevation: 0,
        ),
        drawer: AppDrawer(),
        body: Consumer<ConversionData>(
          builder: (context, conversionData, child) {
            final List<Conversion> conversion =
                conversionData.getConversionList(unitType: unitType);
            return LayoutBuilder(
              builder: (context, BoxConstraints constraints) {
                return Column(
                  verticalDirection: VerticalDirection.down,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 0),
                      child: SizedBox(
                        width: constraints.maxWidth,
                        height: constraints.maxHeight * 0.1,
                        child: Row(
                          children: [
                            SizedBox(
                              width: constraints.maxWidth * 0.5,
                              child: ListTile(
                                title: Text(
                                  conversionData.selectedItem,
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                subtitle: Text(
                                  conversionData.selectedItemAbbreviation,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                trailing: Icon(Icons.unfold_more),
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (context) {
                                      return ShowBottomUnitList(
                                        conversion: conversion,
                                        conversionData: conversionData,
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                child: Container(
                                  child: AutoSizeText(
                                    conversionData.text,
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return SizedBox(
                                        height: constraints.maxHeight * 0.7,
                                        child: ConversionNumpad(),
                                      );
                                    },
                                  ).then(
                                      (value) => conversionData.thenNumpad());
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.01,
                      child: Divider(),
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.89,
                      child: UnitList(
                        conversion: conversion,
                        conversionData: conversionData,
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}

import 'package:calculator_final/model/conversion.dart';
import 'package:calculator_final/provider/conversion_data.dart';
import 'package:calculator_final/view/components/app_drawer.dart';
import 'package:calculator_final/view/components/conversion_numpad.dart';
import 'package:calculator_final/view/components/numpad.dart';
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
          title: Text('Conversion'),
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
                      child: Container(
                        width: constraints.maxWidth,
                        height: constraints.maxHeight * 0.1,
                        child: Row(
                          children: [
                            SizedBox(
                              width: constraints.maxWidth * 0.5,
                              child: ListTile(
                                title: Text(conversionData.selectedItem),
                                subtitle: Text(
                                  conversionData.selectedItemAbbreviation,
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                trailing: Icon(Icons.unfold_more),
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (context) {
                                      return Scaffold(
                                        appBar: AppBar(),
                                        body: ListView.separated(
                                          itemBuilder: (context, index) {
                                            final Conversion conversionItem =
                                                conversion[index];
                                            return ListTile(
                                              title:
                                                  Text(conversionItem.unitName),
                                              subtitle: Text(conversionItem
                                                  .unitAbbreviation),
                                              trailing:
                                                  conversionItem.unitName ==
                                                          conversionData
                                                              .selectedItem
                                                      ? Icon(Icons.check)
                                                      : Text(''),
                                              onTap: () {
                                                conversionData.setSelectedItem(
                                                  unitName:
                                                      conversionItem.unitName,
                                                  unitAbbreviation:
                                                      conversionItem
                                                          .unitAbbreviation,
                                                );
                                                Navigator.pop(context);
                                              },
                                            );
                                          },
                                          separatorBuilder: (context, index) {
                                            return Divider();
                                          },
                                          itemCount: conversion.length,
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                child: Container(
                                  child: Text(
                                    conversionData.text,
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
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          final Conversion conversionItem = conversion[index];
                          return ListTile(
                            title: Text(conversionItem.unitName),
                            subtitle: Text(
                              conversionItem.unitAbbreviation,
                            ),
                            trailing: Text(
                              conversionData.result(
                                unitName: conversionItem.unitName,
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider();
                        },
                        itemCount: conversion.length,
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

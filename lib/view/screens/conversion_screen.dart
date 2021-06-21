import 'package:calculator_final/model/conversion.dart';
import 'package:calculator_final/provider/conversion_data.dart';
import 'package:calculator_final/view/components/app_drawer.dart';
import 'package:direct_select_flutter/direct_select_container.dart';
import 'package:direct_select_flutter/direct_select_item.dart';
import 'package:direct_select_flutter/direct_select_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConversionScreen extends StatelessWidget {
  final int conversionIndex;
  const ConversionScreen({
    Key? key,
    required this.conversionIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conversion'),
      ),
      drawer: AppDrawer(),
      body: DirectSelectContainer(
        child: Consumer<ConversionData>(
          builder: (context, conversionData, child) {
            final conversion = conversionData.getConversionList(
                conversionIndex: conversionIndex);
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
                              width: constraints.maxWidth * 0.3,
                              child: DirectSelectList<Conversion>(
                                values: conversion,
                                defaultItemIndex: conversionData.selectedIndex,
                                onItemSelectedListener: (item, index, context) {
                                  conversionData.setSelectedIndex(value: index);
                                },
                                itemBuilder: (Conversion value) {
                                  return DirectSelectItem<Conversion>(
                                    itemHeight: 80,
                                    value: value,
                                    itemBuilder: (context, value) {
                                      return ListTile(
                                        title: Text(value.unitName),
                                        subtitle: Text(
                                          value.unitAbbreviation,
                                          style: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                            Icon(Icons.unfold_more),
                            Expanded(
                              child: TextField(
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                autofocus: true,
                                showCursor: true,
                                cursorColor: Colors.grey,
                                readOnly: true,
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontSize: 40,
                                  color: Colors.black,
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  counterText: '',
                                ),
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
                          final conversionItem = conversion[index];
                          return ListTile(
                            title: Text(conversionItem.unitName),
                            subtitle: Text(conversionItem.unitAbbreviation),
                            trailing: Text(
                              conversionData.result(
                                unitFactor: conversionItem.unitFactor,
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

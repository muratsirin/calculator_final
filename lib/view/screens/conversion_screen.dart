import 'package:calculator_final/provider/conversion_data.dart';
import 'package:calculator_final/view/components/app_drawer.dart';
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
      body: Consumer<ConversionData>(
        builder: (context, conversionData, child) {
          final conversion = conversionData.getConversionList(
              conversionIndex: conversionIndex);
          return LayoutBuilder(
            builder: (context, BoxConstraints constraints) {
              return Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                    child: Container(
                      width: constraints.maxWidth,
                      height: constraints.maxHeight * 0.1,
                      child: Row(
                        children: [
                          DropdownButton(
                            value: conversion[0].unitName,
                            items: conversion
                                .map((e) => DropdownMenuItem(
                                      child: Text(e.unitName),
                                      value: e.unitName,
                                    ))
                                .toList(),
                          ),
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
                    height: constraints.maxHeight * 0.9,
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          final conversionItem = conversion[index];
                          return ListTile(
                            title: Text(conversionItem.unitName),
                            subtitle: Text(conversionItem.unitAbbreviation),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider();
                        },
                        itemCount: conversion.length),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

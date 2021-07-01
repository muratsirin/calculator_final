import 'package:calculator_final/model/conversion.dart';
import 'package:calculator_final/provider/conversion_data.dart';
import 'package:flutter/material.dart';

class ShowBottomUnitList extends StatelessWidget {
  final List<Conversion> conversion;
  final ConversionData conversionData;
  const ShowBottomUnitList({
    Key? key,
    required this.conversion,
    required this.conversionData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Container(
        child: ListView.separated(
          itemBuilder: (context, index) {
            final Conversion conversionItem = conversion[index];
            return ListTile(
              title: Text(
                conversionItem.unitName,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              subtitle: Text(
                conversionItem.unitAbbreviation,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              trailing: conversionItem.unitName == conversionData.selectedItem
                  ? Icon(Icons.check)
                  : Text(''),
              onTap: () {
                conversionData.setSelectedItem(
                  unitName: conversionItem.unitName,
                  unitAbbreviation: conversionItem.unitAbbreviation,
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
      ),
    );
  }
}

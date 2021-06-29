import 'package:calculator_final/model/conversion.dart';
import 'package:calculator_final/provider/conversion_data.dart';
import 'package:calculator_final/view/components/app_drawer.dart';
import 'package:calculator_final/view/components/conversion_numpad.dart';
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
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Color(0xffffffff),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        drawer: AppDrawer(),
        body: Consumer<ConversionData>(
          builder: (context, conversionData, child) {
            final List<Conversion> conversion =
                conversionData.getConversionList(unitType: unitType);
            return LayoutBuilder(
              builder: (context, BoxConstraints constraints) {
                return Container(
                  color: Color(0xffffffff),
                  child: Column(
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
                                        return Scaffold(
                                          appBar: AppBar(
                                            backgroundColor: Color(0xffffffff),
                                            iconTheme: IconThemeData(
                                                color: Colors.black),
                                            elevation: 0,
                                          ),
                                          body: Container(
                                            color: Color(0xffffffff),
                                            child: ListView.separated(
                                              itemBuilder: (context, index) {
                                                final Conversion
                                                    conversionItem =
                                                    conversion[index];
                                                return ListTile(
                                                  title: Text(
                                                    conversionItem.unitName,
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                  subtitle: Text(
                                                    conversionItem
                                                        .unitAbbreviation,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                  trailing:
                                                      conversionItem.unitName ==
                                                              conversionData
                                                                  .selectedItem
                                                          ? Icon(Icons.check)
                                                          : Text(''),
                                                  onTap: () {
                                                    conversionData
                                                        .setSelectedItem(
                                                      unitName: conversionItem
                                                          .unitName,
                                                      unitAbbreviation:
                                                          conversionItem
                                                              .unitAbbreviation,
                                                    );
                                                    Navigator.pop(context);
                                                  },
                                                );
                                              },
                                              separatorBuilder:
                                                  (context, index) {
                                                return Divider();
                                              },
                                              itemCount: conversion.length,
                                            ),
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
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.grey[700]),
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
                              title: Text(
                                conversionItem.unitName,
                                style: TextStyle(fontSize: 20),
                              ),
                              subtitle: Text(
                                conversionItem.unitAbbreviation,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              trailing: Text(
                                conversionData.result(
                                  unitName: conversionItem.unitName,
                                ),
                                style: TextStyle(
                                    fontSize: 20, color: Colors.grey[700]),
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
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

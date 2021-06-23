import 'package:calculator_final/view/components/app_drawer.dart';
import 'package:calculator_final/view/components/app_end_drawer.dart';
import 'package:calculator_final/view/components/numpad.dart';
import 'package:calculator_final/view/components/process.dart';
import 'package:calculator_final/view/components/scientific_keyboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: AppDrawer(),
        endDrawer: AppEndDrawer(),
        appBar: AppBar(
          actions: [
            Builder(
              builder: (context) {
                return IconButton(
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  icon: Icon(Icons.history),
                );
              },
            ),
          ],
        ),
        body: LayoutBuilder(
          builder: (context, BoxConstraints constraints) {
            return Column(
              children: [
                SizedBox(
                  width: constraints.maxWidth,
                  height: constraints.maxHeight * 0.4,
                  child: Process(),
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.6,
                  child: LayoutBuilder(
                    builder: (buildContext, BoxConstraints boxConstraints) {
                      return Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            bottom: 0,
                            child: SizedBox(
                              width: boxConstraints.maxWidth * 0.9,
                              child: Numpad(),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            bottom: 0,
                            child: ScientificKeyboard(),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

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
          title: Text(
            'Hesap Makinesi',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Color(0xffffffff),
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
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
                  height: constraints.maxHeight * 0.2,
                  child: Process(),
                ),
                Divider(
                  height: constraints.maxHeight * 0.001,
                  thickness: 2,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.799,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        bottom: 0,
                        child: SizedBox(
                          width: constraints.maxWidth * 0.9,
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

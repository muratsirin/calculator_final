import 'package:calculator_final/provider/conversion_data.dart';
import 'package:calculator_final/provider/utils.dart';
import 'package:calculator_final/view/screens/conversion_screen.dart';
import 'package:calculator_final/view/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: LayoutBuilder(
        builder: (context, BoxConstraints constraints) {
          return Column(
            children: [
              SizedBox(
                height: constraints.maxHeight * 0.2,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Center(
                    child: Text(
                      'Hesap Makinesi',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.7,
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    final listTileData =
                        Provider.of<Utils>(context).drawerMenuList[index];
                    return Consumer<ConversionData>(
                      builder: (context, conversionData, child) {
                        return ListTile(
                          leading: Icon(
                            listTileData.iconData,
                            color: Color(0xffe30997),
                            size: 30,
                          ),
                          title: Text(
                            listTileData.title,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          onTap: () {
                            conversionData.updateSelectedItem(index: index);
                            if (index == 0) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(),
                                ),
                              );
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ConversionScreen(
                                      unitType: listTileData.title),
                                ),
                              );
                            }
                          },
                        );
                      },
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                  itemCount: Provider.of<Utils>(context).drawerMenuList.length,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: SwitchListTile(
                  title: Text(
                    'Karanlık Mod',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                    ),
                  ),
                  value: false,
                  secondary: Icon(
                    FontAwesomeIcons.moon,
                    color: Color(0xff004f94),
                    size: 30,
                  ),
                  onChanged: (value) {},
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

import 'package:calculator_final/provider/history_data.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class AppEndDrawer extends StatelessWidget {
  const AppEndDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: LayoutBuilder(
        builder: (context, BoxConstraints constraints) {
          return Column(
            children: [
              GestureDetector(
                child: SizedBox(
                  height: constraints.maxHeight * 0.2,
                  child: ListTile(
                    title: Text('Geçmiş'),
                    trailing: Icon(FontAwesomeIcons.trash),
                  ),
                ),
                onTap: () {
                  Provider.of<HistoryData>(context, listen: false).getHistory();
                },
              ),
              SizedBox(
                height: constraints.maxHeight * 0.8,
                child: Consumer<HistoryData>(
                  builder: (context, historyData, child) {
                    return FutureBuilder(
                      future: historyData.getHistory(),
                      builder: (context, snapshot) {
                        return ListView.separated(
                          itemBuilder: (context, index) {
                            final history = historyData.historyList[index];
                            return ListTile(
                              title: Text(history.processText),
                              subtitle: Text(
                                history.processResult,
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              onTap: () {},
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Divider();
                          },
                          itemCount: historyData.historyList.length,
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

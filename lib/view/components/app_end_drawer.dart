import 'package:auto_size_text/auto_size_text.dart';
import 'package:calculator_final/provider/calculator_data.dart';
import 'package:calculator_final/provider/history_data.dart';
import 'package:calculator_final/view/components/show_alert_dialog.dart';
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
              SizedBox(
                height: constraints.maxHeight * 0.1,
                child: ListTile(
                  title: Text(
                    'Geçmiş',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      FontAwesomeIcons.trash,
                    ),
                    onPressed: () {
                      showAlertDialog(
                        context: context,
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.9,
                child: Consumer<HistoryData>(
                  builder: (context, historyData, child) {
                    return FutureBuilder(
                      future: historyData.getHistory(),
                      builder: (context, snapshot) {
                        return ListView.separated(
                          itemBuilder: (context, index) {
                            final history = historyData.historyList[index];
                            return Dismissible(
                              key: Key(history.processText),
                              child: ListTile(
                                title: AutoSizeText(
                                  history.processResult,
                                  style: TextStyle(
                                    fontSize: 25,
                                  ),
                                  maxLines: 1,
                                ),
                                trailing: AutoSizeText(
                                  history.processText,
                                  style: TextStyle(
                                    fontSize: 25,
                                  ),
                                  maxLines: 1,
                                ),
                                onTap: () {
                                  Provider.of<CalculatorData>(context,
                                          listen: false)
                                      .historyPressed(
                                    historyProcessText: history.processText,
                                  );
                                },
                              ),
                              onDismissed: (direction) {
                                historyData.deleteHistory(history.id);
                              },
                              direction: DismissDirection.endToStart,
                              background: Container(
                                color: Colors.red,
                              ),
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

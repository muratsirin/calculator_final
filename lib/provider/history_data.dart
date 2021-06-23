import 'package:calculator_final/model/history.dart';
import 'package:calculator_final/provider/calculator_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryData extends CalculatorData {
  late SharedPreferences sharedPreferences;
  String stringValue = '';
  String text = '';
  List<History> historyList = [];
  String encodedData = '';

  addHistory({required String processText, required String result}) async {
    int id = DateTime.now().millisecondsSinceEpoch;
    historyList
        .add(History(id: id, processText: processText, processResult: result));
    encodedData = History.encode(historyList);
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('history', encodedData);
    print(sharedPreferences.getString('history'));
  }

  Future<List<History>> getHistory() async {
    sharedPreferences = await SharedPreferences.getInstance();
    historyList =
        History.decode(sharedPreferences.getString('history').toString());
    return historyList;
  }
}

import 'package:calculator_final/provider/history_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

showAlertDialog({required BuildContext context}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Text('İşlem geçmişi silinecektir. Onaylıyor musunuz?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('İptal'),
          ),
          TextButton(
            onPressed: () {
              Provider.of<HistoryData>(context, listen: false)
                  .deleteAllHistory();
              Navigator.pop(context);
            },
            child: Text('Evet'),
          ),
        ],
      );
    },
  );
}

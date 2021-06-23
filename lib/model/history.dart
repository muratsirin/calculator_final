import 'dart:convert';

class History {
  final int id;
  final String processText;
  final String processResult;

  History({
    required this.id,
    required this.processText,
    required this.processResult,
  });

  factory History.fromJson(Map<String, dynamic> jsonData) {
    return History(
      id: jsonData['id'],
      processText: jsonData['processText'],
      processResult: jsonData['processResult'],
    );
  }

  static Map<String, dynamic> toMap(History history) => {
        'id': history.id,
        'processText': history.processText,
        'processResult': history.processResult
      };

  static String encode(List<History> history) => json.encode(
      history.map<Map<String, dynamic>>((e) => History.toMap(e)).toList());

  static List<History> decode(String history) =>
      (json.decode(history) as List<dynamic>)
          .map<History>((e) => History.fromJson(e))
          .toList();
}

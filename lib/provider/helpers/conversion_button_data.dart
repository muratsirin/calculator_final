import 'package:flutter/cupertino.dart';
import 'package:math_expressions/math_expressions.dart';

class ConversionButtonData with ChangeNotifier {
  String text = '';
  String expression = '';
  String processText = '';
  String inputResult = '';
  List<String> operators = ['×', '-', '+', '÷'];
  double expValue = 1;

  void buttonPressed({required String buttonText}) {
    if (text.characters.last == ')') {
      processText += '*' + buttonText;
    } else {
      processText += buttonText;
    }

    if (buttonText == 'C') {
      clearPressed();
    } else if (text.length == 1 && text.characters.last == '0') {
      replaceOperatorButton(buttonText: buttonText);
    } else {
      text += buttonText;
    }
    notifyListeners();
  }

  void operatorButtonPressed({required String buttonText}) {
    if (!operators.contains(text.characters.last)) {
      processText += buttonText;
      text += buttonText;
    } else if (text.characters.last != '+' && buttonText == '+') {
      replaceOperatorButton(buttonText: buttonText);
    } else if (text.characters.last == '+' && buttonText == '-') {
      replaceOperatorButton(buttonText: buttonText);
    } else if (buttonText == '-' && text.characters.last == '×' ||
        text.characters.last == '÷' && buttonText == '-') {
      processText += buttonText;
      text += buttonText;
    } else if (text.characters.last != '÷' && buttonText == '÷') {
      replaceOperatorButton(buttonText: buttonText);
    } else if (buttonText == '×' && text.characters.last != '×') {
      replaceOperatorButton(buttonText: buttonText);
    }

    notifyListeners();
  }

  void bracketPressed({required String buttonText}) {
    if (text != '') {
      if (buttonText == '(') {
        if (!operators.contains(text.characters.last) &&
            text.characters.last != '(') {
          processText += '*' + buttonText;
        } else {
          processText += buttonText;
        }
      } else {
        processText += buttonText;
      }
    } else {
      processText += buttonText;
    }

    text += buttonText;

    notifyListeners();
  }

  void replaceOperatorButton({required buttonText}) {
    processText = processText.replaceFirst(processText.characters.last,
        buttonText, processText.lastIndexOf(processText.characters.last));
    text = text.replaceFirst(text.characters.last, buttonText,
        text.lastIndexOf(text.characters.last));
  }

  void deleteCharacter() {
    if (text != '0' && processText != '0' && expression != '0') {
      if (text.length == 1) {
        text = '0';
        inputResult = '0';
        processText = '0';
        expValue = 0;
      } else {
        text = text.substring(0, text.length - 1);
        processText = processText.substring(0, processText.length - 1);
      }
    }

    notifyListeners();
  }

  void clearPressed() {
    text = '0';
    processText = '0';
    inputResult = '0';
    expValue = 0;
    notifyListeners();
  }

  String getInputResult() {
    expression = processText;
    expression += ")" *
        ("\(".allMatches(expression).length -
            "\)".allMatches(expression).length);

    expression = expression.replaceAll('×', '*');
    expression = expression.replaceAll('÷', '/');
    expression = expression.replaceAll(',', '.');

    try {
      Parser parser = Parser();
      Expression exp = parser.parse(expression);
      ContextModel contextModel = ContextModel();

      expValue = exp.evaluate(EvaluationType.REAL, contextModel);
      inputResult = expValue.toStringAsFixed(6);
      inputResult = inputResult.replaceAll(RegExp(r"([.]*000000)(?!.*\d)"), "");
    } catch (e) {}

    return inputResult;
  }

  void thenNumpad() {
    text = inputResult;
    notifyListeners();
  }
}

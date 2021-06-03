import 'package:flutter/cupertino.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorData with ChangeNotifier {
  TextEditingController textEditingController = TextEditingController();
  String result = '0';
  String expression = '';
  String btnText = '';
  String bracketText = '';
  String xBracket = '';
  String processText = '';
  List<String> numbers = ['0', '2', '3'];
  bool inList = false;

  void buttonPressed({required String buttonText}) {
    if (buttonText == 'ln') {
      buttonText = 'ln(';
      bracketText = '(';
    }
    if (textEditingController.text.endsWith(')')) {
      processText += '×' + buttonText;
      textEditingController.text += '×' + buttonText;
    } else {
      processText += buttonText;
      textEditingController.text += buttonText;
    }
    notifyListeners();
  }

  void bracketPressed({required String buttonText}) {
    bracketText = buttonText;
    if (textEditingController.text != '') {
      if (bracketText == '(') {
        if (!textEditingController.text.endsWith('×') &&
            !textEditingController.text.endsWith('-') &&
            !textEditingController.text.endsWith('+') &&
            !textEditingController.text.endsWith('÷') &&
            !textEditingController.text.endsWith('(')) {
          xBracket += ')';
          bracketText = '×(';
          if (!processText.endsWith('3')) {
            processText += ')';
          }
        } else {
          bracketText = '(';
        }
      }
    }

    processText += bracketText;
    textEditingController.text += bracketText;

    notifyListeners();
  }

  void deleteCharacter() {
    if (textEditingController.text != '') {
      textEditingController.text = textEditingController.text
          .substring(0, textEditingController.text.length - 1);
      processText = processText.substring(0, processText.length - 1);
      expression = expression.substring(0, expression.length - 1);
    }
  }

  void operatorButtonPressed({required String buttonText}) {
    if (!textEditingController.text.endsWith('×') &&
        !textEditingController.text.endsWith('-') &&
        !textEditingController.text.endsWith('+') &&
        !textEditingController.text.endsWith('÷')) {
      processText += buttonText;
      textEditingController.text += buttonText;
    } else if (textEditingController.text.endsWith('×') &&
        buttonText != '×' &&
        buttonText != '-') {
      deleteCharacter();
      processText += buttonText;
      textEditingController.text += buttonText;
    } else if (textEditingController.text.endsWith('÷') &&
        buttonText != '÷' &&
        buttonText != '-') {
      deleteCharacter();
      processText += buttonText;
      textEditingController.text += buttonText;
    } else if (textEditingController.text.endsWith('-') && buttonText != '-') {
      deleteCharacter();
      processText += buttonText;
      textEditingController.text += buttonText;
    } else if (textEditingController.text.endsWith('+') && buttonText != '+') {
      deleteCharacter();
      processText += buttonText;
      textEditingController.text += buttonText;
    } else if (textEditingController.text.endsWith('÷') ||
        textEditingController.text.endsWith('×') && buttonText == '-') {
      processText += buttonText;
      textEditingController.text += buttonText;
    }
    notifyListeners();
  }

  void backSpacePressed() {
    deleteCharacter();
    if (textEditingController.text == '') {
      result = '0';
    }
    notifyListeners();
  }

  void clearPressed() {
    textEditingController.text = '';
    result = '0';
    notifyListeners();
  }

  String textResult() {
    double value;

    if (textEditingController.text != '') {
      if (!textEditingController.text.endsWith('×') &&
          !textEditingController.text.endsWith('-') &&
          !textEditingController.text.endsWith('+') &&
          !textEditingController.text.endsWith('÷') &&
          !textEditingController.text.endsWith(')')) {
        if (bracketText == ')' || bracketText == '') {
          expression = processText;
        } else {
          expression = processText + ')';
        }
      }
    }

    expression = expression.replaceAll('×', '*');
    expression = expression.replaceAll('÷', '/');
    expression = expression.replaceAll(',', '.');
    print(expression);
    if (btnText != '%') {
      expression = expression.replaceAll('%', '*10/1000*0');
    } else {
      expression = expression.replaceAll('%', '*10/1000');
    }

    try {
      Parser parser = Parser();
      Expression exp = parser.parse(expression);
      ContextModel contextModel = ContextModel();

      value = exp.evaluate(EvaluationType.REAL, contextModel);
      result = value.toStringAsFixed(9);
    } catch (e) {
      if (textEditingController.text != '') {
        result = 'Hatalı ifade';
      } else {
        result = result;
      }
    }
    result = result.replaceAll(RegExp(r"([.]*000000000)(?!.*\d)"), "");
    return result;
  }
}

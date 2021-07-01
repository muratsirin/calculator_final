import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorData with ChangeNotifier {
  String displayText = '';
  String result = '0';
  String expression = '';
  String processText = '';
  String numberText = '';
  String operatorButton = '';
  List<String> numbers = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  List<String> operators = ['×', '-', '+', '÷'];

  void historyPressed({required String historyProcessText}) {
    displayText = historyProcessText;
    processText = historyProcessText;
    notifyListeners();
  }

  String get displayTextLastCharacter {
    if (displayText != '') {
      return displayText.characters.last;
    } else {
      return '';
    }
  }

  String get processLastCharacter {
    return processText.characters.last;
  }

  void buttonPressed({required String buttonText}) {
    xButtonText(buttonText: buttonText);

    if (operatorButton == '') {
      processText = processText.replaceAll('%', '/100');
    }

    numberText = buttonText;
    displayText += buttonText;
    notifyListeners();
  }

  void bracketPressed({required String buttonText}) {
    if (displayText != '') {
      if (buttonText == '(') {
        if (!operators.contains(displayTextLastCharacter) &&
            displayTextLastCharacter != '(') {
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

    displayText += buttonText;

    notifyListeners();
  }

  void operatorButtonPressed({required String buttonText}) {
    if (!operators.contains(displayTextLastCharacter)) {
      processText += buttonText;
      displayText += buttonText;
    } else if (displayTextLastCharacter != '+' && buttonText == '+') {
      replaceOperatorButton(buttonText: buttonText);
    } else if (displayTextLastCharacter == '+' && buttonText == '-') {
      replaceOperatorButton(buttonText: buttonText);
    } else if (buttonText == '-' && displayTextLastCharacter == '×' ||
        displayTextLastCharacter == '÷' && buttonText == '-') {
      processText += buttonText;
      displayText += buttonText;
    } else if (displayTextLastCharacter != '÷' && buttonText == '÷') {
      replaceOperatorButton(buttonText: buttonText);
    } else if (buttonText == '×' && displayTextLastCharacter != '×') {
      replaceOperatorButton(buttonText: buttonText);
    }
    operatorButton = buttonText;
    notifyListeners();
  }

  void scientificButtonPressed({required String buttonText}) {
    switch (buttonText) {
      case 'ln':
        buttonText = 'ln(';
        xButtonText(buttonText: buttonText);
        break;
      case 'log':
        buttonText = 'log(';
        xButtonText(buttonText: buttonText);
        break;
      case 'sin':
        buttonText = 'sin(';
        xButtonText(buttonText: buttonText);
        break;
      case 'cos':
        buttonText = 'cos(';
        xButtonText(buttonText: buttonText);
        break;
      case 'tan':
        buttonText = 'tan(';
        xButtonText(buttonText: buttonText);
        break;
      case '√':
        if (numberText != '' && !operators.contains(displayTextLastCharacter)) {
          processText += '*√';
          numberText = '';
        } else {
          processText += buttonText;
        }
        break;
      case 'e':
        if (numberText != '' && !operators.contains(displayTextLastCharacter)) {
          processText += '*e';
          numberText = '';
        } else {
          processText += buttonText;
        }
        break;
      case 'π':
        if (numberText != '' && !operators.contains(displayTextLastCharacter)) {
          processText += '*π';
          numberText = '';
        } else {
          processText += buttonText;
        }
        break;
      case '^':
        processText += buttonText;
        break;
      case '!':
        processText += buttonText;
    }

    displayText += buttonText;
    notifyListeners();
  }

  void percentageButtonPressed({required String buttonText}) {
    if (operatorButton == '+' || operatorButton == '-') {
      if (displayTextLastCharacter == '%') {
        processText += '/100';
      } else {
        processText += buttonText;
      }
    } else {
      processText += '/100';
    }
    displayText += buttonText;
    notifyListeners();
  }

  void deleteCharacter() {
    if (displayText != '' && processText != '' && expression != '') {
      displayText = displayText.substring(0, displayText.length - 1);
      processText = processText.substring(0, processText.length - 1);

      // expression = expression.substring(0, expression.length - 1);
      numberText = '';
    }
    notifyListeners();
  }

  void backSpacePressed() {
    deleteCharacter();
    if (displayText == '') {
      result = '0';
    }
    notifyListeners();
  }

  void clearPressed() {
    displayText = '';
    processText = '';
    numberText = '';
    result = '0';
    notifyListeners();
  }

  void equalButtonPressed() {
    displayText = result;
    notifyListeners();
  }

  String textResult() {
    double value;

    if (displayText != '') {
      if (processLastCharacter == '*') {
        processText = processText.substring(0, processText.length - 1);
      } else {
        processText = processText;
      }
    }

    expression = processText;
    expression += ")" *
        ("\(".allMatches(expression).length -
            "\)".allMatches(expression).length);

    expression = expression.replaceAll('×', '*');
    expression = expression.replaceAll('÷', '/');
    expression = expression.replaceAll(',', '.');
    expression = expression.replaceAll('%', 'mod');
    // expression = expression.replaceAll('%', 'prcnt');

    expression = expression.replaceAll('√', 'sqrt');
    expression = expression.replaceAll('!', 'fact');
    expression = expression.replaceAll('e', '2.7182818285');
    expression = expression.replaceAll('π', pi.toString());

    try {
      Parser parser = Parser();
      Expression exp = parser.parse(expression);
      ContextModel contextModel = ContextModel();

      value = exp.evaluate(EvaluationType.REAL, contextModel);
      result = value.toString();
    } catch (e) {
      if (displayText != '') {
        result = 'Hatalı ifade';
      } else {
        result = result;
      }
    }

    result = result.replaceAll('.', ',');
    if (result == '0') {
      result = '0';
    } else {
      result = result.replaceAll(RegExp(r"([,]*0)(?!.*\d)"), "");
    }

    print('displayText' + displayText);
    print('processText' + processText);
    print('result' + result);

    return result;
  }

  void xButtonText({required buttonText}) {
    if (displayTextLastCharacter == ')' ||
        displayTextLastCharacter == '%' ||
        displayTextLastCharacter == 'e' ||
        displayTextLastCharacter == '!' ||
        displayTextLastCharacter == 'π') {
      processText += '*' + buttonText;
      operatorButton = '';
    } else {
      processText += buttonText;
    }
  }

  void replaceOperatorButton({required buttonText}) {
    processText = processText.replaceFirst(processText.characters.last,
        buttonText, processText.lastIndexOf(processLastCharacter));
    displayText = displayText.replaceFirst(displayTextLastCharacter, buttonText,
        displayText.lastIndexOf(displayTextLastCharacter));
  }
}

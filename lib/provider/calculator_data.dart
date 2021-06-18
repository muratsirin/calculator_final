import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorData with ChangeNotifier {
  TextEditingController textEditingController = TextEditingController();
  String result = '0';
  String expression = '';
  String processText = '';
  String btnText = '';
  String numberText = '';
  String percentageText = '1';
  List<String> numbersToAdd = [];
  String percentageTextBrackets = '1';
  String textController = '';
  String operatorButton = '';
  List<String> numbers = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  List<String> operators = ['×', '-', '+', '÷'];

  String get controllerText {
    return textEditingController.text;
  }

  String get controllerLastCharacter {
    if (textEditingController.text != '') {
      return controllerText.characters.last;
    } else {
      return '';
    }
  }

  String get processLastCharacter {
    return processText.characters.last;
  }

  void buttonPressed({required String buttonText}) {
    if (!operators.contains(controllerLastCharacter)) {
      btnText += buttonText;
    } else {
      btnText = buttonText;
    }

    xButtonText(buttonText: buttonText);

    if (operatorButton == '') {
      processText = processText.replaceAll('%', '/100');
    }

    numberText = buttonText;
    textEditingController.text += buttonText;
    notifyListeners();
  }

  void bracketPressed({required String buttonText}) {
    if (controllerText != '') {
      if (buttonText == '(') {
        if (!operators.contains(controllerLastCharacter) &&
            controllerLastCharacter != '(') {
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

    textEditingController.text += buttonText;

    notifyListeners();
  }

  void operatorButtonPressed({required String buttonText}) {
    if (!operators.contains(controllerLastCharacter)) {
      processText += buttonText;
      textEditingController.text += buttonText;
    } else if (controllerLastCharacter != '+' && buttonText == '+') {
      replaceOperatorButton(buttonText: buttonText);
    } else if (controllerLastCharacter == '+' && buttonText == '-') {
      replaceOperatorButton(buttonText: buttonText);
    } else if (buttonText == '-' && controllerLastCharacter == '×' ||
        controllerLastCharacter == '÷' && buttonText == '-') {
      processText += buttonText;
      textEditingController.text += buttonText;
    } else if (controllerLastCharacter != '÷' && buttonText == '÷') {
      replaceOperatorButton(buttonText: buttonText);
    } else if (buttonText == '×' && controllerLastCharacter != '×') {
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
        if (numberText != '' && !operators.contains(controllerLastCharacter)) {
          processText += '×√';
          numberText = '';
        } else {
          processText += buttonText;
        }
        break;
      case 'e':
        if (numberText != '' && !operators.contains(controllerLastCharacter)) {
          processText += '×e';
          numberText = '';
        } else {
          processText += buttonText;
        }
        break;
      case 'π':
        if (numberText != '' && !operators.contains(controllerLastCharacter)) {
          processText += '×π';
          numberText = '';
        } else {
          processText += buttonText;
        }
        break;
    }

    textEditingController.text += buttonText;
    notifyListeners();
  }

  void percentageButtonPressed({required String buttonText}) {
    if (operatorButton == '+' || operatorButton == '-') {
      if (controllerLastCharacter == '%') {
        processText += '/100';
      } else {
        processText += buttonText;
      }
    } else {
      processText += '/100';
    }
    textEditingController.text += buttonText;
    btnText = '%';
    notifyListeners();
  }

  void deleteCharacter() {
    if (controllerText != '' && processText != '' && expression != '') {
      textEditingController.text = textEditingController.text
          .substring(0, textEditingController.text.length - 1);
      processText = processText.substring(0, processText.length - 1);
      // expression = expression.substring(0, expression.length - 1);
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
    processText = '';
    result = '0';
    notifyListeners();
  }

  String textResult() {
    double value;

    // if (numbers.contains(controllerLastCharacter)) {
    //   processText = processText.replaceAll('*($text)/100', '/100');
    //   print('2.if');
    // }

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
      result = value.toStringAsFixed(9);
    } catch (e) {
      if (textEditingController.text != '') {
        result = 'Hatalı ifade';
      } else {
        result = result;
      }
    }

    print(expression);
    print(processText);
    print('text:' + percentageText);
    print('textController: ' + textController);

    print(pi);
    // result = result.replaceAll(RegExp(r"([.]*000000000)(?!.*\d)"), "");
    result = result.replaceAll('.', ',');
    return result;
  }

  void xButtonText({required buttonText}) {
    if (controllerLastCharacter == ')' ||
        controllerLastCharacter == '%' ||
        controllerLastCharacter == 'e' ||
        controllerLastCharacter == '!' ||
        controllerLastCharacter == 'π') {
      processText += '*' + buttonText;
      operatorButton = '';
    } else {
      processText += buttonText;
    }
  }

  void replaceOperatorButton({required buttonText}) {
    processText = processText.replaceFirst(processText.characters.last,
        buttonText, processText.lastIndexOf(processLastCharacter));
    textEditingController.text = textEditingController.text.replaceFirst(
        controllerLastCharacter,
        buttonText,
        textEditingController.text.lastIndexOf(controllerLastCharacter));
  }
}

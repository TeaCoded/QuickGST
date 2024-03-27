import 'package:math_expressions/math_expressions.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  var input = ''.obs;
  var output = 0.0.obs;
  var operator = ''.obs;
  var totalGSTAmount = 0.0.obs;
  var cGST = 0.0.obs;
  var totalAmount = 0.0.obs;
  var netPrice = 0.0.obs;

  void onButtonPress(value) {
    if (value == 'C') {
      if (input.value.isNotEmpty) {
        input.value = input.value.substring(0, input.value.length - 1);
      }
    } else {
      if (value == '+' || value == '-' || value == '×' || value == '/') {
        // Check if the last character in input is also an operator
        if (input.value.isNotEmpty &&
            (input.value.endsWith('+') ||
                input.value.endsWith('-') ||
                input.value.endsWith('×') ||
                input.value.endsWith('/'))) {
          // Remove the last operator
          input.value = input.value.substring(0, input.value.length - 1);
        }
      }
      input.value = input.value + value;
    }
  }

  void additionGST(int percentage) {
    if (input.value.isNotEmpty) {
      var userInput = input.value;
      userInput = userInput.replaceAll('×', '*');
      Parser p = Parser();
      Expression expression = p.parse(userInput);
      ContextModel cm = ContextModel();
      var finalValue = expression.evaluate(EvaluationType.REAL, cm);
      output.value = finalValue;
      totalGSTAmount.value = (output.value * percentage) / 100;
      cGST.value = totalGSTAmount.value / 2;
      totalAmount.value = output.value + totalGSTAmount.value;
    }
  }
  void subtractionGST(int percentage) {
    if (input.value.isNotEmpty) {
      var userInput = input.value;
      userInput = userInput.replaceAll('×', '*');
      Parser p = Parser();
      Expression expression = p.parse(userInput);
      ContextModel cm = ContextModel();
      var finalValue = expression.evaluate(EvaluationType.REAL, cm);
      output.value = finalValue;
      netPrice.value = (output/(1+percentage/100));
      totalGSTAmount.value = (output.value - netPrice.value);
      cGST.value = totalGSTAmount.value / 2;
    }
  }

  void resetValues() {
    input.value = '';
    output.value = 0.0;
  }
}

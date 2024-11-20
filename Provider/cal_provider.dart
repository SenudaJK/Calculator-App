import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';

class CalculatorProvider extends ChangeNotifier {
  final compController = TextEditingController();

  setValue(String value) {
    String str = compController.text;
    switch(value) {
      case "C":
        compController.clear();
        break;
      case "AC":
        compController.text = str.substring(0, str.length - 1);
        break;
      case "X":
        compController.text = "$str*";
        break;
      case "/":
        compController.text = "$str/";
        break;
      case "-":
        compController.text = "$str-";
        break;
      case "=":
        compute();
        break;
      case "%":
        compController.text = (double.parse(str) / 100).toString();
        break;
      default:
        compController.text = str + value;
    }
    compController.selection = TextSelection.fromPosition(
      TextPosition(offset: compController.text.length)
    ); 
  }

  compute() {
    String text = compController.text;
    compController.text =  text.interpret().toString();
  }

  @override
  void dispose() {
    compController.dispose();
    super.dispose();
  }
}
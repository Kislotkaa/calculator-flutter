import 'package:calculator/app/model/calcs_operation.dart' as SDA;
import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:dartx/dartx.dart';

class HomeController extends GetxController {
  late RxString text = ''.obs;
  late RxString textBuf = ''.obs;
  late RxString helper = ''.obs;
  late SDA.Operation operation = SDA.Default();
  Parser p = Parser();

  bool validator() {
    if (operation is SDA.Plus && textBuf.value.length == 2) {
      helper.value = textBuf.value;
      text.value = textBuf.value[textBuf.value.length - 1];
      textBuf.value = textBuf.value[textBuf.value.length - 1];
      return false;
    } else if (operation is SDA.Multiplication) {
      text.value = 'НЕЛЬЗЯ ТАК';
      return false;
    } else if (operation is SDA.Division) {
      text.value = 'НЕЛЬЗЯ ТАК';
      return false;
    } else if (operation is SDA.Pow) {
      text.value = 'НЕЛЬЗЯ ТАК';
      return false;
    } else {
      return true;
    }
  }

  void clear() {
    text.value = '';
    textBuf.value = '';
    helper.value = '';
    operation = SDA.Default();
  }

  void calc() {
    if (validator()) {
      Expression exp = p.parse(textBuf.value);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      helper.value = textBuf.value;
      eval == double.infinity
          ? text.value = 'НЕЛЬЗЯ ТАК'
          : text.value = eval.toString();
      operation = SDA.Default();
    }
  }

  void addSymbol(String symbol) {
    if (operation is SDA.Default) {
      textBuf.value += symbol;
      text.value += symbol;
    } else {
      textBuf.value += operation.operation;
      text.value += operation.operation;
      textBuf.value += symbol;
      text.value += symbol;
      calc();
    }
  }

  void useOperation(SDA.Operation operation) {
    this.operation = operation;
  }
}

import 'package:calculator/app/model/calcs_operation.dart' as Op;
import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeController extends GetxController {
  late RxString text = ''.obs;
  late RxString helper = ''.obs;
  late Op.Operation operation = Op.Default();
  Parser p = Parser();

  bool validator() {
    if (operation is Op.Plus && helper.value.length == 2) {
      text.value = helper.value[helper.value.length - 1];
      helper.value = helper.value[helper.value.length - 1];
      return false;
    } else {
      return true;
    }
  }

  void clear() {
    text.value = '';
    helper.value = '';
    operation = Op.Default();
  }

  void calc() {
    if (validator()) {
      Expression exp = p.parse(helper.value);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      eval == double.infinity
          ? text.value = 'НЕЛЬЗЯ ТАК'
          : text.value = eval.toString();
      operation = Op.Default();
    }
  }

  void addSymbol(String symbol) {
    if (operation is Op.Default) {
      helper.value += symbol;
      text.value += symbol;
    } else {
      helper.value += operation.operation;
      text.value += operation.operation;
      helper.value += symbol;
      text.value += symbol;
      calc();
    }
  }

  void useOperation(Op.Operation operation) {
    this.operation = operation;
  }
}

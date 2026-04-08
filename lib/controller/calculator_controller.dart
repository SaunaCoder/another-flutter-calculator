import '../model/calculator_model.dart';

class CalculatorController {

  final CalculatorModel _model = CalculatorModel();

  String display = "0";

  double? _firstNumber;
  String? _operator;

  void inputNumber(String number) {
    if (display == "0") {
      display = number;
    } else {
      display += number;
    }
  }

  void setOperator(String operator) {
    _firstNumber = double.parse(display);
    _operator = operator;
    display = "0";
  }

  void calculate() {
    if (_firstNumber == null || _operator == null) return;

    double secondNumber = double.parse(display);

    double result =
    _model.calculate(_firstNumber!, secondNumber, _operator!);

    display = result.toString();

    _firstNumber = null;
    _operator = null;
  }

  void clear() {
    display = "0";
    _firstNumber = null;
    _operator = null;
  }
}
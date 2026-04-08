import '../model/calculator_model.dart';
import '../database/db_helper.dart';
import 'package:intl/intl.dart';

class CalculatorController {

  final CalculatorModel _model = CalculatorModel();
  final DBHelper _dbHelper = DBHelper();

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
    _firstNumber = double.tryParse(display);
    _operator = operator;
    display = "0";
  }

  Future<void> calculate() async {
    if (_firstNumber == null || _operator == null) return;

    double secondNumber = double.tryParse(display) ?? 0;

    double result =
    _model.calculate(_firstNumber!, secondNumber, _operator!);

    String calculation = "$_firstNumber $_operator $secondNumber = $result";
    String timestamp = DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now());

    await _dbHelper.insertHistory(calculation, timestamp);

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

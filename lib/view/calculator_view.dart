import 'package:flutter/material.dart';
import '../controller/calculator_controller.dart';
import 'converter_view.dart';
import 'history_view.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final CalculatorController controller = CalculatorController();

  Widget buildButton(String text, {Color? color, Function()? onTap}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color ?? const Color(0xFF2A2A2A),
            padding: const EdgeInsets.all(22),
            shape: const CircleBorder(),
          ),
          onPressed: onTap,
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildRow(List<Widget> buttons) {
    return Row(children: buttons);
  }

  void _onNumberPress(String number) {
    setState(() {
      controller.inputNumber(number);
    });
  }

  void _onOperatorPress(String operator) {
    setState(() {
      controller.setOperator(operator);
    });
  }

  Future<void> _onEqualsPress() async {
    await controller.calculate();
    setState(() {});
  }

  void _onClearPress() {
    setState(() {
      controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.history, color: Colors.orange),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HistoryPage()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.compare_arrows, color: Colors.orange),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ConverterPage()),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [

            // Display
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.all(24),
                child: Text(
                  controller.display,
                  style: const TextStyle(
                    fontSize: 64,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),

            // Buttons
            buildRow([
              buildButton("C", color: Colors.grey, onTap: _onClearPress),
              buildButton("±", color: Colors.grey, onTap: () {}),
              buildButton("%", color: Colors.grey, onTap: () {}),
              buildButton("÷", color: Colors.orange, onTap: () => _onOperatorPress("/")),
            ]),

            buildRow([
              buildButton("7", onTap: () => _onNumberPress("7")),
              buildButton("8", onTap: () => _onNumberPress("8")),
              buildButton("9", onTap: () => _onNumberPress("9")),
              buildButton("×", color: Colors.orange, onTap: () => _onOperatorPress("*")),
            ]),

            buildRow([
              buildButton("4", onTap: () => _onNumberPress("4")),
              buildButton("5", onTap: () => _onNumberPress("5")),
              buildButton("6", onTap: () => _onNumberPress("6")),
              buildButton("-", color: Colors.orange, onTap: () => _onOperatorPress("-")),
            ]),

            buildRow([
              buildButton("1", onTap: () => _onNumberPress("1")),
              buildButton("2", onTap: () => _onNumberPress("2")),
              buildButton("3", onTap: () => _onNumberPress("3")),
              buildButton("+", color: Colors.orange, onTap: () => _onOperatorPress("+")),
            ]),

            buildRow([
              buildButton("0", onTap: () => _onNumberPress("0")),
              buildButton(".", onTap: () => _onNumberPress(".")),
              buildButton("=", color: Colors.orange, onTap: _onEqualsPress),
            ]),

            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}

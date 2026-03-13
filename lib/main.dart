import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const CalculatorPage(),
    );
  }
}

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  Widget buildButton(String text, {Color? color}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color ?? const Color(0xFF2A2A2A),
            padding: const EdgeInsets.all(22),
            shape: const CircleBorder(),
          ),
          onPressed: () {},
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(
        child: Column(
          children: [

            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.all(24),
                child: const Text(
                  "0",
                  style: TextStyle(
                    fontSize: 64,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),

            buildRow([
              buildButton("C", color: Colors.grey),
              buildButton("±", color: Colors.grey),
              buildButton("%", color: Colors.grey),
              buildButton("÷", color: Colors.orange),
            ]),

            buildRow([
              buildButton("7"),
              buildButton("8"),
              buildButton("9"),
              buildButton("×", color: Colors.orange),
            ]),

            buildRow([
              buildButton("4"),
              buildButton("5"),
              buildButton("6"),
              buildButton("-", color: Colors.orange),
            ]),

            buildRow([
              buildButton("1"),
              buildButton("2"),
              buildButton("3"),
              buildButton("+", color: Colors.orange),
            ]),

            buildRow([
              buildButton("0"),
              buildButton("."),
              buildButton("=", color: Colors.orange),
            ]),

            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
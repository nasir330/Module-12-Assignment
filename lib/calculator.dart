import 'package:flutter/material.dart';
import 'package:module_12_assignment/widget/calculator_buttons.dart';

class Calculator extends StatefulWidget {
  final VoidCallback onToggleTheme;
  final bool isDarkMode;
  const Calculator({
    super.key,
    required this.onToggleTheme,
    required this.isDarkMode,
  });

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String input = '';
  String output = '0';
  String operand = '';
  double num1 = 0;
  double num2 = 0;
  String display = '';

  buttonPress(String value) {
    setState(() {
      // Reset
      if (value == 'AC') {
        input = '';
        output = '0';
        operand = '';
        num1 = 0;
        num2 = 0;
        display = '';
        return;
      }

      // Operators
      if (value == '+' || value == '-' || value == '×' || value == '÷') {
        // Prevent multiple operators
        if (input.isEmpty && display.isNotEmpty) {
          String lastChar = display.trimRight().characters.last;
          if (lastChar == '+' ||
              lastChar == '-' ||
              lastChar == '×' ||
              lastChar == '÷') {
            // Replace last operator with new one
            display = display.trimRight();
            display = display.substring(0, display.length - 1) + value + ' ';
            operand = value;
            return;
          }
        }

        // Normal operator input
        if (input.isNotEmpty) {
          display += input + ' ' + value + ' ';
          if (operand.isNotEmpty) {
            num2 = double.tryParse(input) ?? 0;
            switch (operand) {
              case '+':
                num1 += num2;
                break;
              case '-':
                num1 -= num2;
                break;
              case '×':
                num1 *= num2;
                break;
              case '÷':
                num1 = num2 != 0 ? num1 / num2 : double.nan;
                break;
            }
            output = num1.toString();
          } else {
            num1 = double.tryParse(input) ?? 0;
          }
          operand = value;
          input = '';
        } else if (display.isEmpty && value == '-') {
          // Allow negative number at start
          input = '-';
          display = '-';
        } else if (display.isNotEmpty && operand.isEmpty) {
          display += value + ' ';
          operand = value;
        }
        return;
      }

      // Equals
      if (value == '=') {
        if (operand.isNotEmpty && input.isNotEmpty) {
          display += input;
          num2 = double.tryParse(input) ?? 0;

          switch (operand) {
            case '+':
              output = (num1 + num2).toString();
              break;
            case '-':
              output = (num1 - num2).toString();
              break;
            case '×':
              output = (num1 * num2).toString();
              break;
            case '÷':
              output = num2 != 0 ? (num1 / num2).toString() : 'Error';
              break;
          }

          // Update for next operation
          num1 = double.tryParse(output) ?? 0;
          operand = '';
          input = '';
        }
        return;
      }

      // Append digits
      input += value;
      output = input;
    });
  }

  void backspace() {
    setState(() {
      if (input.isNotEmpty) {
        input = input.substring(0, input.length - 1);
        output = input.isNotEmpty ? input : '0';
      } else if (display.isNotEmpty) {
        display = display.trimRight();
        if (display.isNotEmpty) {
          display = display.substring(0, display.length - 1);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
        actions: [
          Text(
            widget.isDarkMode ? 'Dark Mode ' : 'Light Mode ',
            style: TextStyle(
              color: widget.isDarkMode ? Colors.orangeAccent : Colors.white,
              fontSize: 16,
            ),
          ),
          IconButton(
            onPressed: widget.onToggleTheme,
            icon: Icon(
              widget.isDarkMode ? Icons.light_mode : Icons.dark_mode,
              color: widget.isDarkMode ? Colors.orangeAccent : Colors.black87,
              size: 28,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: widget.isDarkMode
                          ? Colors.white10
                          : Colors.black12,
                    ),
                    child: Text(
                      display + input,
                      style: TextStyle(
                        color: widget.isDarkMode
                            ? Colors.white70
                            : Colors.black,
                        fontSize: 24,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                    alignment: Alignment.bottomRight,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: widget.isDarkMode
                          ? Colors.white12
                          : Colors.black26,
                    ),
                    child: Text(
                      "$output",
                      style: TextStyle(
                        color: widget.isDarkMode
                            ? Colors.white70
                            : Colors.black,
                        fontSize: 50,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Calculator buttons
          Row(
            children: [
              CalcButton(
                onclick: () => buttonPress('AC'),
                text: 'AC',
                flex: 2,
                isOperator: true,
              ),
              CalcButton(
                onclick: backspace,
                icon: Icons.backspace_outlined,
                isOperator: true,
              ),
              CalcButton(
                onclick: () => buttonPress('÷'),
                text: '÷',
                isOperator: true,
              ),
            ],
          ),
          Row(
            children: [
              CalcButton(onclick: () => buttonPress('7'), text: '7'),
              CalcButton(onclick: () => buttonPress('8'), text: '8'),
              CalcButton(onclick: () => buttonPress('9'), text: '9'),
              CalcButton(
                onclick: () => buttonPress('×'),
                text: '×',
                isOperator: true,
              ),
            ],
          ),
          Row(
            children: [
              CalcButton(onclick: () => buttonPress('4'), text: '4'),
              CalcButton(onclick: () => buttonPress('5'), text: '5'),
              CalcButton(onclick: () => buttonPress('6'), text: '6'),
              CalcButton(
                onclick: () => buttonPress('-'),
                text: '-',
                isOperator: true,
              ),
            ],
          ),
          Row(
            children: [
              CalcButton(onclick: () => buttonPress('1'), text: '1'),
              CalcButton(onclick: () => buttonPress('2'), text: '2'),
              CalcButton(onclick: () => buttonPress('3'), text: '3'),
              CalcButton(
                onclick: () => buttonPress('+'),
                text: '+',
                isOperator: true,
              ),
            ],
          ),
          Row(
            children: [
              CalcButton(onclick: () => buttonPress('0'), text: '0'),
              CalcButton(onclick: () => buttonPress('00'), text: '00'),
              CalcButton(onclick: () => buttonPress('.'), text: '.'),
              CalcButton(
                onclick: () => buttonPress('='),
                text: '=',
                isOperator: true,
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: widget.isDarkMode ? Colors.black54 : Colors.indigo,
        height: 42,
        child: Text(
          "Md Nasirul Islam | Flutter Batch-13",
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

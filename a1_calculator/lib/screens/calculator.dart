import 'dart:math';

import 'package:a1_calculator/components/calculator_button.dart';
import 'package:a1_calculator/components/calculator_row.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _displayValue = "";

  // Function to sync the TextField with the state value
  final TextEditingController _screenController = TextEditingController();

  // Sync the screen with the state
  void _updateScreenValue() {
    _screenController.text = _displayValue;
  }

  @override
  void initState() {
    super.initState();
    _updateScreenValue();
  }

  double _performMathOperation(double first, double second, String symbol) {
    switch (symbol) {
      case "%": // Percentage
        return (first * 100) / second;
      case "/":
        return first / second;
      case "*":
        return first * second;
      case "-":
        return first - second;
      case "+":
        return first + second;
      case "^": // Pow
        return pow(first, second).toDouble();
      // Default clalse is supposed to not be reached
      default:
        return 1.0;
    }
  }

  void _updateDisplayValue(String label) {
    List<String> mathSymbols = ["%", "/", "*", "-", "+", "^", "="];

    setState(() {
      if (label == "AC") {
        // Reset display value key
        _displayValue = "";
      } else if (label == "CE") {
        // Remove the last entry key
        String newValue = _displayValue.substring(0, _displayValue.length - 1);
        _displayValue = newValue;
      } else if (mathSymbols.contains(label)) {
        // Math symbols key
        bool hasPreviousOperation = false;
        String currentMathSymbol = "";

        // Search for any other math symbol in the current string
        for (var i = 0; i < _displayValue.length; i++) {
          String currentChar = _displayValue[i];

          if (mathSymbols.contains(currentChar)) {
            hasPreviousOperation = true;
            currentMathSymbol = currentChar;
            break;
          }
        }

        // Perform the previous operation (if any)
        if (hasPreviousOperation) {
          List<String> tokens = _displayValue.split(currentMathSymbol);
          double firstNumber = double.parse(tokens[0]);
          double secondNumber = double.parse(tokens[1]);

          try {
            double result = _performMathOperation(
                firstNumber, secondNumber, currentMathSymbol);

            // Catch common errors
            if (result.isNaN || result.isInfinite) {
              _displayValue = "";
              return;
            }

            // Update the value with the obtained result
            _displayValue = result.toString();
          } catch (e) {
            _displayValue = "ERROR";
          }
        }

        // Append the new math symbol
        if (label != "=") {
          _displayValue += label;
        }
      } else {
        // Append at the end if the label is a number
        _displayValue += label;
      }
      _updateScreenValue();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Calculator")),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                style: const TextStyle(fontSize: 32.0),
                readOnly: true,
                textAlign: TextAlign.right,
                decoration: const InputDecoration(border: OutlineInputBorder()),
                controller: _screenController,
              ),
              CalculatorRow(
                buttons: const [
                  {"label": "AC", "color": Color(0xFFed8e56)},
                  {"label": "CE", "color": Color(0xFFed8e56)},
                  {"label": "%", "color": Color(0xFF636363)},
                  {"label": "/", "color": Color(0xFF636363)},
                ],
                clickCallback: _updateDisplayValue,
              ),
              CalculatorRow(
                buttons: const [
                  {"label": "7", "color": Color(0xFF636363)},
                  {"label": "8", "color": Color(0xFF636363)},
                  {"label": "9", "color": Color(0xFF636363)},
                  {"label": "*", "color": Color(0xFF636363)},
                ],
                clickCallback: _updateDisplayValue,
              ),
              CalculatorRow(
                buttons: const [
                  {"label": "4", "color": Color(0xFF636363)},
                  {"label": "5", "color": Color(0xFF636363)},
                  {"label": "6", "color": Color(0xFF636363)},
                  {"label": "-", "color": Color(0xFF636363)},
                ],
                clickCallback: _updateDisplayValue,
              ),
              CalculatorRow(
                buttons: const [
                  {"label": "1", "color": Color(0xFF636363)},
                  {"label": "2", "color": Color(0xFF636363)},
                  {"label": "3", "color": Color(0xFF636363)},
                  {"label": "+", "color": Color(0xFF636363)},
                ],
                clickCallback: _updateDisplayValue,
              ),
              CalculatorRow(
                buttons: const [
                  {"label": "0", "color": Color(0xFF636363)},
                  {"label": ".", "color": Color(0xFF636363)},
                  {"label": "^", "color": Color(0xFF636363)},
                  {"label": "=", "color": Color(0xFF636363)},
                ],
                clickCallback: _updateDisplayValue,
              )
            ],
          ),
        ));
  }
}

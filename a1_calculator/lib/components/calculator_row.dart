import 'package:a1_calculator/components/calculator_button.dart';
import 'package:flutter/material.dart';

class CalculatorRow extends StatelessWidget {
  final List<Map> buttons;
  final Function clickCallback;

  const CalculatorRow(
      {super.key, required this.buttons, required this.clickCallback});

  // Generate widgets from its labels
  Widget _getCalculatorButtons() {
    List<Widget> children = List.empty(growable: true);

    for (var button in buttons) {
      children.add(CalculatorButton(
        buttonLabel: button['label'],
        buttonColor: button['color'],
        clickCallback: clickCallback,
      ));
    }

    return Row(children: children);
  }

  @override
  Widget build(BuildContext context) {
    return _getCalculatorButtons();
  }
}

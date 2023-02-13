import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String buttonLabel;
  final Color buttonColor;
  final Function clickCallback;

  const CalculatorButton(
      {super.key,
      required this.buttonLabel,
      required this.buttonColor,
      required this.clickCallback});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        // To add some spacing between the buttons
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                // Button styles
                padding: const EdgeInsets.all(24.0),
                textStyle: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
                backgroundColor: buttonColor),
            // ignore: avoid_print
            onPressed: () => clickCallback(buttonLabel),
            child: Text(
              buttonLabel,
              // Button text styles
              style: const TextStyle(color: Colors.white),
            )),
      ),
    );
  }
}

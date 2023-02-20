import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  final Function updateStateCallback;
  final String placeholder;
  final String field;
  final bool isPrivate;

  const FormInput(
      {super.key,
      required this.updateStateCallback,
      required this.placeholder,
      required this.field,
      required this.isPrivate});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      child: TextField(
        obscureText: isPrivate,
        autofocus: true,
        decoration: InputDecoration(
            border: const OutlineInputBorder(), hintText: placeholder),
        onChanged: (value) => updateStateCallback(field, value),
      ),
    );
  }
}

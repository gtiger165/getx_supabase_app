import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
    required this.controller,
    required this.label,
    this.isObscure = false,
    this.inputType = TextInputType.text,
    this.additionalValidator,
  }) : super(key: key);

  final TextEditingController controller;
  final String label;
  final TextInputType inputType;
  final bool isObscure;
  final String? Function(String)? additionalValidator;

  @override
  Widget build(BuildContext context) => TextFormField(
        controller: controller,
        obscureText: isObscure,
        decoration: InputDecoration(
          label: Text("$label"),
        ),
        validator: (val) {
          if (val == null || val.isEmpty) {
            return 'Required';
          }

          additionalValidator?.call(val);

          return null;
        },
        keyboardType: inputType,
      );
}

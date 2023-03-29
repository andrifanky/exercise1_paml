import 'package:exercise1_paml/themes.dart';
import 'package:flutter/material.dart';

class InputTextField extends StatefulWidget {
  const InputTextField({
    super.key,
    required this.icon,
    required this.hint,
    required this.textEditingController,
    required this.textInputType,
    required this.textInputAction,
    required this.validatorMessage
  });

  final Icon icon;
  final String hint;
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final String validatorMessage;

  @override
  State<InputTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: widget.hint,
        prefixIcon: widget.icon,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: kYellowColor),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: kYellowColor),
        )
      ),
      controller: widget.textEditingController,
      keyboardType: widget.textInputType,
      textInputAction: widget.textInputAction,
      validator: (value) {
        if (widget.textInputType == TextInputType.emailAddress) {
          if (!value.toString().contains('@')) {
            return 'Email salah';
          }
        } else {
          if (value.toString().trim().isEmpty) {
            return widget.validatorMessage;
          }
        }
        return null;
      },
    );
  }
}

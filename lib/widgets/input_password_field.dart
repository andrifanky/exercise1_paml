import 'package:exercise1_paml/themes.dart';
import 'package:flutter/material.dart';

class InputPasswordField extends StatefulWidget {
  InputPasswordField({
    super.key,
    required this.icon,
    required this.hint,
    required this.textEditingController,
    required this.textInputType,
    required this.textInputAction,
    required this.obscureText,
    required this.validatorMessage
  });

  final Icon icon;
  final String hint;
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  bool obscureText;
  final String validatorMessage;

  @override
  State<InputPasswordField> createState() => _InputPasswordFieldState();
}

class _InputPasswordFieldState extends State<InputPasswordField> {
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
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              widget.obscureText = !widget.obscureText;
            });
          },
          icon: widget.obscureText ? const Icon(Icons.visibility_off_rounded) : const Icon(Icons.visibility_rounded)
        ),
      ),
      controller: widget.textEditingController,
      keyboardType: widget.textInputType,
      textInputAction: widget.textInputAction,
      obscureText: widget.obscureText,
      validator: (value) => value.toString().trim().isEmpty ? widget.validatorMessage : null,
    );
  }
}

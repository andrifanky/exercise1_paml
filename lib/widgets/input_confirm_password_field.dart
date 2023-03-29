import 'package:exercise1_paml/themes.dart';
import 'package:flutter/material.dart';

class InputConfirmPasswordField extends StatefulWidget {
  InputConfirmPasswordField({
    super.key,
    required this.label,
    required this.icon,
    required this.hint,
    required this.textEditingController,
    required this.confirmTextEditingController,
    required this.textInputType,
    required this.textInputAction,
    required this.obscureText,
    required this.validatorMessage
  });

  final String label;
  final Icon icon;
  final String hint;
  final TextEditingController textEditingController;
  final TextEditingController confirmTextEditingController;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  bool obscureText;
  final String validatorMessage;

  @override
  State<InputConfirmPasswordField> createState() => _InputConfirmPasswordFieldState();
}

class _InputConfirmPasswordFieldState extends State<InputConfirmPasswordField> {
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
      controller: widget.confirmTextEditingController,
      keyboardType: widget.textInputType,
      textInputAction: widget.textInputAction,
      obscureText: widget.obscureText,
      validator: (value) {
        if (value.toString().trim().isEmpty) {
          return widget.validatorMessage;
        }
        if (value.toString().trim().length < 6) {
          return 'Password must be at least 6 characters';
        }
        if (widget.confirmTextEditingController.text != widget.textEditingController.text) {
          return 'Password must be the same';
        }
      },
    );
  }
}

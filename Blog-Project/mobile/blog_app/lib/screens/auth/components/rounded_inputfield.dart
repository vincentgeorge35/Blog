import 'package:blog_app/screens/auth/components/textfield_container.dart';
import 'package:flutter/material.dart';

class RoundedInputField extends StatelessWidget {
  final String? hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final IconData? suffix;
  final bool obscureText;
  final String? Function(String?)? validator;
  final String? initialValue;

  const RoundedInputField(
      {Key? key,
      this.hintText,
      required this.icon,
      required this.onChanged,
      this.suffix,
      this.obscureText = false,
      this.validator, this.initialValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        validator: validator,
        onChanged: onChanged,
        obscureText: obscureText,
        initialValue: initialValue,
        decoration: InputDecoration(
          icon: Icon(icon),
          hintText: hintText,
          border: InputBorder.none,
          suffixIcon: Icon(suffix),
        ),
      ),
    );
  }
}

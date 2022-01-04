import 'package:blog_app/screens/auth/components/textfield_container.dart';
import 'package:flutter/material.dart';



class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final IconData? suffix;
  final bool obscureText;
  const RoundedInputField(
      {Key? key,
      required this.hintText,
      required this.icon,
      required this.onChanged,
      this.suffix,
      this.obscureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        obscureText: obscureText,
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

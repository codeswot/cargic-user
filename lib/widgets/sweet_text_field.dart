import 'package:flutter/material.dart';

class SweetTextField extends StatelessWidget {
  const SweetTextField({
    Key key,
    this.leadingIcon,
    this.trailinIcon,
    this.obsecureText,
    this.hintText,
    this.controller,
    this.onChanged,
  }) : super(key: key);
  final IconData leadingIcon;
  final IconData trailinIcon;
  final String hintText;
  final bool obsecureText;
  final TextEditingController controller;
  final Function onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        obscureText: (obsecureText != null) ? obsecureText : false,
        decoration: InputDecoration(
          prefixIcon: (leadingIcon != null) ? Icon(leadingIcon) : null,
          suffixIcon: (trailinIcon != null) ? Icon(trailinIcon) : null,
          hintText: (hintText != null) ? hintText : 'Hint Text here!',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}

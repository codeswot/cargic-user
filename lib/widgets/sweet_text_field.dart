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
    this.keyBoardType,
    this.maxLength,
  }) : super(key: key);
  final IconData leadingIcon;
  final IconData trailinIcon;
  final String hintText;
  final bool obsecureText;
  final TextEditingController controller;
  final Function onChanged;
  final TextInputType keyBoardType;
  final int maxLength;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        textCapitalization: TextCapitalization.words,
        maxLength: maxLength,
        controller: controller,
        onChanged: onChanged,
        keyboardType: keyBoardType,
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

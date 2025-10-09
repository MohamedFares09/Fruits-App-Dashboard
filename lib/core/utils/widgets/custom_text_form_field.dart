import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.hintText,
      this.suffixIcon,
      this.maxLines,
      required this.keyboardType,
      this.onSaved,
      this.obscureText = false });
  final String hintText;
  final int? maxLines;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final void Function(String?)? onSaved;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines ,
      obscureText: obscureText,
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'هذا الحقل مطلوب';
        }
        return null;
      },
      keyboardType: keyboardType,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xffF9FAFA),
        hintText: hintText,
        suffixIcon: suffixIcon,
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        width: 1,
        color: Colors.grey,
      ),
    );
  }
}

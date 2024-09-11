import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool obscureText;

  const CustomTextField(
      {super.key,
      this.onChanged,
      this.controller,
      this.hintText,
      this.suffixIcon,
      this.prefixIcon,this.obscureText=false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        disabledBorder: buildBorder(),
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 18,color: Colors.grey.withOpacity(.5)),
        fillColor: const Color(0xffE4DFDF).withOpacity(.5),
        filled: true,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
        border: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.withOpacity(.5)),
        borderRadius: BorderRadius.circular(30));
  }
}
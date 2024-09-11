import 'package:flutter/material.dart';

class CustomAuthHaveAccount extends StatelessWidget {
  final String title1;
  final String title2;
  final void Function()? onTap;
  const CustomAuthHaveAccount({super.key, required this.title1, required this.title2, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text(title1)
      , GestureDetector(
        onTap: onTap,
        child: Text(title2,style: const TextStyle(color: Color(0xff288CE9)),))],
    );
  }
}
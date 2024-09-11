import 'package:flutter/material.dart';

class CustomAuthTitle extends StatelessWidget {
  final String title;
  const CustomAuthTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(textAlign: TextAlign.center,title,style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold,
    ));
  }
}
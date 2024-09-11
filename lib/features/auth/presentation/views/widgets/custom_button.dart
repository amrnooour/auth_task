import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  const CustomButton({super.key, this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: ElevatedButton(
        style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.pink)),
          onPressed: onPressed,
          child:  Padding(
            padding: const EdgeInsets.symmetric(vertical: 31),
            child: Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
          )),
    );
  }
}
import 'package:auth_task/features/auth/presentation/views/widgets/signin_body.dart';
import 'package:flutter/material.dart';

class Signin extends StatelessWidget {
  const Signin({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SigninBody(),
    );
  }
}
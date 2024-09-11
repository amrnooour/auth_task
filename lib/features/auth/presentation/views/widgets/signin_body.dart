import 'package:auth_task/core/router/navigation.dart';
import 'package:auth_task/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:auth_task/features/auth/presentation/cubit/auth_states.dart';
import 'package:auth_task/features/auth/presentation/views/widgets/custom_auth_have_account.dart';
import 'package:auth_task/features/auth/presentation/views/widgets/custom_auth_title.dart';
import 'package:auth_task/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:auth_task/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninBody extends StatelessWidget {
  const SigninBody({super.key});

  @override
  Widget build(BuildContext context) {
    AuthCubit cubit = context.read<AuthCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: SingleChildScrollView(
        child: BlocConsumer<AuthCubit, AuthStates>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              customReplacementNavigate(context,"/home");
            } else if (state is AuthFailure) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.errorMessage)));
            }
          },
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 80,
                ),
                const CustomAuthTitle(title: "Sign In"),
                const SizedBox(
                  height: 76,
                ),
                CustomTextField(
                  controller: cubit.email,
                  hintText: "Enter Username Or Email",
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextField(
                  obscureText: true,
                    controller: cubit.password, hintText: "password"),
                const SizedBox(
                  height: 61,
                ),
                state is AuthLoading?const Center(child: CircularProgressIndicator(),) :
                CustomButton(
                  text: "Sign In",
                  onPressed: () {
                    cubit.login();
                  },
                ),
                const SizedBox(
                  height: 70,
                ),
                CustomAuthHaveAccount(
                  title1: "not a member ? ",
                  title2: 'register now',
                  onTap: () {
                    customNavigation(context,"/signup" );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
import 'package:auth_task/features/auth/data/data_source/firebase_services.dart';
import 'package:auth_task/features/auth/data/models/create_user_req.dart';
import 'package:auth_task/features/auth/data/models/signin_user_req.dart';
import 'package:auth_task/features/auth/presentation/cubit/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthFirebaseServicesImpl authFirebaseServicesImpl;
  AuthCubit(this.authFirebaseServicesImpl) : super(AuthInitial());

  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  register() async {
    emit(AuthLoading());
    final result = await authFirebaseServicesImpl.signup(CreateUserReq(
        fullName: fullName.text, email: email.text, password: password.text));
    result.fold((error) => emit(AuthFailure(errorMessage: error)),
        (success) => emit(AuthSuccess()));
  }

  login() async {
    emit(AuthLoading());
    final result = await authFirebaseServicesImpl
        .signin(SigninUserReq(email: email.text, password: password.text));
    result.fold((error) => emit(AuthFailure(errorMessage: error)),
        (success) => emit(AuthSuccess()));
  }
}

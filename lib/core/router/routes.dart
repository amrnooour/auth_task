import 'package:auth_task/features/auth/data/data_source/firebase_services.dart';
import 'package:auth_task/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:auth_task/features/auth/presentation/views/signin.dart';
import 'package:auth_task/features/auth/presentation/views/signup.dart';
import 'package:auth_task/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(path: "/",builder: (context, state) => BlocProvider(
    create: (context) => AuthCubit(AuthFirebaseServicesImpl()),
    child: const Signin()),),
  GoRoute(path: "/signup",builder: (context, state) => 
  BlocProvider(
    create: (context) => AuthCubit(AuthFirebaseServicesImpl()),
    child: const Signup()),),
  GoRoute(path: "/home",builder: (context, state) => const Home(),)
]);

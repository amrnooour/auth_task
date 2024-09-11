import 'package:auth_task/features/auth/data/models/create_user_req.dart';
import 'package:auth_task/features/auth/data/models/signin_user_req.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthFirebaseServices {
  Future<Either> signin(SigninUserReq signinUserReq);
  Future<Either> signup(CreateUserReq createUserReq);
}

class AuthFirebaseServicesImpl extends AuthFirebaseServices {
  @override
  Future<Either> signin(SigninUserReq signinUserReq) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: signinUserReq.email,
        password: signinUserReq.password,
      );
      return right("sign in successfly");
    } on FirebaseAuthException catch (e) {
      String message = "";
      if (e.code == 'invaild-email') {
        message = 'The email  is too invaild.';
      } else if (e.code == 'invaild-credential') {
        message = 'wrong password';
      }
      return left(message);
    }
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUserReq.email,
        password: createUserReq.password,
      );
      return right("sign up successfly");
    } on FirebaseAuthException catch (e) {
      String message = "";
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      }
      return left(message);
    }
  }
}
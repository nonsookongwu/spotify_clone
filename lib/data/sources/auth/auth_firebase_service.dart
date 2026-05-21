import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_app/data/models/auth/create_user_req.dart';

abstract class AuthFirebaseService {
  Future<Either> signUp(CreateUserReq user);

  Future<Either> login(LoginUserReq user);
}

class AuthFirebaseImplementation extends AuthFirebaseService {
  @override
  Future<Either<String, String>> signUp(CreateUserReq user) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );

      // await FirebaseFirestore.instance
      //       .collection("users")
      //       .doc(userCredentials.user!.uid)
      //       .set({
      //         "fullname": user.fullname,
      //         "email": user.email,
      //         "username": user.email,
      //       });
      await FirebaseFirestore.instance.collection("users").add({
                 "fullname": user.fullname,
              "email": user.email,
              "username": user.email,
      });

      return const Right("Sign up is successful");
    } on FirebaseAuthException catch (e) {
      String message = "";

      if (e.code == 'weak-password') {
        message = "the password provided is too weak";
      } else if (e.code == "email-already-in-use") {
        message = "an account already exists for the email";
      } else {
        message = e.message ?? "An error occured";
      }

      return Left(message);
    } catch (e) {

      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, String>> login(LoginUserReq user) async{
   try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );

      return const Right("Logged in successfully");
    } on FirebaseAuthException catch (e) {
      String message = "";
      print(e.code);

      if (e.code == 'weak-password') {
        message = "the password provided is too weak";
      } else if (e.code == "invalid-credential") {
        message = "Invalid credentials";
      } else {
        message = e.message ?? "An error occured";
      }

      return Left(message);
    } catch (e) {

      return Left(e.toString());
    }
  }
}

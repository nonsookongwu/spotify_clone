

import 'package:dartz/dartz.dart';
import 'package:spotify_app/data/models/auth/create_user_req.dart';
import 'package:spotify_app/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_app/domain/repository/auth_/auth.dart';
// import '../../../service_locator.dart';
import '../../service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {

// final firebaseImpl = AuthFirebaseImplementation();

  @override
  Future<Either> login(LoginUserReq user) async{
   return await sl<AuthFirebaseService>().login(user);
  }

  @override
  Future<Either> signUp(CreateUserReq user ) async {
    return await sl<AuthFirebaseService>().signUp(user);
    // throw UnimplementedError();

  }

  
}
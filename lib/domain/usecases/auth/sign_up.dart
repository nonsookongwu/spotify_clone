

import 'package:dartz/dartz.dart';
import 'package:spotify_app/core/usecase/usecase.dart';
import 'package:spotify_app/data/models/auth/create_user_req.dart';
import 'package:spotify_app/domain/repository/auth_/auth.dart';
import 'package:spotify_app/service_locator.dart';

class SignUpUseCase implements UseCase<Either, CreateUserReq> {
  @override
  Future<Either<dynamic, dynamic>> executeFunction({required CreateUserReq params}) async{

    return await sl<AuthRepository>().signUp(params);
  }
  
}

class SignInUseCase implements UseCase<Either, LoginUserReq> {
  @override
  Future<Either<dynamic, dynamic>> executeFunction({required LoginUserReq params}) async{

    return await sl<AuthRepository>().login(params);
  }
  
}
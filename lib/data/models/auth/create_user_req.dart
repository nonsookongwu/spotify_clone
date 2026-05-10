
class CreateUserReq {
  CreateUserReq({required this.email, required this.password, required this.fullname});

  final String email;
  final String password;
  final String fullname;

}

class LoginUserReq {
  LoginUserReq({required this.email, required this.password});

  final String email;
  final String password;

}
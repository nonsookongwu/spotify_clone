
import 'package:flutter_bloc/flutter_bloc.dart';

class IsloginCubit extends Cubit<bool> {

  IsloginCubit():super(true);

void updateIsLogin ()=> emit(!state);
void setIsLoginState(bool isLoginState)=> emit(isLoginState);
}
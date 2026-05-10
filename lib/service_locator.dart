import "package:get_it/get_it.dart";
import "package:spotify_app/data/repository/auth_repository_impl.dart";
import "package:spotify_app/data/sources/auth/auth_firebase_service.dart";
import "package:spotify_app/domain/repository/auth_/auth.dart";
import "package:spotify_app/domain/usecases/auth/sign_up.dart";

final sl = GetIt.instance;


Future<void> initializeDependencies() async{

sl.registerSingleton<AuthFirebaseService>(AuthFirebaseImplementation());

sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

sl.registerSingleton<SignUpUseCase>(SignUpUseCase());

sl.registerSingleton<SignInUseCase>(SignInUseCase());
}

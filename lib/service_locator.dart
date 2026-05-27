import "package:get_it/get_it.dart";
import "package:spotify_app/data/repository/auth_repository_impl.dart";
import "package:spotify_app/data/repository/songs_repo_impl.dart";
import "package:spotify_app/data/sources/auth/auth_firebase_service.dart";
import "package:spotify_app/data/sources/songs/songs_firebase_service.dart";
import "package:spotify_app/domain/repository/auth_/auth.dart";
import "package:spotify_app/domain/repository/songs/song_repository.dart";
import "package:spotify_app/domain/usecases/auth/sign_up.dart";
import "package:spotify_app/domain/usecases/playlist/playlist_usecase.dart";
import "package:spotify_app/domain/usecases/songs/songs_usecase.dart";

final sl = GetIt.instance;


Future<void> initializeDependencies() async{

sl.registerSingleton<AuthFirebaseService>(AuthFirebaseImplementation());

sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

sl.registerSingleton<SignUpUseCase>(SignUpUseCase());

sl.registerSingleton<SignInUseCase>(SignInUseCase());

sl.registerSingleton<SongsFirebaseService>(SongsFirebaseServiceImpl());

sl.registerSingleton<SongRepository>(SongsRepositoryImpl());

sl.registerSingleton<SongsUsecase>(SongsUsecase());
sl.registerSingleton<PlaylistUsecase>(PlaylistUsecase());
}

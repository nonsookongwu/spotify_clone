import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_app/domain/usecases/playlist/playlist_usecase.dart';
import 'package:spotify_app/presentation/bloc/playlist/playlist_state.dart';
import 'package:spotify_app/service_locator.dart';

class PlaylistCubit extends Cubit<PlaylistState> {
  PlaylistCubit() : super(PlayListLoading());

  Future<void> getPlayList() async {
    final result = await sl<PlaylistUsecase>()
        .executeFunctionWithoutArguments();

    // print(result);

    result.fold(
      (left) {
        emit(PlayListError());
      },
      (data) {
        emit(PlayListLoaded(playlists: data));
        print(data);
      },
    );
  }
}

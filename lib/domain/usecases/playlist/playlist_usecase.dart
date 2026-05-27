

import 'package:dartz/dartz.dart';
import 'package:spotify_app/core/usecase/usecase.dart';
import 'package:spotify_app/service_locator.dart';

import '../../repository/songs/song_repository.dart';

class PlaylistUsecase extends SongsUseCase{

  @override
  Future<Either> executeFunctionWithoutArguments() async {
   return await sl<SongRepository>().getPlaylists();
  }
}
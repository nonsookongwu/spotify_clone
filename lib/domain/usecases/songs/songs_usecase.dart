

import 'package:dartz/dartz.dart';
import 'package:spotify_app/core/usecase/usecase.dart';
import 'package:spotify_app/domain/repository/songs/song_repository.dart';
import 'package:spotify_app/service_locator.dart';

class SongsUsecase extends SongsUseCase<Either> {
 
 @override
  Future<Either<dynamic, dynamic>> executeFunctionWithoutArguments() async{
    return await sl<SongRepository>().getNewSongs();
  }


}
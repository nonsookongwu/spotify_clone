

import 'package:dartz/dartz.dart';
import 'package:spotify_app/data/sources/songs/songs_firebase_service.dart';
import 'package:spotify_app/domain/repository/songs/song_repository.dart';

import '../../service_locator.dart';

class SongsRepositoryImpl extends SongRepository {

  @override
  Future<Either> getNewSongs() async {
    return await sl<SongsFirebaseService>().getNewSongs();
  }

  @override
  Future<Either> getPlaylists() async{
    return await sl<SongsFirebaseService>().getNewPlaylist();
  }
}
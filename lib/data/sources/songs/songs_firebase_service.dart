import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:spotify_app/data/models/songs/song.dart';
import 'package:spotify_app/domain/entities/song/song.dart';

abstract class SongsFirebaseService {
  Future<Either> getNewSongs();
  Future<Either> getNewPlaylist();
}

class SongsFirebaseServiceImpl extends SongsFirebaseService {
  @override
  Future<Either> getNewSongs() async {
    // TODO: implement getNewSongs
    //implementation to get data from firebase happens here
    try {
      // List<SongEntity> songs = [];

      final data = await FirebaseFirestore.instance
          .collection("songs")
          .orderBy("releaseDate", descending: true)
          .limit(5)
          .get();

      final List<SongEntity> songs = data.docs.map((item) {
        var songModel = SongModel.fromJson(item.data());
        return songModel.convertToEntity();
      }).toList();

      // for (var element in data.docs) {
      //   var songModel = SongModel.fromJson(element.data());

      //   songs.add(songModel.convertToEntity());

      // }
      // print(songs);

      return Right(songs);
    } catch (e) {
      return Left("");
    }
  }

  @override
  Future<Either<dynamic, dynamic>> getNewPlaylist() async {
    // TODO: implement getNewPlaylist

    try {
      // List<SongEntity> songs = [];

      final data = await FirebaseFirestore.instance
          .collection("songs")
          .orderBy("releaseDate", descending: true)
          .get();

      final List<SongEntity> songs = data.docs.map((item) {
        var songModel = SongModel.fromJson(item.data());
        return songModel.convertToEntity();
      }).toList();

      // for (var element in data.docs) {
      //   var songModel = SongModel.fromJson(element.data());

      //   songs.add(songModel.convertToEntity());

      // }
      // print(songs);

      return Right(songs);
    } catch (e) {
      return Left("");
    }
  }
}

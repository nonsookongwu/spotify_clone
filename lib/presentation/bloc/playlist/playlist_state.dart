
import 'package:spotify_app/domain/entities/song/song.dart';

abstract class PlaylistState {}

class PlayListLoading extends PlaylistState{}

class PlayListLoaded extends PlaylistState{
  PlayListLoaded({required this.playlists});

  final List<SongEntity> playlists;

}

class PlayListError extends PlaylistState{}


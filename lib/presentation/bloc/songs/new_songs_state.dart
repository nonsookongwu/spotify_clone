
import 'package:spotify_app/domain/entities/song/song.dart';



abstract class NewSongsState {}

class NewSongsLoading extends NewSongsState{
}

class NewSongsLoaded extends NewSongsState{
  NewSongsLoaded({required this.songs});

  final List<SongEntity> songs;

}

class NewSongsFailure extends NewSongsState{

}
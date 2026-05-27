import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_app/presentation/bloc/songs/new_songs_state.dart';

import '../../../domain/entities/song/song.dart';
import '../../../domain/usecases/songs/songs_usecase.dart';
import '../../../service_locator.dart';


class NewSongsCubit extends Cubit<NewSongsState> {
  NewSongsCubit(): super(NewSongsLoading());


Future<void> getNewSongs() async{

   final result = await sl<SongsUsecase>().executeFunctionWithoutArguments();

   result.fold((ifLeft){
    emit(NewSongsFailure());

   }, (data){
   emit(NewSongsLoaded(songs: data)) ;
   });
}

  
}
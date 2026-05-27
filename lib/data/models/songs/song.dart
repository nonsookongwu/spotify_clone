import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotify_app/domain/entities/song/song.dart';

class SongModel {
  SongModel({
    required this.title,
    required this.artist,
    required this.duration,
    required this.releaseDate,
  });

   String? title;
   String? artist;
   num? duration;
   Timestamp? releaseDate;

  SongModel.fromJson(Map<String, dynamic> data){
    title = data["title"];
    artist = data["artist"];
    duration = data["duration"];
    releaseDate = data["releaseDate"];

  }
}

extension SongModelX on SongModel{

  SongEntity convertToEntity(){
    return SongEntity(title: title!, artist: artist!, duration: duration!, releaseDate: releaseDate!);
  }
}




// NB: Mixins and extensions are both tools to extend a class' functions. While mixins is based on a one to many relaitonship
// where one mixin can attend to any class it is connected to with the "with" keyword, extensions exist on a one to one relationship
// where it is build and tailored to extend the functionalities of one class.
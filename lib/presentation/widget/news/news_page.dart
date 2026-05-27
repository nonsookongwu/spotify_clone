import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_app/domain/usecases/songs/songs_usecase.dart';
import 'package:spotify_app/presentation/bloc/songs/new_songs_cubit.dart';
import 'package:spotify_app/presentation/bloc/songs/new_songs_state.dart';
import 'package:spotify_app/presentation/widget/news/song_card.dart';
import 'package:spotify_app/presentation/widget/custom_button.dart';
import 'package:spotify_app/service_locator.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  void getSongs() async {
    final result = await sl<SongsUsecase>().executeFunctionWithoutArguments();
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewSongsCubit()..getNewSongs(),
      child: Padding(
        padding: const EdgeInsets.only(top: 18),
        child: SizedBox(
          // height: 200,
          child: BlocBuilder<NewSongsCubit, NewSongsState>(
            builder: (context, state) {
              if (state is NewSongsLoading) {
                return CircularProgressIndicator();
              }
              if (state is NewSongsLoaded) {
                return ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return SongCard(
                      artist: state.songs[index].artist,
                      title: state.songs[index].title,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 14);
                  },
                  itemCount: state.songs.length,
                );
              }

              return Container(
                child: CustomButton(onPressed: getSongs, title: "Get songs"),
              );
            },
          ),
        ),
      ),
    );
  }
}

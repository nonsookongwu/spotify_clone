import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_app/presentation/bloc/playlist/playlist_cubit.dart';
import 'package:spotify_app/presentation/bloc/playlist/playlist_state.dart';
import 'package:spotify_app/presentation/widget/playlist/playList_card.dart';

class PlaylistWidget extends StatelessWidget {
  const PlaylistWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PlaylistCubit()..getPlayList(),
      child: Container(
        width: double.infinity,
        height: 400,
        decoration: BoxDecoration(color: Colors.blue),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Playlist",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Spacer(),
                Text("See More", style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
            Expanded(
              child: SizedBox(
                child: BlocBuilder<PlaylistCubit, PlaylistState>(
                  builder: (context, state) {
                    // print(state);
                    if (state is PlayListLoading) {
                      return CircularProgressIndicator();
                    }

                    if (state is PlayListLoaded) {
                      return ListView.builder(
                        itemCount: state.playlists.length,
                        // separatorBuilder: (context, index) =>
                        //     SizedBox(height: 20),
                        itemBuilder: (context, index) {
                          return PlaylistCard(
                            artist: state.playlists[index].artist,
                            title: state.playlists[index].title,
                          );
                        },
                      );
                    }

                    return Text("data");
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

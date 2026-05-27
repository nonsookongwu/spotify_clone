import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_app/core/configs/assets/app_vectors.dart';
import 'package:spotify_app/data/models/utility_functions.dart';
import 'package:spotify_app/presentation/bloc/theme_cubit.dart';
import 'package:spotify_app/presentation/widget/news/song_card.dart';

class PlaylistCard extends StatefulWidget {
  const PlaylistCard({super.key, required this.artist, required this.title});

  final String artist;
  final String title;

  @override
  State<PlaylistCard> createState() => _PlaylistCardState();
}

class _PlaylistCardState extends State<PlaylistCard> {
  @override
  Widget build(BuildContext context) {
    print(widget.artist);
    print(widget.title);
    final currentTheme = context.watch<ThemeCubit>().state;
    final isDark = currentTheme == ThemeMode.dark;

    return SizedBox(
      width: double.infinity,
      // height: 20,
      child: Row(
        children: [
          Container(
            height: 29,
            width: 29,
            decoration: BoxDecoration(
              color: isDark ? Color(0xff2C2C2C) : Color(0xffE6E6E6),
              shape: BoxShape.circle,
            ),
            child: SizedBox(
              width: 14,
              height: 14,
              child: SvgPicture.asset(
                isDark ? AppVectors.playIcon : AppVectors.playIconLight,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  UtilityFunctions.capitalizeWords(widget.title),
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                Text(
                  UtilityFunctions.capitalizeWords(widget.artist),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_app/core/configs/assets/app_vectors.dart';
import 'package:spotify_app/core/configs/constants/app_urls.dart';
import 'package:spotify_app/data/models/utility_functions.dart';
import 'package:spotify_app/presentation/bloc/theme_cubit.dart';
import 'package:spotify_app/presentation/widget/custom_IconButton.dart';

class SongCard extends StatelessWidget {
  const SongCard({super.key, required this.title, required this.artist});

  final String title;
  final String artist;



  @override
  Widget build(BuildContext context) {
    final currentTheme = context.watch<ThemeCubit>().state;
    final isDark = currentTheme == ThemeMode.dark;

    return SizedBox(
      width: 147,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 180,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.amber,
              image: DecorationImage(
                image: NetworkImage(UtilityFunctions.getCoverImageLink(artist)),
                fit: BoxFit.cover,
              ),
            ),
            child: Align(
              alignment: AlignmentGeometry.bottomRight,
              child: Container(
                height: 29,
                width: 29,
                transform: Matrix4.translationValues(7, 10, 0),
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
                    // width: 4,
                    // height: 4,
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 10),
          Text(
            UtilityFunctions.capitalizeWords(title),
            style: Theme.of(
              context,
            ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 2),
          Text(
            UtilityFunctions.capitalizeWords(artist),
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}

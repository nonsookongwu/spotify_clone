import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_app/core/configs/assets/app_vectors.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: SvgPicture.asset(AppVectors.spotifyLogo, height: 33),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

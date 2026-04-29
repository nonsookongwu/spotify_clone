import 'dart:ui';

import 'package:flutter/material.dart';

class ModeButtons extends StatelessWidget {
  const ModeButtons({super.key, required this.svgImage});

  final Widget svgImage;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            color: Color(0xff30393c).withValues(alpha: 0.5),
            shape: BoxShape.circle,
          ),
          child: svgImage,
          // child: SvgPicture.asset(AppVectors.moonIcon, fit: BoxFit.none),
        ),
      ),
    );
  }
}

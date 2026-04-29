import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    this.onPressed,
    this.height = 60,
    this.width = 60,
    required this.svgPath,
    // required this.bkGroundColor,
  });

  final String svgPath;
  final void Function()? onPressed;
  final double height;
  final double width;
  // final Color bkGroundColor;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: SvgPicture.asset(svgPath, width: 30, height: 30),
      style: IconButton.styleFrom(
        // backgroundColor: bkGroundColor,
        // disabledBackgroundColor: bkGroundColor.withValues(alpha: 0.6),
        minimumSize: Size(width, height),
      ),
    );
  }
}

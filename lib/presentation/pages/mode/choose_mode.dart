import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_app/core/configs/assets/app_images.dart';
import 'package:spotify_app/core/configs/assets/app_vectors.dart';
import 'package:spotify_app/core/configs/theme/app_colors.dart';
import 'package:spotify_app/core/configs/theme/app_theme.dart';
import 'package:spotify_app/presentation/bloc/theme_cubit.dart';
import 'package:spotify_app/presentation/pages/auth/auth_picker_screen.dart';
import 'package:spotify_app/presentation/pages/mode/mode_buttons.dart';
import 'package:spotify_app/presentation/widget/custom_IconButton.dart';
import 'package:spotify_app/presentation/widget/custom_button.dart';

class ChooseModePage extends StatelessWidget {
  const ChooseModePage({super.key});

  @override
  Widget build(BuildContext context) {
    final currentTheme = context.watch<ThemeCubit>().state;
    final isDark = currentTheme == ThemeMode.dark;

    return SafeArea(
      child: Stack(
        children: [
          Image.asset(AppImages.choseModeBkground, fit: BoxFit.fill),
          Container(
            padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: isDark ? 0.5 : 0.1),
            ),
            child: Column(
              spacing: 60,
              children: [
                SvgPicture.asset(AppVectors.spotifyLogo),
                Spacer(),
                Column(
                  spacing: 35,
                  children: [
                    Text(
                      "Choose Mode",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 60,
                      children: [
                        Column(
                          spacing: 20,
                          children: [
                            GestureDetector(
                              onTap: () {
                                context.read<ThemeCubit>().updateTheme(
                                  ThemeMode.dark,
                                );
                              },
                              child: ModeButtons(
                                svgImage: SvgPicture.asset(
                                  AppVectors.moonIcon,
                                  fit: BoxFit.none,
                                ),
                              ),
                            ),
                            Text(
                              "Dark Mode",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: AppColors.lightDisablegrey,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          spacing: 20,
                          children: [
                            GestureDetector(
                              onTap: () {
                                context.read<ThemeCubit>().updateTheme(
                                  ThemeMode.light,
                                );
                              },
                              child: ModeButtons(
                                svgImage: SvgPicture.asset(
                                  AppVectors.sunIcon,
                                  fit: BoxFit.none,
                                ),
                              ),
                            ),
                            Text(
                              "Light Mode",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: AppColors.lightDisablegrey,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                CustomButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (ctx) => AuthPickerScreen()),
                    );
                  },
                  title: "Continue",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

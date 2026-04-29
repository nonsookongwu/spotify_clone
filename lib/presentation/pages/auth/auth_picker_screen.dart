import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_app/core/configs/assets/app_images.dart';
import 'package:spotify_app/core/configs/assets/app_vectors.dart';
import 'package:spotify_app/core/configs/theme/app_colors.dart';
import 'package:spotify_app/presentation/bloc/isLogin_cubit.dart';
import 'package:spotify_app/presentation/pages/auth/login_screen.dart';
import 'package:spotify_app/presentation/pages/auth/register_screen.dart';
import 'package:spotify_app/presentation/widget/custom_button.dart';
import 'package:spotify_app/presentation/widget/custom_text_button.dart';

class AuthPickerScreen extends StatelessWidget {
  const AuthPickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AppBar(),
          Align(
            alignment: AlignmentGeometry.topRight,
            child: SvgPicture.asset(AppVectors.topPattern),
          ),
          Align(
            alignment: AlignmentGeometry.bottomRight,
            child: SvgPicture.asset(AppVectors.bottomPattern),
          ),
          Align(
            alignment: AlignmentGeometry.bottomLeft,
            child: Image.asset(AppImages.authBkground, scale: 1.3),
          ),
          Align(
            alignment: AlignmentGeometry.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 20,
                children: [
                  SvgPicture.asset(AppVectors.spotifyLogo),
                  SizedBox(height: 30),
                  Text(
                    "Enjoy Listening to Music",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    "Spotify is a proprietary Swedish audio streaming and media services provider.",
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  // CustomButton(onPressed: () {}, title: "Register"),
                  Row(
                    spacing: 10,
                    children: [
                      Expanded(
                        child: CustomButton(
                          onPressed: () {
                            context.read<IsloginCubit>().setIsLoginState(false);
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (ctx) => LoginScreen(),
                              ),
                            );

                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (_) => BlocProvider(
                            //       create: (_) => IsloginCubit(),
                            //       child: const LoginScreen(),
                            //     ),
                            //   ),
                            // );
                          },
                          title: "Register",
                        ),
                      ),
                      Expanded(
                        child: CustomTextButton(
                          onPressed: () {
                            context.read<IsloginCubit>().setIsLoginState(true);
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (ctx) => LoginScreen(),
                              ),
                            );

                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (_) => BlocProvider(
                            //       create: (_) => IsloginCubit(),
                            //       child: const LoginScreen(),
                            //     ),
                            //   ),
                            // );
                          },
                          title: "Sign In",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

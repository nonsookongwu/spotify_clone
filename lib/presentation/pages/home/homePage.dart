import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_app/core/configs/assets/app_images.dart';
import 'package:spotify_app/core/configs/assets/app_vectors.dart';
import 'package:spotify_app/presentation/widget/custom_IconButton.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      //   leading: CustomIconButton(
      //     svgPath: AppVectors.searchIcon,
      //     iconHeight: 20,
      //     iconWidth: 20,
      //     onPressed: () {},
      //   ),
      //   title: SvgPicture.asset(AppVectors.spotifyLogo, height: 33),
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
          child: Stack(
            children: [
              AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                leading: CustomIconButton(
                  svgPath: AppVectors.searchIcon,
                  iconHeight: 20,
                  iconWidth: 20,
                  onPressed: () {},
                ),
                title: SvgPicture.asset(AppVectors.spotifyLogo, height: 33),
              ),
              SingleChildScrollView(
                padding: EdgeInsets.only(top: 23),
                child: Column(
                  children: [
                    Center(
                      child: Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 118,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(30),
                              // border: Border.all(color: Colors.white, width: 1),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: 20,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    spacing: 5,
                                    children: [
                                      Text(
                                        "New Album",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(color: Color(0xffFBFBFB)),
                                      ),
                                      Text(
                                        "Happier Than Ever",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium!
                                            .copyWith(color: Color(0xffFBFBFB)),
                                      ),
                                      Text(
                                        "Billie Eilish",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                              color: Color(0xffFBFBFB),
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                SvgPicture.asset(AppVectors.deisgnPattern),
                              ],
                            ),
                          ),

                          Image.asset(
                            AppImages.billieCropped,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

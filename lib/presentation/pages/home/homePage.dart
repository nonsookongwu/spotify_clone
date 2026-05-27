import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_app/core/configs/assets/app_images.dart';
import 'package:spotify_app/core/configs/assets/app_vectors.dart';
import 'package:spotify_app/presentation/widget/news/news_page.dart';
import 'package:spotify_app/presentation/widget/custom_IconButton.dart';
import 'package:spotify_app/presentation/widget/playlist/playList_widget.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

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
                                SizedBox(
                                  height: double.infinity,
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
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
                    SizedBox(height: 40),
                    TabBar(
                      isScrollable: true,
                      controller: _tabController,
                      indicatorColor: Theme.of(context).primaryColor,
                      tabAlignment: TabAlignment.start,
                      dividerColor: Colors.transparent,
                      tabs: [
                        Text("News"),
                        Text("Video"),
                        Text("Artists"),
                        Text("Podcasts"),
                      ],
                    ),
                    SizedBox(
                      height: 300,
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          Center(child: NewsPage()),
                          Center(child: Text("It's rainy here")),
                          Center(child: Text("It's sunny here")),
                          Center(child: Text("It's sunny here")),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),

                    PlaylistWidget(),
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

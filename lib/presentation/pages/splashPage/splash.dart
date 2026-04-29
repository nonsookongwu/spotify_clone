import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_app/core/configs/assets/app_vectors.dart';
import 'package:spotify_app/presentation/pages/get_started/get_started.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Future<void> redirect() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GetStartedPage()),
    );
  }

  @override
  void initState() {
    redirect();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xff0D0C0C),
      body: Center(child: SvgPicture.asset(AppVectors.spotifyLogo)),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_app/core/configs/assets/app_images.dart';
import 'package:spotify_app/core/configs/assets/app_vectors.dart';
import 'package:spotify_app/core/configs/theme/app_colors.dart';
import 'package:spotify_app/presentation/pages/mode/choose_mode.dart';
import 'package:spotify_app/presentation/widget/custom_button.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.getStartedBkground),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 10,
            children: [
              SvgPicture.asset(AppVectors.spotifyLogo),
              Spacer(),
              Text(
                "Enjoy Listening to Music",
                style: TextStyle(
                  color: AppColors.lightBackground,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sagittis enim purus sed phasellus. Cursus ornare id scelerisque aliquam.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.darkDisablegrey,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 7),
              CustomButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChooseModePage()),
                  );
                },
                title: "Get Started",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

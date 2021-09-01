import 'package:flutter/material.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widgets/custom_button.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            // height: double.infinity,
            child: ClipRRect(
              child: Image.asset(
                'assets/images/bg_plane.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Fly Like a Bird',
                  style: splashTextStyle,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Explore new world with us and let\nyourself get an amazing experiences',
                  textAlign: TextAlign.center,
                  style: subTitleTextStyle,
                ),
                SizedBox(
                  height: 50,
                ),
                CustomBtn(
                  title: 'Get Started',
                  onPressed: () {
                    Navigator.pushNamed(context, '/sign-up');
                  },
                  width: 220,
                ),
                SizedBox(
                  height: 80,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

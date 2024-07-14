import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hybkproject/appcolor.dart';
import 'package:hybkproject/appimage.dart';
import 'package:hybkproject/sign_up.dart';
import 'package:hybkproject/text_styles.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingOne extends StatefulWidget {
  const OnboardingOne({super.key});

  @override
  State<OnboardingOne> createState() => _OnboardingOneState();
}

class _OnboardingOneState extends State<OnboardingOne> {
  PageController pageController = PageController();
  Timer? timer;
  animate() {
    timer = Timer.periodic(Duration(seconds: 2), (timer) {
      if (pageController.page == 3) {
        pageController.animateTo(0,
            duration: Duration(milliseconds: 400), curve: Curves.easeIn);
      } else {
        pageController.nextPage(
            duration: Duration(milliseconds: 300), curve: Curves.easeOut);
      }
    });
  }

  @override
  void initState() {
    animate();
    super.initState();
  }

  @override
  void dispose() {
    print('i am closed');
    timer?.cancel();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 160),
            SizedBox(
              height: 530,
              child: PageView(
                controller: pageController,
                children: const [
                  OnboardingWidget(
                    imagePath: Appimage.one,
                    title: 'Welcome to 10dollar!',
                    subtitle:
                        'Get ready to dive into the vibrant world of music! \nConnect with fellow musicians, showcase your talent, \nand earn rewards for your creativity.',
                  ),
                  OnboardingWidget(
                    imagePath: Appimage.two,
                    title: 'Discover & Share Your \nMusic',
                    subtitle:
                        'Explore a diverse range of musical styles and genres. \nShare your own tracks, videos, and updates \nwith the community to gain exposure and feedback.',
                  ),
                  OnboardingWidget(
                    imagePath: Appimage.three,
                    title: 'Engage with Your Audience',
                    subtitle:
                        'Receive real-time feedback from your peers. \nUpload videos for voting and watch your popularity soar. \nWin weekly prizes for being the top-voted artist!',
                  ),
                  OnboardingWidget(
                    imagePath: Appimage.four,
                    title: 'Stake Your Claim',
                    subtitle:
                        'Put your faith in your fellow musicians! Stake on\nvideos you believe in, and earn rewards when they succeed. \nBe part of the excitement and support the community.',
                  ),
                ],
              ),
            ),
            SmoothPageIndicator(
                controller: pageController,
                count: 4,
                effect: ExpandingDotsEffect(
                    dotColor: AppColor.primaryColor,
                    activeDotColor: AppColor.primaryColor,
                    dotHeight: 10,
                    dotWidth: 10)),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 280),
              child: GestureDetector(
                onTap: () {
                  if (pageController.page == 3) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => SignUp()));
                  } else {
                    pageController.nextPage(
                        duration: Duration(milliseconds: 200),
                        curve: Curves.easeIn);
                  }
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                      color: Color(0xff7DF9FF), shape: BoxShape.circle),
                  child: Icon(Icons.arrow_forward),
                ),
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

class OnboardingWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  const OnboardingWidget({
    super.key,
    required this.imagePath,
    required this.subtitle,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(image: AssetImage(imagePath)),
        SizedBox(height: 40),
        Text(
          title,
          textAlign: TextAlign.center,
          style: AppTextStyle.header,
        ),
        SizedBox(height: 20),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: AppTextStyle.body(),
        ),
      ],
    );
  }
}

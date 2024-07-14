import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hybkproject/appcolor.dart';
import 'package:hybkproject/appimage.dart';
import 'package:hybkproject/core.dart';
import 'package:hybkproject/forgot_password.dart';
import 'package:hybkproject/text_styles.dart';
import 'package:image_picker/image_picker.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({super.key});

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  File? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 200),
            Stack(
              children: [
                image != null
                    ? CircleAvatar(
                        radius: 80,
                        backgroundImage: FileImage(image!),
                      )
                    : Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.grey),
                      ),
                Positioned(
                  bottom: 3,
                  right: 15,
                  child: GestureDetector(
                    onTap: () async {
                      setState(() {
                        image = null;
                      });
                      var img = await AppCore.pickImage(ImageSource.camera);
                      if (img != null) {
                        setState(() {
                          image = img;
                        });
                      }
                    },
                    child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.primaryColor),
                        child: Image(image: AssetImage(Appimage.pencil))),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            image != null
                ? Text(
                    'Awesome! \nYour profile picture looks great.',
                    textAlign: TextAlign.center,
                    style: AppTextStyle.header.copyWith(fontSize: 20),
                  )
                : Column(
                    children: [
                      Text(
                        'Upload your profile picture',
                        style: AppTextStyle.header.copyWith(fontSize: 26),
                      ),
                      SizedBox(height: 20),
                      Text(
                        textAlign: TextAlign.center,
                        'Choose a profile image that represents you. \nThis will help others recognize you in \nthe 10dollar community.',
                        style: AppTextStyle.body(),
                      ),
                    ],
                  ),
            SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: AppButton(
                onTap: () {},
              ),
            ),
            SizedBox(height: 40),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: 'Dont have image?', style: AppTextStyle.body()),
                  TextSpan(
                    text: 'Skip',
                    style: AppTextStyle.body(color: Color(0xff7DF9FF)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

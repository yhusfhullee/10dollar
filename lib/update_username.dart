import 'package:flutter/material.dart';
import 'package:hybkproject/appimage.dart';
import 'package:hybkproject/forgot_password.dart';
import 'package:hybkproject/login.dart';
import 'package:hybkproject/text_styles.dart';
import 'package:hybkproject/upload_image.dart';

class UpdateUsername extends StatelessWidget {
  const UpdateUsername({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 80),
              Center(
                child: const Image(image: AssetImage(Appimage.forgotpassword)),
              ),
              Row(
                children: [
                  Text(
                    'Lets create your musical \nidentity',
                    style: AppTextStyle.header
                        .copyWith(fontSize: 24, letterSpacing: 0.1),
                  ),
                  SizedBox(width: 15),
                  Image(image: AssetImage(Appimage.smilingface)),
                ],
              ),
              Text(
                'Choose a unique username to get started. \nThis will be your identity in the 10dollar community.',
                style: AppTextStyle.body(size: 13),
              ),
              SizedBox(height: 60),
              Text(
                'Username',
                style: AppTextStyle.body(fontWeight: FontWeight.bold),
              ),
              AppTextField(
                hintText: 'Enter your username',
                isUsername: true,
              ),
              SizedBox(height: 150),
              AppButton(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UploadImage()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

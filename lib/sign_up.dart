import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hybkproject/appimage.dart';
import 'package:hybkproject/forgot_password.dart';
import 'package:hybkproject/login.dart';
import 'package:hybkproject/text_styles.dart';
import 'package:hybkproject/update_username.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

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
              Center(child: const Image(image: AssetImage(Appimage.login))),
              Row(
                children: [
                  Text(
                    'Sign Up for 10dollar',
                    style: AppTextStyle.header,
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(width: 15),
                  Image(image: AssetImage(Appimage.smilingface)),
                ],
              ),
              const Text(
                  'Join the vibrant music community and unlock \nexciting opportunities!'),
              SizedBox(height: 30),
              Text(
                'Email',
                style: AppTextStyle.body(fontWeight: FontWeight.bold),
              ),
              AppTextField(hintText: 'Enter your email', isEmail: true),
              SizedBox(height: 10),
              Text(
                'Password',
                style: AppTextStyle.body(fontWeight: FontWeight.bold),
              ),
              AppTextField(hintText: 'Enter your password', isPassword: true),
              SizedBox(height: 10),
              Text(
                'Confirm Password',
                style: AppTextStyle.body(fontWeight: FontWeight.bold),
              ),
              AppTextField(hintText: 'Confirm your password', isPassword: true),
              SizedBox(height: 50),
              AppButton(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UpdateUsername()));
                  },
                  text: 'Continue'),
              SizedBox(height: 40),
              Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text: 'Already have an account?',
                          style: AppTextStyle.body()),
                      TextSpan(
                        text: 'Log In',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()));
                          },
                        style: AppTextStyle.body(color: Color(0xff7DF9FF)),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

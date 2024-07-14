import 'package:flutter/material.dart';
import 'package:hybkproject/appimage.dart';
import 'package:hybkproject/forgot_password.dart';
import 'package:hybkproject/login.dart';
import 'package:hybkproject/sign_up.dart';
import 'package:hybkproject/text_styles.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

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
                    'Reset Password',
                    style: AppTextStyle.header.copyWith(fontSize: 26),
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(width: 15),
                  Image(image: AssetImage(Appimage.smilingface))
                ],
              ),
              Text(
                'Sign in to access your account and explore \nthe world of music!',
                style: AppTextStyle.body(),
              ),
              SizedBox(height: 30),
              Text(
                'Password',
                style: AppTextStyle.body(fontWeight: FontWeight.bold),
              ),
              AppTextField(
                hintText: 'Enter your password',
                isPassword: true,
              ),
              SizedBox(height: 10),
              Text(
                'Confirm Password',
                style: AppTextStyle.body(fontWeight: FontWeight.bold),
              ),
              AppTextField(
                hintText: 'Confirm your password',
                isPassword: true,
              ),
              SizedBox(height: 15),
              Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPassword()));
                  },
                  child: Text(
                    'forgot password?',
                    style: AppTextStyle.body(color: Color(0xff7DF9FF)),
                  ),
                ),
              ),
              SizedBox(height: 50),
              AppButton(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUp()));
                  },
                  text: 'Continue'),
              SizedBox(height: 40),
              Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text: 'Don’t have an account?',
                          style: AppTextStyle.body()),
                      TextSpan(
                        text: 'Sign Up',
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

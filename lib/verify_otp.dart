import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hybkproject/appimage.dart';
import 'package:hybkproject/forgot_password.dart';
import 'package:hybkproject/login.dart';
import 'package:hybkproject/reset.dart';
import 'package:hybkproject/text_styles.dart';

class VerifyOtp extends StatelessWidget {
  const VerifyOtp({super.key});

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
                    'Verify Email With OTP?',
                    style: AppTextStyle.header.copyWith(fontSize: 24),
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(width: 15),
                  Image(image: AssetImage(Appimage.smilingface))
                ],
              ),
              Text(
                'Please enter the email address associated with your \naccount. We will send you a OTP to reset your password.',
                style: AppTextStyle.body(size: 13),
              ),
              SizedBox(height: 60),
              Text(
                'Six OTP',
                style: AppTextStyle.body(fontWeight: FontWeight.bold),
              ),
              AppTextField(hintText: 'Enter your Otp'),
              SizedBox(height: 150),
              AppButton(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResetPassword()));
                  },
                  text: 'Continue'),
              SizedBox(height: 40),
              Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text: 'Don’t receive OTP?',
                          style: AppTextStyle.body()),
                      TextSpan(
                        text: 'Resend',
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

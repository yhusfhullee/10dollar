import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hybkproject/appimage.dart';
import 'package:hybkproject/login.dart';
import 'package:hybkproject/text_styles.dart';
import 'package:hybkproject/verify_otp.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 100),
              Center(
                child: const Image(
                    image: AssetImage('assets/images/forgotpassword.png')),
              ),
              Row(
                children: [
                  Text(
                    'Forgot Your Password?',
                    style: AppTextStyle.header.copyWith(fontSize: 26),
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(width: 15),
                  Image(image: AssetImage(Appimage.thinkingface))
                ],
              ),
              Text(
                'Please enter the email address associated with your \naccount. We will send you a OTP to reset your password.',
                style: AppTextStyle.body(),
              ),
              SizedBox(height: 60),
              Text(
                'Email',
                style: AppTextStyle.body(),
              ),
              AppTextField(
                hintText: 'Enter your email',
                isEmail: true,
              ),
              SizedBox(height: 100),
              AppButton(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => VerifyOtp()));
                },
                text: 'Continue',
              ),
              SizedBox(height: 40),
              Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: 'Don’t have an account?'),
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

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const AppButton({
    super.key,
    required this.onTap,
    this.text = 'Continue',
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 45,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Color(0xff7DF9FF), borderRadius: BorderRadius.circular(10)),
        child: Text(
          text,
          style: AppTextStyle.body(),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hybkproject/appimage.dart';
import 'package:hybkproject/forgot_password.dart';
import 'package:hybkproject/text_styles.dart';

class Login extends StatelessWidget {
  const Login({super.key});

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
                  child: const Image(
                      image: AssetImage('assets/images/login.png'))),
              Row(
                children: [
                  Text(
                    'Welcome Back',
                    style: AppTextStyle.header.copyWith(fontSize: 32),
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(width: 15),
                  Image(image: AssetImage(Appimage.smilingface)),
                ],
              ),
              Text(
                'Sign in to access your account and explore \nthe world of music!',
                style: AppTextStyle.body(),
              ),
              SizedBox(height: 30),
              Text(
                'Email',
                style: AppTextStyle.body(),
              ),
              AppTextField(
                hintText: 'Enter Your Email',
                isEmail: true,
              ),
              SizedBox(height: 10),
              Text(
                'Password',
                style: AppTextStyle.body(fontWeight: FontWeight.bold),
              ),
              AppTextField(
                hintText: 'Enter Your Password',
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
              AppButton(onTap: () {}, text: 'Continue'),
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

class AppTextField extends StatefulWidget {
  final String hintText;
  final bool isPassword;
  final bool isUsername;
  final bool isEmail;
  const AppTextField({
    super.key,
    required this.hintText,
    this.isPassword = false,
    this.isEmail = false,
    this.isUsername = false,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool isObscure = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextField(
        obscureText: widget.isPassword ? isObscure : false,
        style: AppTextStyle.body(),
        decoration: InputDecoration(
            hintStyle: AppTextStyle.body(),
            hintText: widget.hintText,
            prefixIcon: widget.isPassword
                ? Icon(Icons.lock)
                : widget.isUsername
                    ? Icon(Icons.person_2)
                    : widget.isEmail
                        ? Icon(Icons.email)
                        : null,
            suffixIcon: widget.isPassword
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                    child: Icon(isObscure
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined),
                  )
                : null,
            contentPadding: EdgeInsets.only(left: 20),
            fillColor: Color(0xffD9D9D9),
            filled: true,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(10)))),
      ),
    );
  }
}

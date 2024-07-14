import 'package:flutter/material.dart';
import 'package:tendollarapp/core/constants/constant.dart';

class TextForm extends StatefulWidget {
  final String hintText;
  final bool ispassword;
  final void Function(String)? onChanged;
  final int? maxLength;
  final int? minLines;
  final int? maxLines;
  final VoidCallback? onTap;
  final bool readOnly;

  final TextInputType keyboardType;
  final TextEditingController Controller;
  const TextForm({
    Key? key,
    this.minLines = 1,
    this.maxLines = 5,
    this.readOnly = false,
    this.onTap,
    this.maxLength,
    this.onChanged,
    this.keyboardType = TextInputType.text,
    required this.Controller,
    this.ispassword = false,
    required this.hintText,
  }) : super(key: key);

  @override
  State<TextForm> createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {
  bool isobsure = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: TextFormField(
            minLines: widget.minLines,
            maxLines: widget.maxLines,
            readOnly: widget.readOnly,
            maxLength: widget.maxLength,
            onChanged: widget.onChanged,
            validator: (value) {
              return null;
            },
            onTap: widget.onTap,
            keyboardType: widget.keyboardType,
            obscureText: widget.ispassword ? isobsure : false,
            controller: widget.Controller,
            decoration: InputDecoration(
              fillColor: AppColor.whiteColor,
              hintText: widget.hintText,
              suffixIcon: widget.ispassword
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          isobsure = !isobsure;
                        });
                      },
                      child: const Icon(Icons.visibility_off))
                  : null,
              hintStyle: const TextStyle(
                fontSize: 18,
              ),
              counterStyle: const TextStyle(
                height: double.minPositive,
              ),
              counterText: "",
              border: InputBorder.none,
            ),
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
  final TextEditingController controller;
  const AppTextField({
    super.key,
    required this.hintText,
    this.isPassword = false,
    this.isEmail = false,
    this.isUsername = false,
    required this.controller,
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
        style: AppTextTheme.body(),
        decoration: InputDecoration(
            hintStyle: AppTextTheme.body(),
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

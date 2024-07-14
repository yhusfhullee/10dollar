import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/constants/constant.dart';

class VerifyForm extends StatelessWidget {
  final TextEditingController controller;
  const VerifyForm({
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 45,
      child: Center(
        child: TextFormField(
          controller: controller,
          keyboardType: TextInputType.number,
          style: AppTextTheme.bodyText(color: AppColor.whiteColor),
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(1),
          ],
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            } else {
              if (value.isEmpty) {
                FocusScope.of(context).previousFocus();
              }
            }
          },
          decoration: InputDecoration(
              alignLabelWithHint: true,
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: BorderSide(
                    width: 2,
                    color: AppColor.whiteColor,
                  )),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: BorderSide(
                    width: 2,
                    color: AppColor.whiteColor,
                  )),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: BorderSide(
                    width: 2,
                    color: AppColor.backGround,
                  )),
              hintText: "0",
              hintStyle: AppTextTheme.bodyText(color: AppColor.whiteColor)),
        ),
      ),
    );
  }
}

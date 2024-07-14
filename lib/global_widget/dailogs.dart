import 'package:flutter/material.dart';
import 'package:tendollarapp/global_widget/widget.dart';
import 'package:tendollarapp/core/constants/constant.dart';

successShowDialod({
  required BuildContext context,
  required String value,
  required VoidCallback onPressed,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        icon: Image.asset(
          AppImage.successAlertImage,
          height: 100,
          width: 50,
        ),
        title: const Text("Successful"),
        // ignore: prefer_const_constructors
        content: Text(
          value,
          textAlign: TextAlign.center,
          style: AppTextTheme.bodyText(),
        ),
        actions: [AppButton(onPressed: onPressed, value: "Done")],
      );
    },
  );
}

failedShowDialod(
    {required BuildContext context,
    required String value,
    String title = "Failed",
    required onPressed,
    VoidCallback? onWalletPressed,
    bool isInsuffcient = false}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        icon: Image.asset(
          AppImage.failedAlertImage,
          height: 100,
          width: 50,
        ),
        title: Text(
          title,
          style: AppTextTheme.heading2(),
        ),
        content: Text(
          value,
          textAlign: TextAlign.center,
          style: AppTextTheme.bodyText(),
        ),
        actions: isInsuffcient
            ? [
                AppButton(onPressed: onPressed, value: "No Thanks"),
                AppButton(onPressed: onWalletPressed, value: "TopWallet")
              ]
            : [
                AppButton(onPressed: onPressed, value: "Okay"),
              ],
      );
    },
  );
}

mainshowDialod({
  required BuildContext context,
  required String value,
  required onPressed,
  required backPressed,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        // ignore: prefer_const_constructors
        content: Text(
          value,
          textAlign: TextAlign.center,
          style: AppTextTheme.bodyText(),
        ),
        actions: [
          AppButton(onPressed: backPressed, value: "Close"),
          AppButton(onPressed: onPressed, value: "Vote")
        ],
      );
    },
  );
}

mainshowDialod2({
  required BuildContext context,
  required String value,
  required String bottobText1,
  required String bottobText2,
  required VoidCallback onPressed,
  required VoidCallback onPressed2,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        // ignore: prefer_const_constructors
        content: Text(
          value,
          textAlign: TextAlign.center,
        ),
        actions: [
          AppButton(onPressed: onPressed, value: bottobText1),
          AppButton(onPressed: onPressed2, value: bottobText2)
        ],
      );
    },
  );
}

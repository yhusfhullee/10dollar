import 'package:flutter/material.dart';
import 'package:tendollarapp/core/constants/app_styling.dart';

class Loader extends StatelessWidget {
  const Loader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Please Wait",
              style: AppTextTheme.bodyText(),
            ),
            SizedBox(
              height: 10,
            ),
            CircularProgressIndicator(),
          ],
        ),
      );
  }
}


class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Loader());
  }
}

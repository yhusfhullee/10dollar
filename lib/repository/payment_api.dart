import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tendollarapp/models/userModel.dart';

class MakePayment {
  BuildContext context;
  int price;
  UserModel userModel;
  MakePayment({
    required this.context,
    required this.price,
    required this.userModel,
  });
  /*PaymentCard getCardUi() {
  //  return PaymentCard(number: '', cvc: '', expiryMonth: 0, expiryYear: 0);
 /// }

  PaystackPlugin paystack = PaystackPlugin();

  Future initializePlugin() async {
    await paystack.initialize(
      publicKey: AppApis.publicKey,
    );
  }*/

  String _getReference() {
    String platform;
    if (Platform.isIOS) {
      platform = 'iOS';
    } else {
      platform = 'Android';
    }

    return 'ChargedFrom${platform}_${DateTime.now().millisecondsSinceEpoch}';
  }

  chargeCardAndMakeMethothd() async {
    /*   initializePlugin().then((value) async {
      Charge charge = Charge()
        ..amount = price * 100
        ..email = userModel.email
        ..reference = _getReference()
        ..card = getCardUi();

      CheckoutResponse response = await paystack.checkout(
        context,
        charge: charge,
        method: CheckoutMethod.card,
        fullscreen: false,
        logo: Image.asset(
          AppImage.logoPath,
          height: 50,
          width: 50,
        ),
      );

      if (response.status == true) {
        if (kDebugMode) {}
        if (kDebugMode) {}
        await AuthService.addMoneyUserPayment(
            amountPaid: price, userModel: userModel);
        successShowDialod(
            context: context,
            value:
                "Both the payment and delivery have \nbeen confirmed. Dispatcher would \ncome for pickup in 5 mins.",
            onPressed: () {
              Get.to(() => Home());
            });
      } else {
        if (kDebugMode) {}

        failedShowDialod(
            context: context,
            value: "Your transcation Is Uns ",
            onPressed: () {
              Get.to(() => Home());
            });
      }
    });*/
  }
}

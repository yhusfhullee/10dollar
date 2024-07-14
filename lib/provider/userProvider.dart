import '../models/userModel.dart';
import 'package:flutter/material.dart';
import 'package:appwrite/appwrite.dart';
import '../core/constants/constant.dart';
import 'package:tendollarapp/provider/appwrite_provider.dart';
import 'package:tendollarapp/repository/user_api_services.dart';

class UserProvider extends ChangeNotifier {
  UserModel? _user;
  UserModel? get getUser => _user;
  Future<void> refreshUser() async {
    UserModel user = await AuthService.getCurrentetails();
    _user = user;
    startListening(user.uid);
    notifyListeners();
  }

  Future<void> delete() async {
    await AuthService.signOut();
    _user = null;
    notifyListeners();
  }





  startListening(String chatId) {


    Realtime realtime = AppWriteProvider().getReatime;

    var sub = realtime.subscribe([
      "databases.${AppWriteConstants.databaseId}.collections.${AppWriteConstants.userdatabaseId}.documents.$chatId"
    ]);
    sub.stream.listen((event) {
      if (event.payload.isNotEmpty) {
     
        if (event.events
            .contains("databases.*.collections.*.documents.*.update")) {
          _user = UserModel.fromMap(event.payload);
          notifyListeners();
        }
      }
    });
  }
}

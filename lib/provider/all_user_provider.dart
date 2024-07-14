import 'package:appwrite/appwrite.dart';
import 'package:flutter/foundation.dart';
import '../core/constants/constant.dart';
import 'package:tendollarapp/models/model.dart';
import 'package:tendollarapp/repository/repository.dart';
import 'package:tendollarapp/provider/appwrite_provider.dart';

class AllUserProvider extends ChangeNotifier {
  static Realtime _realtime = AppWriteProvider().getReatime;
  List<UserModel> _userModel = [];
  List<UserModel> _verifyUser = [];
  List<UserModel> _mostFollowerUser = [];
  List<UserModel> get allUser => _userModel;
  List<UserModel> get getVerifyUser => _verifyUser;
  List<UserModel> get mostFollowAirtist => _mostFollowerUser;

  getAllUser() async {
    _userModel = [];

    var users = await AuthService.getAllUser();

    _userModel = users;

    notifyListeners();

    userRealtime();
    notifyListeners();
    getVerify();
  }

  UserModel? getuserById(String id) {
    bool isUserPresent = _userModel.any((element) => element.uid == id);

    print(id);
    if (isUserPresent) {
      UserModel userName =
          _userModel.firstWhere((element) => element.uid == id, orElse: null);
      notifyListeners();
      return userName;
    } else {
      Get.snackbar("404", "User with the given email not found");
      return null; // User with the given email not found
    }
  }

  UserModel? getuserByemail(String email) {
    bool isUserPresent = _userModel.any((element) => element.email == email);

    if (isUserPresent) {
      UserModel userName =
          _userModel.firstWhere((element) => element.email == email);
      notifyListeners();
      return userName;
    } else {
      Get.snackbar("404", "User with the given email not found");
      return null; // User with the given email not found
    }
  }

  bool isVerified(String id) {
    try {
      UserModel? userName =
          _userModel.firstWhere((element) => element.uid == id);
      notifyListeners();
      return userName.isVerified;
    } catch (error) {
      notifyListeners();
      return false;
    }
  }

  List<UserModel> getuserName(String name) {
    var lowercaseName = name.toLowerCase();
    var userNames = _userModel
        .where(
          (element) => element.username.toLowerCase().contains(lowercaseName),
        )
        .toList();

    notifyListeners();
    return userNames;
  }

  getVerify() {
    _verifyUser = [];
    for (var i in _userModel) {
      if (i.isVerified) {
        _verifyUser = [];
        _verifyUser.add(i);
        notifyListeners();
      }
    }

    _userModel.sort((a, b) => b.followers.length.compareTo(a.followers.length));
    List<UserModel> topThree = _userModel.take(10).toList();

    _mostFollowerUser.addAll(topThree);
    notifyListeners();
  }

  userRealtime() async {
    var sub = _realtime.subscribe([
      "databases.${AppWriteConstants.databaseId}.collections.${AppWriteConstants.userdatabaseId}.documents",
    ]).stream;
    sub.listen((event) {
      if (event.payload.isNotEmpty &&
          event.events.contains(
              "databases.${AppWriteConstants.databaseId}.collections.${AppWriteConstants.userdatabaseId}.documents.*.create")) {
        UserModel newUpdate = UserModel.fromMap(event.payload);
        final chatId = newUpdate.uid;
        final existingPostIndex =
            _userModel.indexWhere((element) => element.uid == chatId);
        if (existingPostIndex != -1) {
          _userModel[existingPostIndex] = newUpdate;
          notifyListeners();
        } else {
          _userModel.insert(0, newUpdate);
          notifyListeners();
        }
      } else if (event.events.contains(
          "databases.${AppWriteConstants.databaseId}.collections.${AppWriteConstants.userdatabaseId}.documents.*.update")) {
        UserModel newUpdate = UserModel.fromMap(event.payload);
        final chatId = newUpdate.uid;
        newUpdate = _userModel.where((element) => element.uid == chatId).first;
        final index = _userModel.indexOf(newUpdate);
        _userModel.removeWhere((element) => element.uid == chatId);
        _userModel.insert(index, UserModel.fromMap(event.payload));
        notifyListeners();
      }
    });
  }
}

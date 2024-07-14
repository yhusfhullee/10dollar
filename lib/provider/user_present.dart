import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:tendollarapp/core/constants/constant.dart';

class UserPresentNotifier extends ChangeNotifier {
  StreamSubscription? subscription;
  FirebaseDatabase database = FirebaseDatabase.instance;
  String onlineStute = "offline";
  String get getOnlineStute => onlineStute;

  Future<String> getUserPresenceStatus(String friendId) async {
    print(friendId);
    final myConnectionRef =
        database.ref().child('presence').child(friendId).child('connections');

    final friendConnectionUser = await myConnectionRef.get();

    if (friendConnectionUser.exists) {
      onlineStute = 'online';
      notifyListeners();
      return 'online';
    } else {
      var status = await getUserLastSeen(friendId);
      onlineStute = status;
      notifyListeners();
    }

    myConnectionRef.onValue.listen((event) async {
      if (event.snapshot.exists) {
        onlineStute = 'online';
        notifyListeners();
      } else {
        var status = await getUserLastSeen(friendId);
        onlineStute = status;

        notifyListeners();
      }
    });

    return onlineStute;
  }

  Future<String> getUserLastSeen(String friendId) async {
    final lastOnlineRef =
        database.ref().child('presence').child(friendId).child('lastOnline');
    await database.goOnline();

    final friendLastOnlineUser = await lastOnlineRef.get();

    if (friendLastOnlineUser.exists) {
      print(friendLastOnlineUser.value);
      int map = friendLastOnlineUser.value as int;

      var date = DateTime.fromMillisecondsSinceEpoch(map).toLocal();
      String dateTime = date.getFormattedLastSeenTime();

      print(dateTime);
      onlineStute = dateTime;
      notifyListeners();
      return dateTime;
    } else {
      String dateTime = "offline";
      onlineStute = dateTime;
      notifyListeners();
      return dateTime;
    }
  }
}

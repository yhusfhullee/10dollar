import 'package:flutter/material.dart';
import 'package:appwrite/appwrite.dart';
import 'package:tendollarapp/core/constants/app_write.dart';

class AppWriteProvider extends ChangeNotifier {
  Client _client = Client();

  Client get getclClient => _client
      .setEndpoint(AppWriteConstants.endpoint)
      .setProject(AppWriteConstants.projectId)
      .setSelfSigned(status: true);

  Account get getaccount => Account(getclClient);
  Storage get getStorage => Storage(getclClient);
  Realtime get getReatime => Realtime(getclClient);
  Databases get getDatabases => Databases(getclClient);
  // RealtimeMessage get getReame =>RealtimeMessage(events: events, payload: payload, channels: channels, timestamp: timestamp)
}

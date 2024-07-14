import 'dart:developer';

import 'package:tendollarapp/apis/auth.dart';

class AuthProvider {
  static final Apis _apis = Apis();

  static login({
    required String email,
    required String password,
  }) async {
    var res = await _apis.login(email, password);
    if (res != null && res.statusCode == 200) {}
  }

  static register({
    required String email,
    required String password,
  }) async {
    var res = await _apis.register(email, password);
    if (res != null && res.statusCode == 200) {
      log(res.body);
    }
  }
}

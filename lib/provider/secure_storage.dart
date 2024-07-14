import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  static const String _idKey = "idkey";
  static const String _idtoken = "token";
  static const String _musicIdKey = "musicIdKey";
  static const String _groupMemberKey = "groupMemberKey";
  static const String _sessionKey = "session";

  static String voteStaticKey = 'voteStaticKey';

  static Future saveVerifyToken(String value) async {
    await _secureStorage.write(key: _idtoken, value: value);
  }

  static Future<String?> getVerifyToken() async {
    var res = await _secureStorage.read(
      key: _idtoken,
    );
    return res;
  }

  static Future saveSession(String? session) async {
    final id = await _secureStorage.write(key: _sessionKey, value: session);
    return id;
  }

  static Future delectSession() async {
    await _secureStorage.delete(
      key: _sessionKey,
    );
  }

  static Future<String?> getSession() async {
    final id = await _secureStorage.read(key: _sessionKey);
    return id;
  }

  static Future saveId(String? uid) async {
    final id = await _secureStorage.write(key: _idKey, value: uid);
    return id;
  }

  static Future<String?> getId() async {
    final id = await _secureStorage.read(key: _idKey);
    return id;
  }

  static Future delecteId() async {
    await _secureStorage.delete(key: _idKey);
  }

  static Future saveGroupModel(String? groupmodel) async {
    final id =
        await _secureStorage.write(key: _groupMemberKey, value: groupmodel);
    return id;
  }

  static Future<String?> getGroupModel() async {
    final id = await _secureStorage.read(key: _groupMemberKey);
    return id;
  }

  static Future saveMusicId(String? uid) async {
    final id = await _secureStorage.write(key: _musicIdKey, value: uid);
    return id;
  }

  static Future<String?> getMusicId() async {
    final id = await _secureStorage.read(key: _musicIdKey);
    return id;
  }

  static Future saveVideoId(String? uid) async {
    final id = await _secureStorage.write(key: _musicIdKey, value: uid);
    return id;
  }

  static Future<String?> getVideoId() async {
    final id = await _secureStorage.read(key: _musicIdKey);
    return id;
  }

  static Future clearVideoId() async {
    await _secureStorage.delete(key: _musicIdKey);
  }
}

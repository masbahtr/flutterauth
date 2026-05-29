// import 'package:flutterauth/constants/app_constants.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class SessionManager {
//   Future<void> saveSession(String accessToken) async {
//     final pref = await SharedPreferences.getInstance();
//     await pref.setString(AppConstants.tokenKey, accessToken);
//   }

//   Future<String> getAccessToken() async {
//     final pref = await SharedPreferences.getInstance();
//     final accessToken = pref.getString(AppConstants.tokenKey);
//     return accessToken ?? '';
//   }

//   Future<void> removeAccessToken() async {
//     final pref = await SharedPreferences.getInstance();
//     await pref.remove(AppConstants.tokenKey);
//   }
// }

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutterauth/constants/app_constants.dart';

class SessionManager {
  final storage = const FlutterSecureStorage();
  Future<void> saveSession(String accessToken) async {
    // final pref = await SharedPreferences.getInstance();
    // await pref.setString(AppConstants.tokenKey, accessToken);
    await storage.write(key: AppConstants.tokenKey, value: accessToken);
  }

  Future<String> getAccessToken() async {
    final accessToken = await storage.read(key: AppConstants.tokenKey);
    return accessToken ?? '';
  }

  Future<void> removeAccessToken() async {
    await storage.delete(key: AppConstants.tokenKey);
  }
}

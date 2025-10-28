// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:shared_preferences/shared_preferences.dart';

// Project imports:
import 'package:collabverse/src/data/models/user_model.dart';

const kUserKey = 'user';

class AppPreferences {
  // Singleton pattern
  static final AppPreferences _instance = AppPreferences._internal();

  AppPreferences._internal();

  factory AppPreferences() => _instance;

  // Shared preferences async
  SharedPreferencesAsync? _prefs;
  SharedPreferencesAsync get prefs => _prefs ??= SharedPreferencesAsync();

  /// Set user to persistent storage
  Future<void> setUser(UserModel user) async {
    return await prefs.setString(kUserKey, jsonEncode(user.toMap()));
  }

  /// Get user from persistent storage
  Future<UserModel?> getUser() async {
    if (!await prefs.containsKey(kUserKey)) return null;

    final userJson = await prefs.getString(kUserKey);

    return UserModel.fromMap(jsonDecode(userJson!));
  }
}

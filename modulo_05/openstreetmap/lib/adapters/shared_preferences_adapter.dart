import 'dart:convert';

import 'package:openstreetmap/adapters/local_storage_drive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesAdapter implements LocalStorageDrive {
  @override
  Future<Map<String, dynamic>?> get(String key) async {
    final instance = await SharedPreferences.getInstance();
    final response = instance.getString(key);
    return response != null ? jsonDecode(response) : null;
  }

  @override
  Future<void> set(String key, Map<String, dynamic> value) async {
    final instance = await SharedPreferences.getInstance();
    final result = await instance.setString(key, jsonEncode(value));
    print(result);
  }
}

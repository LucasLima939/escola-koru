abstract class LocalStorageDrive {
  Future<void> set(String key, Map<String, dynamic> value);
  Future<Map<String, dynamic>?> get(String key);
}
import 'package:get_storage/get_storage.dart';

mixin StorageUtil {
  final _storage = GetStorage();

  Future<void> saveString(String key, String uid) async {
    await _storage.write(key, uid);
  }

  String? getString(String key) {
    return _storage.read(key);
  }
}

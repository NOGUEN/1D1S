import 'package:one_day_one_something/app/data/local/db/storage_util.dart';

class FirebaseClient with StorageUtil {
  FirebaseClient._privateConstructor();
  static final FirebaseClient _instace = FirebaseClient._privateConstructor();
  factory FirebaseClient() {
    return _instace;
  }
}

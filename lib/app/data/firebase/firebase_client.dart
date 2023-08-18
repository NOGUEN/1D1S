import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:one_day_one_something/app/data/firebase/firebase_const.dart';
import 'package:one_day_one_something/app/data/local/db/storage_util.dart';
import 'package:one_day_one_something/app/data/model/firebase/user_model.dart';

class FirebaseClient with StorageUtil {
  FirebaseClient._privateConstructor();
  static final FirebaseClient _instace = FirebaseClient._privateConstructor();
  factory FirebaseClient() {
    return _instace;
  }
}

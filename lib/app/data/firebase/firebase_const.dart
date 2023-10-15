import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

FirebaseAuth firebaseAuth = FirebaseAuth.instance;

String? myName = firebaseAuth.currentUser!.displayName;

DatabaseReference databaseRef = FirebaseDatabase.instance.ref();

enum FirebaseCode { SUCCESS, ERROR, WEAK_PASSWORD, EMAIL_ALREADY_IN_USE }

const int SUCCESS = 0;
const int ERROR = 999;
const int FAIL_ONE = 1;
const int FAIL_SECOND = 2;
const int FAIL_THREE = 3;
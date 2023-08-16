import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

FirebaseAuth firebaseAuth = FirebaseAuth.instance;

String? myName = firebaseAuth.currentUser!.displayName;

DatabaseReference databaseRef = FirebaseDatabase.instance.ref();

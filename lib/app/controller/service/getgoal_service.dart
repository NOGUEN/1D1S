import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GoalController {
  var goalname = ''.obs;
  var gaoldays = 0.obs;
  var goalcolor = 0.obs;
  var goalemoji = 0.obs;
  var goalcomplete = false.obs;
  var goalstreak = 0.obs;

  void saveDataToFirestore() {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('users');
    final userid = FirebaseAuth.instance.currentUser!.uid;
    
    DocumentReference userDocRef = users.doc(userid);
    CollectionReference goals = userDocRef.collection('goallist');

    goals.add({
      'goal_name': goalname.value,
      'goal_days': gaoldays.value,
      'goal_color': goalcolor.value,
      'goal_emoji': goalemoji.value,
      'goal_complete': false,
      'goal_streak': 0,
    })
    .then((value) => print("Goal added to Firestore"))
    .catchError((error) => print("Failed to add goal: $error"));
  }

}
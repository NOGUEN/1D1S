import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RecordController {
  var record_date = DateTime.now().toString().obs;
  var record_note = ''.obs;

  void saveDataToFirestore(String docId, DateTime date) {
    //새롭게 데이터 추가
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('users');
    final userid = FirebaseAuth.instance.currentUser!.uid;

    DocumentReference userDocRef = users.doc(userid);
    CollectionReference records =
        userDocRef.collection('goallist').doc(docId).collection('record_list');
    records
        .add({
          'record_date': record_date.value,
          'record_note': record_note.value,
        })
        .then((value) => print("Record added to Firestore"))
        .catchError((error) => print("Failed to add record: $error"));
  }

  void increaseStreak(String docId) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('users');
    final userid = FirebaseAuth.instance.currentUser!.uid;

    DocumentReference userDocRef = users.doc(userid);
    DocumentSnapshot<Map<String, dynamic>> record_data =
        await userDocRef.collection('goallist').doc(docId).get();
    Map<String, dynamic> new_record_data;
    Map<String, dynamic> origin_record_data = {
      "goal_color": record_data.data()!["goal_color"],
      "goal_complete": record_data.data()!["goal_complete"],
      "goal_days": record_data.data()!["goal_days"],
      "goal_emoji": record_data.data()!["goal_emoji"],
      "goal_name": record_data.data()!["goal_name"],
      "goal_streak": record_data.data()!["goal_streak"]
    };
    if (origin_record_data["goal_streak"] ==
        origin_record_data["goal_days"] - 1) //record_list가 추가되면 complete로 바꿔준다.
    {
      new_record_data = {
        "goal_color": record_data.data()!["goal_color"],
        "goal_complete": true,
        "goal_days": record_data.data()!["goal_days"],
        "goal_emoji": record_data.data()!["goal_emoji"],
        "goal_name": record_data.data()!["goal_name"],
        "goal_streak": record_data.data()!["goal_streak"] + 1
      };
    } else {
      new_record_data = {
        "goal_color": record_data.data()!["goal_color"],
        "goal_complete": record_data.data()!["goal_complete"],
        "goal_days": record_data.data()!["goal_days"],
        "goal_emoji": record_data.data()!["goal_emoji"],
        "goal_name": record_data.data()!["goal_name"],
        "goal_streak": record_data.data()!["goal_streak"] + 1
      };
    }
    await userDocRef.collection('goallist').doc(docId).update(new_record_data);
  }
}

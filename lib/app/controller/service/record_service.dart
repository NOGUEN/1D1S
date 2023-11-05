import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RecordController {
  var record_date = DateTime.now().toString().obs;
  var record_note = ''.obs;
  Future<bool> todaydatepossible(String docId, DateTime date) async {
    String formattedDate =
        "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}"; // YYYY-MM-DD 형식으로 날짜 변환
    var records = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('goallist') // 원하는 컬렉션 이름으로 변경하세요.
        .doc(docId)
        .collection('record_list')
        .where('record_date', isEqualTo: formattedDate)
        .get();

    // 이미 기록이 있으면 메시지를 표시하고, 없으면 기록을 저장합니다.
    if (records.docs.isNotEmpty) {
      Get.snackbar("Error", "오늘의 기록은 이미 추가되었습니다!"); // 오류 메시지 표시
      return false;
    } else {
      return true;
    }
  }

  void saveDataToFirestore(String docId, DateTime date) {
    //새롭게 데이터 추가
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('users');
    final userid = FirebaseAuth.instance.currentUser!.uid;

    DocumentReference userDocRef = users.doc(userid);
    CollectionReference records =
        userDocRef.collection('goallist').doc(docId).collection('record_list');
    String formatteddate = record_date.value.substring(0, 10);
    //이부분 record_date.value가 아닌 formattedDate로 변경이 필요함.
    records
        .add({
          'record_date': formatteddate,
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

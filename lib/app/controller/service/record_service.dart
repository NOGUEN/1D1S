import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RecordController {
  var record_date = DateTime.now().toString().obs;
  var record_note = ''.obs;

  void saveDataToFirestore(String docId, DateTime date) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('users');
    final userid = FirebaseAuth.instance.currentUser!.uid;
    
    DocumentReference userDocRef = users.doc(userid);
    CollectionReference records = userDocRef
      .collection('goallist')
      .doc(docId)
      .collection('record_list');
    
    records.add({
      'record_date': record_date.value,
      'record_note': record_note.value,
    })
    .then((value) => print("Record added to Firestore"))
    .catchError((error) => print("Failed to add record: $error"));
  }
}
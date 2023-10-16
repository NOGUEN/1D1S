import 'package:one_day_one_something/app/data/local/db/storage_util.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:one_day_one_something/app/data/model/firebase/goal_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';


class GoalService with StorageUtil {
  var userId = ''.obs;
  final usersCollection = FirebaseFirestore.instance.collection('users');

  void readGoal() async {
    await usersCollection.get().then((event) {
      for (var doc in event.docs) {
        print("${doc.id} => ${doc.data()}");
      }
    });
  }
  void addGoal(String? uid,{required GoalModel goal})async{
    
    await usersCollection.doc(userId.value)
      .collection("goallist")
      .doc()
      .set({
        "update":true,
        "modify":false,
      });
    
  }
  void deleteGoal(String? uid,{required GoalModel goal}) async{
    await usersCollection.doc(userId.value)
      .update({
        "update":false
      });

  }
  void updateGoal(String? uid,{required GoalModel goal}) async{
    DocumentSnapshot<Map<String, dynamic>> _data = await usersCollection.doc(userId.value).get();
    Map<String, dynamic> _newData = {
	    "update": _data.data()!["update"],
	    "modify": true
	};
    await usersCollection.doc(userId.value)
      .update(
        _newData
      );
  }
}

import 'package:one_day_one_something/app/data/local/db/storage_util.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:one_day_one_something/app/data/model/firebase/goal_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


final FirebaseFirestore db = FirebaseFirestore.instance;

class GoalService with StorageUtil {
  void readGoal() async {
    await db.collection("users").get().then((event) {
      for (var doc in event.docs) {
        print("${doc.id} => ${doc.data()}");
      }
    });
  }
  void addGoal(String? uid,{required GoalModel goal})async{
    await db
      .collection('users')
      .doc(uid)
      .collection("goallist")
      .doc()
      .set({
        "update":true,
        "modify":false,
      });
    
  }
  void deleteGoal(String? uid,{required GoalModel goal}) async{
    await db
      .collection("users")
      .doc(uid)
      .update({
        "update":false
      });

  }
  void updateGoal(String? uid,{required GoalModel goal}) async{
    DocumentSnapshot<Map<String, dynamic>> _data = await db.collection("users").doc(uid).get();
    Map<String, dynamic> _newData = {
	    "update": _data.data()!["update"],
	    "modify": true
	};
    await db
      .collection("users")
      .doc(uid)
      .update(
        _newData
      );
  }
}

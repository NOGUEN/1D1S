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

  void addGoal({required GoalModel goal}) {}
  void deleteGoal({required GoalModel goal}) {}
  void updateGoal({required GoalModel goal}) {}
}

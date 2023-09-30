import 'package:one_day_one_something/app/data/local/db/storage_util.dart';
import 'package:firebase_database/firebase_database.dart';

class GoalService with StorageUtil {
  Future<Datasnapshot> readGoal({required String userId}) async 
    DatabaseReferece ref = FirebaseDatabase.instance.ref("$userId/user_data/");
    final snapshot = await ref.child("").get();
    return snapshot;
  }

  void addGoal({required GoalModel goal}){
    DatabaseReferece ref = FirebaseDatabase.instance.ref
  }
}
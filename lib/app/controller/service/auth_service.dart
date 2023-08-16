import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:one_day_one_something/app/data/firebase/firebase_const.dart';
import 'package:one_day_one_something/app/data/local/db/storage_util.dart';
import 'package:one_day_one_something/app/data/local/db/util.dart';
import 'package:one_day_one_something/app/data/model/firebase/user_model.dart';

class AuthService with StorageUtil {
  //회원가입
  Future<int> register(UserModel userModel, String password) async {
    try {
      final credential = await firebaseAuth.createUserWithEmailAndPassword(
          email: userModel.email, password: password);

      final uid = credential.user!.uid;
      userModel.uid = uid;
      credential.user!.updateDisplayName(userModel.name);

      saveString(UID_KEY, uid);
      return SUCCESS;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log("6자이상 비밀번호가 필요합니다");
        return FAIL_ONE;
      } else if (e.code == 'email-already-in-use') {
        log("가입된 이메일 입니다");
        return FAIL_SECOND;
      }
    } catch (e) {
      log(e.toString());
      return ERROR;
    }
    return ERROR;
  }

  //로그인
  Future<int> login(String email, String password) async {
    try {
      UserCredential credential = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      saveString(UID_KEY, credential.user!.uid);
      return SUCCESS;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log("가입된 이메일이 아닙니다");
        return FAIL_ONE;
      } else if (e.code == 'wrong-password') {
        log("비밀번호가 틀렸습니다");
        return FAIL_SECOND;
      }
    } catch (e) {
      log(e.toString());
      return ERROR;
    }
    return ERROR;
  }

  //로그아웃
  void logout() async {
    await firebaseAuth.signOut();
  }
}

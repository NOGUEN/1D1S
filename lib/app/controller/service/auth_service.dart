import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:one_day_one_something/app/data/firebase/firebase_const.dart';
import 'package:one_day_one_something/app/data/local/db/storage_util.dart';
import 'package:one_day_one_something/app/data/local/db/util.dart';
import 'package:one_day_one_something/app/data/model/firebase/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService with StorageUtil {
  //회원가입
  Future<FirebaseCode> register(UserModel userModel, String password) async {
    try {
      final credential = await firebaseAuth.createUserWithEmailAndPassword(
          email: userModel.email, password: password);
      final uid = credential.user!.uid;
      userModel.uid = uid;
      // credential.user!.updateDisplayName(userModel.name);
      saveString(UID_KEY, uid);

      //user가 가입했을 시에 authenticate database 뿐만아니라 firestore database에도 user 정보를 추가해준다.
      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        // 'name': userModel.name,
        'email': userModel.email,
        'nickname': userModel.nickname,
        'created_at': FieldValue.serverTimestamp(),
        'reminder': false,
        // Add more fields as needed
      });
      return FirebaseCode.SUCCESS;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log("6자이상 비밀번호가 필요합니다");
        return FirebaseCode.WEAK_PASSWORD;
      } else if (e.code == 'email-already-in-use') {
        log("가입된 이메일 입니다");
        return FirebaseCode.EMAIL_ALREADY_IN_USE;
      }
    } catch (e) {
      log(e.toString());
      return FirebaseCode.ERROR;
    }
    return FirebaseCode.ERROR;
  }

  //로그인
  Future<int> login(String email, String password) async {
    try {
      // User 가 가입했을때 authenticate 부분을 통해서 로그인
      UserCredential credential = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      saveString(UID_KEY, credential.user!.uid);
      User? user = credential.user;
      await user!.reload();
      // user = FirebaseAuth.instance.currentUser;
      if(user!.emailVerified == false){
        return FAIL_THREE;
      }
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

  //회원탈퇴
  Future<FirebaseCode> deleteAccount() async {
    try {
      User? user = firebaseAuth.currentUser;
      if (user != null) {
        await user.delete();
        // 사용자 계정 삭제 성공 시 로컬 저장된 UID 삭제
        removeString(UID_KEY);
        return FirebaseCode.SUCCESS;
      } else {
        return FirebaseCode.ERROR;
      }
    } catch (e) {
      log(e.toString());
      return FirebaseCode.ERROR;
    }
  }
}

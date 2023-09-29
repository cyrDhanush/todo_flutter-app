import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo/global/global.dart';

class LoginServices {
  static Future<String> loginWithEmailId(
      {required String emailid, required String password}) async {
    try {
      await auth.signInWithEmailAndPassword(email: emailid, password: password);
    } catch (e) {
      print(e);
      return e.toString();
    }
    return 'success';
  }

  static Future<String> signupWithEmailId(
      {required String name,
      required String emailid,
      required String password}) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: emailid, password: password);
    } catch (e) {
      return e.toString();
    }
    userref.doc(emailid).set({
      'name': name,
    });
    return 'success';
  }

  static logOut() async {
    await auth.signOut();
  }
}

import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseService {
  Future<UserCredential> loginUserWithFirebase(String email, String password);

  Future<UserCredential> signupUserWithFirebase(
      String name, String email, String password);

  void signOutUser();
  bool isUserLogin();
}

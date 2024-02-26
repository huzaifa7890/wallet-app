import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:walletapp/provider/repository/firebase_service.dart';

class FirebaseAuthRepo extends FirebaseService {
  FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  bool isUserLogin() {
    if (auth.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<UserCredential> loginUserWithFirebase(
      String email, String password) async {
    final userLogin =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    return userLogin;
  }

  @override
  void signOutUser() {
    auth.currentUser!;
    auth.signOut();
  }

  @override
  Future<UserCredential> signupUserWithFirebase(
      String name, String email, String password) async {
    final userCredential = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return userCredential;
  }

  Future<UserCredential> loginWithGoogle() async {
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      return await auth.signInWithCredential(credential);
    }
    throw FirebaseAuthException(
      code: 'ERROR_ABORTED_BY_USER',
      message: 'Sign in aborted by user',
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:skillshark/components/userdata_service.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<User> signInWithGoogle() async {
    GoogleAuthProvider googleProvider = GoogleAuthProvider();

    googleProvider.setCustomParameters({'login_hint': 'user@example.com'});

    UserCredential googleCred =
        await FirebaseAuth.instance.signInWithPopup(googleProvider);

    if (googleCred.additionalUserInfo.isNewUser) {
      await UserdataService().userCreate(
          _firebaseAuth.currentUser.uid, googleCred.user.displayName);
    }
    return googleCred.user;
  }

  Future<User> signInWithGitHub() async {
    GithubAuthProvider githubProvider = GithubAuthProvider();

    UserCredential githubCred =
        await FirebaseAuth.instance.signInWithPopup(githubProvider);

    if (githubCred.additionalUserInfo.isNewUser) {
      await UserdataService().userCreate(_firebaseAuth.currentUser.uid,
          githubCred.additionalUserInfo.username);
    }
    return githubCred.user;
  }

  Future<String> logIn({String email, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return 'Logged In';
    } on FirebaseAuthException catch (e) {
      return e.toString();
    }
  }

  Future<String> signUp(
      {String email, String password, String username}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      await UserdataService()
          .userCreate(_firebaseAuth.currentUser.uid.toString(), username);
      return 'Signed Up';
    } on FirebaseAuthException catch (e) {
      return e.toString();
    }
  }
}

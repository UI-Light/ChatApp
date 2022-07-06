import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  //listen for authentication changes
  //(returns null if signed out and a user object if signed in) using stream
  Stream<User?> get authStateChanges => firebaseAuth.authStateChanges();

  // SignIn with Email and password
  Future signIn({required String email, required String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      return e.toString();
    }
  }

  //SignUp for new user
  Future signUp(
      {required String username,
      required String email,
      required String password,
      required String confirmPassword}) async {
    try {
      var result = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return result.user;
    } catch (e) {
      return e.toString();
    }
  }

  //SignOut of app
  void signOut() {
    firebaseAuth.signOut();
  }
}

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //get instance of auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // login with email and password
  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // register
  Future<UserCredential> signUpUsingEmailAndPassword(
      String email, String password) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // logout
  Future<void> signOut() async {
    return await _auth.signOut();
  }
}

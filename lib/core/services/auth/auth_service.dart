import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  //get instance of auth
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String currentUserEmail = "User";

  // get current user email
  Future<String> getCurrentUserEmail() async {
    User? user = _auth.currentUser;
    debugPrint("Got User Email!!");
    return user!.email.toString();
  }
  

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
      String username, String email, String password) async {
    try { // get first and last name 
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      FirebaseFirestore.instance
      .collection("Users")
      .doc(userCredential.user!.email)
      .set({
        'username' : username,
      });

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // addUserDetails
  // Future<void> addUserDetails(String firstName, String LastName, String ) {}

  // logout
  Future<void> signOut() async {
    return await _auth.signOut();
  }
}

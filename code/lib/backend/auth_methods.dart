import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // sign up user function
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String description,
  }) async {
    String result = "Error!";
    try {
      // Checking if everything is valid
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          description.isNotEmpty) {
        // register the user in firebase
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        // add user to database
        await _firestore.collection('users').doc(cred.user!.uid).set({
          'username': username,
          'uid': cred.user!.uid,
          'email': email,
          'description': description,
          'team members': [],
        });
        result = "success";
      }
    } catch (error) {
      result = error.toString();
    }
    return result;
  }

  // Login User function
}

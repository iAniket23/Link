import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:code/backend/models/user.dart' as model;
import 'package:code/backend/models/team.dart' as teamModel;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // get user detail from a snapshot
  Future<model.User> getUserDetail() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot snap =
        await _firestore.collection('users').doc(currentUser.uid).get();

    return model.User.fromSnap(snap);
  }

  // create team function
  Future<String> createTeam({
    required String teamName,
  }) async {
    String result = "Error!";
    try {
      if (teamName.isNotEmpty) {
        teamModel.Team team = teamModel.Team(
          teamName: teamName,
          members: [],
          allTeamTask: [],
          scrumMaster: _auth.currentUser!.uid,
          uuid: _auth.currentUser!.uid,
        );
        await _firestore
            .collection('teams')
            .doc(_auth.currentUser!.uid)
            .set(team.toJson(),
            );
      }
    } catch (error) {
      result = error.toString();
    }
    return result;
  }

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
        model.User user = model.User(
          username: username,
          uid: cred.user!.uid,
          email: email,
          description: description,
          teamList: [],
          taskList: [],
        );
        await _firestore.collection('users').doc(cred.user!.uid).set(
              user.toJson(),
            );
        result = "success";
      }
    } catch (error) {
      result = error.toString();
    }
    return result;
  }

  // Login User function
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String result = "Error!";
    // validating all the inputs
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        result = "Success";
      } else {
        result = "Please enter all the fields";
      }
    } catch (error) {
      result = error.toString();
    }
    return result;
  }

  // Sign Out function
  Future<void> signOutUser() async {
    await _auth.signOut();
  }
}

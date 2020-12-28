import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthHelper {
  //checks if a user is already logedin
  checkForUser() {
    FirebaseAuth.instance.authStateChanges().listen((User user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }

  //register user
  Future regsterUser({
    String email,
    String password,
    String phone,
    String fullName,
    BuildContext context,
    // String lastName,
  }) async {
    String errorCode = '';

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      print(userCredential);
      if (userCredential != null) {
        DatabaseReference newUserRef = FirebaseDatabase.instance
            .reference()
            .child('users/${userCredential.user.uid}');
        //set data to be saved
        Map<String, dynamic> newUserMap = {
          "fullname": fullName,
          "email": email,
          "phone": phone,
        };
        //save data
        newUserRef.set(newUserMap);
        print('Saved user $newUserMap');
      } else {
        print('user auth failed');
      }
    } on FirebaseAuthException catch (e) {
      errorCode = e.code;
    }
    return errorCode;
  }

  //login user
  Future loginUser(
      {String email, String password, BuildContext context}) async {
    // String error = '';
    String errorCode = '';
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredential != null) {
        print("works");
      }
    } on FirebaseAuthException catch (e) {
      errorCode = e.code;
    }
    return errorCode;
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}

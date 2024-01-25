import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:useCubitToKeebUserloginedAnddarkmode/Core/utils/Constant.dart';

class firbsese_servises {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<UserCredential?> Loginedfunction(
      {required String demail, required String pass, required context}) async {
    UserCredential userCredential;

    try {
      userCredential = await _auth.signInWithEmailAndPassword(
        email: demail,
        password: pass,
      );

      print('Login successful: ${userCredential.user!.uid}');
      return userCredential;
    } on FirebaseAuthException catch (e) {
      // we are check with e exeption with e.code ++++++++++++++++++++++++
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(e.code == "network-request-failed"
                  ? "Sorry :("
                  : 'Sure with Email and Passowrd ?'),
              content: Text(e.code == "network-request-failed"
                  ? " No Connect With inernet  "
                  : 'Try again Error during login.....'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Text('OK'),
                ),
              ],
            );
          });
    } catch (e) {
      print('Error during login: $e');
      return null;
    }
  }

  static Future<UserCredential?> SighnUpFnctions(
      {required String demail, required String pass, required context}) async {
    UserCredential userCredential;

    try {
      userCredential = await _auth.createUserWithEmailAndPassword(
        email: demail,
        password: pass,
      );

      print('Registeration successful: ${userCredential.user!.uid}');
      return userCredential;
    } on FirebaseAuthException catch (e) {
      // we are check with e exeption with e.code ++++++++++++++++++++++++
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(e.code == "network-request-failed"
                  ? "Sorry :("
                  : e.code == "email-already-in-use"
                      ? "The email address is already in use"
                      : 'Sure with Email and Passowrd ?'),
              content: Text(e.code == "network-request-failed"
                  ? " No Connect With inernet  "
                  : e.code == "email-already-in-use"
                      ? "The email address is already in use"
                      : 'Try again Error during login.....'),
              actions: [
                TextButton(
                  onPressed: () {
                    print(e.code);
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Text('OK'),
                ),
              ],
            );
          });
    } catch (e) {
      print('Error during Registartion $e');
      return null;
    }
  }

//method to add uer to firestore with New Document  and return Bool type ++++++++++++
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static Future<bool?> addUsertofireStore(
      String username, String password, String uid) async {
    try {
      var x = await _firestore.collection('${constant.ImagePath}');
      //we check new parmetr is exists if user is  found in fire store  or not?++++++++++++++++++
      var UserWasAdded = await _firestore.collection('users').doc(uid).get();
      if (UserWasAdded.exists == true) {
        print("This user is Added Before !?");
        return true;
      } else {
        x.doc(uid).set({
          'username': username,
          'password': password,
          'uid': uid,
        });

        print("Wellcome New User");
        print(
            'User added to Firestore successfully from firbsese_servises uid  is : $uid');
        return true;
      }
    } catch (error) {
      print(
          'Error adding user to Firestore from firbsese_servises is : $error');
      return false;
    }
  }
}

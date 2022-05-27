import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../resources/storage_methods.dart';

class AuthMethod {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signUpUser(
      {required String email,
      required String password,
      required String username,
      required String bio,
      required Uint8List file}) async {
    String res = 'Some error occured';

    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty ||
          file != null) {
        //register user

        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        print(cred.user!.uid);

        String photoUrl = await StorageMethdos()
            .uploadImageToStorage('profilePics', file, false);

        // add user to database

        await _firestore.collection('users').doc(cred.user!.uid).set({
          'username': username,
          'uid': cred.user!.uid,
          'email': email,
          'bio': bio,
          'followers': [],
          'following': [],
          'photoUrl': photoUrl,
        });
        res = "Success";
      }
    } on FirebaseAuthException catch (err) {
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> loginUser(
      {required String email, required String password}) async {
    String res = 'Some error occur';

    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = 'Success';
      } else {
        res = 'Please enter all the fields';
      }
      
    } 
     
    catch (err) {
      res = err.toString();
    }

    return res;
  }
}

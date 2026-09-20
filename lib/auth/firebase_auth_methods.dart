import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets/showSnackbar.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;
  FirebaseAuthMethods(this._auth);

  User? get currentUser => _auth.currentUser!;

  Stream<User?> get authState => _auth.authStateChanges();

  Future<void> logout() async {
    await _auth.signOut();
  }

  Future<void> signIn({required String email, required String password, required BuildContext context}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      showSnackbar(context, 'Error signing in: $e'); 
    }
  }

  Future<void> signUp({required String email, required String password, required BuildContext context}) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      showSnackbar(context, 'Error signing up: $e');
    }
  }

  Future<void> deleteAccount({required BuildContext context}) async {
    try {
      await _auth.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      showSnackbar(context, 'Error deleting account: $e');
    }
  }

  Future<void> updatePassword({required String newPassword, required BuildContext context}) async {
    try {
      await _auth.currentUser!.updatePassword(newPassword);
    } on FirebaseAuthException catch (e) {
      showSnackbar(context, 'Error updating password: $e');
    }
  }
}
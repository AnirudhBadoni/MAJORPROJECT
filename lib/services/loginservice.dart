import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:majorproject/models/loginusermodel.dart';


class LoginService {

   LoginService() {
    Firebase.initializeApp();
  }

  late LoginUserModel _userModel;

  LoginUserModel get loggedInUserModel => _userModel;

  Future<bool> signInWithGoogle() async {
    // Trigger the authentication flow
    GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    if (googleUser == null) {
      return false;
    }

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    // Create a new credential
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    UserCredential userCreds = await FirebaseAuth.instance.signInWithCredential(credential);
    if (userCreds != null) {
      _userModel = LoginUserModel(
        displayName: userCreds.user!.displayName as String,
        photoUrl: userCreds.user!.photoURL as String,
        email: userCreds.user!.email as String
      );
    }

    return true;
  }

  void signOut() async {
    await GoogleSignIn().signOut();
    _userModel != null;
  }
}
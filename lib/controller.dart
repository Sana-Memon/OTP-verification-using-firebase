import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signing_in_through_otp/home.dart';

class VerifyPhone {
  var verificationId = ''.obs;
  String verID = "";
  var OTPpin = "";

  Future<void> phoneAuthentication(context, String phoneNo) async {
    final _auth = FirebaseAuth.instance;
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNo,
        timeout: Duration(seconds: 20),
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
          showSackBarText(context, "Auth Completed");
        },
        verificationFailed: (FirebaseAuthException e) {
          showSackBarText(context, "Auth failed");
        },
        codeSent: (String verificationId, int? resendToken) {
          verID = verificationId;
          showSackBarText(context, "code sent");
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          showSackBarText(context, "Timed out");
        });
  }

  void showSackBarText(context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  Future<void> verifyOTP(context) async {
    await FirebaseAuth.instance
        .signInWithCredential(PhoneAuthProvider.credential(
            verificationId: verID, smsCode: OTPpin))
        .whenComplete(() => Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) => Home())));
  }

  sendcode() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+44 7123 123 456',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {},
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}

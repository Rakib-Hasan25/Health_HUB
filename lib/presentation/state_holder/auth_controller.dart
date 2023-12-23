
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:health_hub/data/models/User.dart'as model;
import 'package:health_hub/presentation/ui/screens/auth/login_page_as_user.dart';
import 'package:health_hub/presentation/ui/screens/user/main_bottom_nav_screen.dart';

import 'package:health_hub/presentation/ui/utilis/auth.dart';


class AuthController extends GetxController{
  static AuthController instance = Get.find();



  void registerUser(
      String email, String password,bool ok
      
      ) async {
    try {
      if (ok) {
        // save out user to our ath and firebase firestore
        UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
       
        model.User user = model.User(password: password, email: email, uid: cred.user!.uid);
        print("fsd");
        await firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson());

        Get.snackbar(
          'Congratulation',
          'account create successfully',
          backgroundColor: Colors.grey
        );

      }

    } catch (e) {
      Get.snackbar(
        'Error Creating Account',
        e.toString(),
          backgroundColor: Colors.grey
      );
    }
  }


  void loginUser(String email, String password,bool ok) async {
    try {
      if (ok) {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);


        Get.to(MainBottomNavScreen());
      }
    } catch (e) {
      Get.snackbar(
        'Error Logging in',
        e.toString(),
        backgroundColor: Colors.grey
      );
    }
  }

  void signOut() async {
    await firebaseAuth.signOut();
  }




}


import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:project_my_app/views/profile_screen.dart';

import '../views/home_screen.dart';

class AuthController extends GetxController{

  FirebaseAuth auth = FirebaseAuth.instance;

  var isLoading = false.obs;

  void signUp({String? name,String? email,String? password}){

    isLoading(true);

    /// here we have to two things: 1-email, 2-password
    auth.createUserWithEmailAndPassword(email: email!, password: password!)
        .then((value) => {
      /// Navigate user to profile screen
      isLoading(false),
      Get.to(()=>const ProfileScreen())
    }).catchError((onError){
      /// print for error information
      isLoading(false);
      print("Error in authentication $onError");
    });
  }

  void login({String? email,String? password}){

    isLoading(true);

    auth.signInWithEmailAndPassword(email: email!, password: password!)
        .then((value) => {
      isLoading(false),
     /// Login success
        Get.to(()=>const HomeScreen())
    }).catchError((onError){
      isLoading(false);
      /// Error occurred

    });

  }


}
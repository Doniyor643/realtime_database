import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:project_my_app/views/home_screen.dart';
import 'package:project_my_app/views/login_screen.dart';
import 'package:project_my_app/views/onboarding_screen.dart';
import 'package:project_my_app/views/signUp_screen.dart';

Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await Firebase.initializeApp().then((value) => print('Firebase Initialization Complete'));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        home: const OnBoardingScreen(),
        routes: {
          OnBoardingScreen.id:(context) => const OnBoardingScreen(),
          LoginScreen.id:(context) => const LoginScreen(),
          SignUpPage.id:(context) => const SignUpPage(),
          HomeScreen.id:(context) => const HomeScreen(),
        },
      );
  }
}


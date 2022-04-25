
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_my_app/screens/contacts.dart';


Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await Firebase.initializeApp().then((value) => print('Firebase Initialization Complete !!!!!!!!!!!!!!!'));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Contacts(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/auth_controller.dart';
import 'login_screen.dart';

class SignUpPage extends StatefulWidget {
  static const String id = 'signUp_screen';
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  late AuthController authController;
  @override
  void initState() {
    super.initState();
    authController = Get.put(AuthController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            const SizedBox(height: 50,),

            SizedBox(
              height: 200,
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 0),
                                color: Colors.grey,
                                spreadRadius: 10,
                                blurRadius: 100
                            )
                          ]),
                    ),
                    const Text('Sign up',style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                    ),)
                  ],
                ),
              ),
            ),

            //const SizedBox(height: 50,),

            textForm(text: "Name",controller: nameController),

            textForm(text: "Email",controller: emailController),

            textForm(text: "Password",controller: passwordController),

            Container(
              height: 50,
              width: double.infinity,
              margin: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 5),
                        color: Colors.grey,
                        spreadRadius: 2,
                        blurRadius: 10
                    )
                  ]),
              child: ElevatedButton(
                  onPressed: (){
                    authController.signUp(
                      name: nameController.text.trim(),
                      email: emailController.text.trim(),
                      password: passwordController.text.trim(),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.deepPurple,
                  ),
                  child: const Text("Sign Up",style: TextStyle(
                      fontSize: 25
                  ),)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account? "),
                TextButton(
                    onPressed: (){
                      Navigator.pushReplacementNamed(context, LoginScreen.id);
                    },
                    child: const Text("Login")),
              ],
            ),
          ],),
        ),
      ),
    );
  }

  Widget textForm({text,controller}){
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 5),
                color: Colors.grey,
                spreadRadius: 2,
                blurRadius: 10
            )
          ]),
      child: ElevatedButton(
        onPressed: (){},
        style: ElevatedButton.styleFrom(
            primary: Colors.white,
            animationDuration: const Duration(seconds: 2)
        ),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: text,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:project_my_app/controller/auth_controller.dart';
import 'package:project_my_app/views/signUp_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

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
                    const Text('Welcome to Future',style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),)
                  ],
                ),
              ),
            ),

            const SizedBox(height: 50,),

            textForm(text: "Email",controller: emailController),

            textForm(text: "Password",controller: passwordController),

            TextButton(
                onPressed: (){},
                child: const Text("Forget password?")),

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
                    authController.login(
                      email: emailController.text.trim(),
                      password: passwordController.text.trim(),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.deepPurple,
                  ),
                  child: const Text("Login",style: TextStyle(
                    fontSize: 25
                  ),)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account? "),
                TextButton(
                    onPressed: (){
                      Navigator.pushReplacementNamed(context, SignUpPage.id);
                    },
                    child: const Text("Sign Up")),
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

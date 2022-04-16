import 'package:flutter/material.dart';
import 'package:project_my_app/views/login_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  static const String id = "onboarding_screen";
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            const SizedBox(height: 100,),

            const Text("Welcome to Firebase",
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold,
              color: Colors.black
            ),),

            const Text("firebase this is controller ",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black
              ),),

            const SizedBox(height: 50,),

            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15),
              child: Image.network("https://i.ytimg.com/vi/eP0X167TE2Y/hqdefault.jpg"),
            ),

            const SizedBox(height: 50,),

            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                height: 300,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(16),
                      topLeft: Radius.circular(16)),
                  boxShadow: [BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    spreadRadius: 2
                  )]
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 50,),

                    const Text("Dasturlash - kelajak kasbidir",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        fontWeight: FontWeight.bold
                      ),),
                    const SizedBox(height: 15,),
                    const Text("Programming is the profession of the future",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                      ),),

                    const SizedBox(height: 50,),

                    Container(
                      height: 50,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(16),
                              topLeft: Radius.circular(16)),
                          boxShadow: [BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5,
                              spreadRadius: 2
                          )]
                      ),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white, // background
                            onPrimary: Colors.black, // foreground
                          ),
                          onPressed: (){
                            Navigator.pushReplacementNamed(context, LoginScreen.id);
                          },
                          child: const Text("Get Started",
                          style: TextStyle(fontSize: 20),)),
                    ),
                  ],
                ),
              ),
            )
        ],),
      ),
    );
  }
}

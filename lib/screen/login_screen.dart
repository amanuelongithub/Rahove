import 'package:flutter/material.dart';
import 'package:rahove/screen/home_screen.dart';
import 'package:rahove/screen/main_screen.dart';
import 'package:rahove/utils/colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../commponents/custom_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
        borderSide: Divider.createBorderSide(context),
        borderRadius: BorderRadius.circular(10));
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 80),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(children: [
                  Text(
                    "Get started",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                      color: maincolor,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "become a member of our platform",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: black,
                    ),
                  ),
                ]),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Emile",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Color.fromARGB(190, 0, 0, 0)),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        filled: true,
                        border: inputBorder,
                        enabledBorder: inputBorder,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Password",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Color.fromARGB(190, 0, 0, 0)),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        filled: true,
                        border: inputBorder,
                        enabledBorder: inputBorder,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, left: 8.0),
                      child: Text(
                        "Forget password?",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 17,
                            color: Color.fromARGB(255, 165, 165, 165)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 60,
              ),
              CustomButton(
                text: "Login",
                press: () {
                  Get.to(() => MainScreen());
                },
              ),
              SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    Flexible(
                      child: Container(
                        color: Colors.grey,
                        height: 1,
                      ),
                      flex: 1,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Log in with ",
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                          fontSize: 17),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: Container(
                        color: Colors.grey,
                        height: 1,
                      ),
                      flex: 1,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(
                      "assets/img/google.svg",
                      width: 40,
                      height: 40,
                    ),
                    SvgPicture.asset(
                      "assets/img/fb.svg",
                      width: 40,
                      height: 40,
                    ),
                    SvgPicture.asset(
                      "assets/img/apple.svg",
                      width: 40,
                      height: 40,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 60,
              ),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: "Don't have account?",
                      style: TextStyle(
                          color: black,
                          fontSize: 17,
                          fontWeight: FontWeight.w400)),
                  TextSpan(
                      text: " Sign up",
                      style: TextStyle(
                          color: maincolor,
                          fontSize: 17,
                          fontWeight: FontWeight.w700))
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}

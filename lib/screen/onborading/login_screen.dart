

import 'package:clickaeventpr/screen/onborading/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../main manu/home.dart';
import 'auth_service.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: [
        SvgPicture.asset(
          'assets/images/balloonebackground.svg',
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
        SingleChildScrollView(
          child: SizedBox(
            height: screenSize.height,
            width: screenSize.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                const SafeArea(
                  child: Text(
                    "Get Started With",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 36),
                  ),
                ),
                const Text(
                  "Click a Event",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 22),
                ),
                const SizedBox(height: 35),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: email,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter email";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.email_outlined),
                            hintText: "Enter your email",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.all(
                                Radius.circular(0),
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          controller: password,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter email";
                            }
                            return null;
                          },
                          obscureText: isVisible,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.lock_open),
                              hintText: "Enter your password",
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(0),
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    gradient: const LinearGradient(
                        colors: [Color(0xFFFF1000), Color(0xFFFF1000)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter),
                  ),
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      AuthService auth = AuthService();
                      String flag = await auth.loginUser(
                          email.text.trim(), password.text.trim());
                      if (flag == "true") {
                        Get.offAll(const Home());
                      } else {
                        Get.snackbar("Something went wrong", flag,
                            duration: const Duration(seconds: 3));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        elevation: 5,
                        minimumSize: Size(
                          screenSize.width * 0.8,
                          screenSize.height * 0.07,
                        ),
                        textStyle: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600)),
                    icon: Icon(
                      Icons.login,
                      size: screenSize.width * 0.08,
                    ),
                    label: const Text("Login"),
                  ),
                ),
                const SizedBox(height: 15),
                TextButton(
                  onPressed: resetPassword,
                  style: TextButton.styleFrom(foregroundColor: Colors.black),
                  child: const Text("Forget Password?",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 18)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Did not registered yet?",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(const RegisterScreen());
                      },
                      style: TextButton.styleFrom(foregroundColor: Colors.red),
                      child: const Text(
                        "Register",
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 18),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }

  void resetPassword() {
    var screenSize = MediaQuery.of(context).size;
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (context) {
        return Stack(
          children: [
            SvgPicture.asset(
              'assets/images/balloonebackground.svg',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 60.0, horizontal: 9),
              child: Column(
                children: [
                  const SizedBox(height: 200),
                  const Text(
                    "Your Email Address",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 28),
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                    controller: email,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined),
                        hintText: "Enter your email",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.all(
                            Radius.circular(0),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                        gradient: const LinearGradient(
                            colors: [Color(0xFFFF1000), Color(0xFFFF1000)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        AuthService auth = AuthService();
                        String flag =
                            await auth.resetPassword(email.text.trim());
                        if (flag == "true") {
                          Get.snackbar("Dear user",
                              "An password reset link is sent to ${email.text}",
                              duration: const Duration(seconds: 5));
                        } else {
                          Get.snackbar("Something went wrong!", flag,
                              duration: const Duration(seconds: 5));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          minimumSize: Size(
                              screenSize.width * .8, screenSize.height * .08)),
                      icon: const Icon(Icons.send),
                      label: const Text("Sent"),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

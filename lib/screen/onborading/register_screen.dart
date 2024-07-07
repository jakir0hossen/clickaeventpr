
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'auth_service.dart';
import 'complete_profile_screen.dart';
import 'login_screen.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final nameRegex = RegExp(r'^[a-zA-Z\.]+( [a-zA-Z]+)?( [a-zA-Z]+)?$');
  final emailRegex =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z]+\.[a-zA-Z]{2,}(\.[a-zA-Z]{2,})?$');
  final passRegex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{6,}$');

  bool isVisible = true;

  void createNewUser() async {
    if (_formKey.currentState!.validate()) {
      AuthService auth = AuthService();
      final flag = await auth.createUser(
          userEmail.text.trim(), userPassword.text.trim());
      if (flag.contains("true")) {
        //"true ${userCredential.user!.uid}";
        Get.snackbar(
          "Hi ${firstName.text}",
          "A verification message sent to your email ${userEmail.text}",
          duration: const Duration(seconds: 10),
        );
        Get.to(const CompleteProfileScreen(), arguments: {
          "uid": flag.substring(
            5,
          ),
          "name": '${firstName.text} ${lastName.text}'
        });
      } else {
        Get.snackbar(
          "An error occurs",
          flag,
          duration: const Duration(seconds: 5),
        );
      }
    }
  }

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
                children: [
                  const SizedBox(height: 80),
                  const SafeArea(
                    child: Text(
                      "Join With Us",
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
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: firstName,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter first name";
                              } else if (!nameRegex.hasMatch(value)) {
                                return "Invalid name format. Only contains alphabet & whitespace";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.perm_identity),
                              hintText: "Enter First Name",
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
                          const SizedBox(height: 12),
                          TextFormField(
                            controller: lastName,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Invalid name format. Only contains alphabet & whitespace";
                              } else if (!nameRegex.hasMatch(value)) {
                                return "Invalid name format. Only contains alphabet & whitespace";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.perm_identity),
                              hintText: "Enter Last Name",
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
                          const SizedBox(height: 12),
                          TextFormField(
                            controller: userEmail,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter your email please";
                              } else if (!emailRegex.hasMatch(value)) {
                                return "Invalid email. Please try to provide a valid email";
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
                          const SizedBox(height: 12),
                          TextFormField(
                            controller: userPassword,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter your password please";
                              } else if (!passRegex.hasMatch(value)) {
                                return "Password must contains at lease one uppercase, one lowercase,\n one digit, one special character with length 6 or more";
                              }
                              return null;
                            },
                            obscureText: isVisible,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.lock_open),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isVisible = !isVisible;
                                  });
                                },
                                icon: Icon(isVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              ),
                              hintText: "Enter your password",
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(0),
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            controller: confirmPassword,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter your password please";
                              } else if (confirmPassword.text.trim() !=
                                  userPassword.text.trim()) {
                                return "Password not matched";
                              }
                              return null;
                            },
                            obscureText: isVisible,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.lock_open),
                              hintText: "Re - enter your password",
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
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                        gradient: const LinearGradient(
                            colors: [Color(0xFFFF1000), Color(0xFFFF1000)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                    child: ElevatedButton(
                      onPressed: createNewUser,
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
                              fontSize: 24, fontWeight: FontWeight.w700)),
                      child: const Text("Register"),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.to(const LoginScreen());
                        },
                        style:
                            TextButton.styleFrom(foregroundColor: Colors.red),
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 18),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:intl/intl.dart';

import 'auth_service.dart';
import 'login_screen.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({Key? key}) : super(key: key);

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {

  TextEditingController age = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController height = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final weightRegex = RegExp(r'^(\d{1,3}\.?\d{1,2}?)$');
  dynamic userInfo = Get.arguments;


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
            child: Column(
              children: [
                const SizedBox(height: 225),
                const Text(
                  "Let's complete your profile",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                ),
                const SizedBox(height: 5),
                const Text(
                  "It will help us to known more about you.",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: TextFormField(
                                controller: age,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter age";
                                  } else if (!weightRegex.hasMatch(value)) {
                                    return "Invalid Format";
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.numbers),
                                  hintText: "Your age",
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
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                height: screenSize.width * .16,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(0),
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFF1543C9),
                                      Color(0xFF1543C9)
                                    ],
                                  ),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Year",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: TextFormField(
                                controller: weight,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter weight";
                                  } else if (!weightRegex.hasMatch(value)) {
                                    return "Invalid Format";
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.monitor_weight),
                                  hintText: "Your weight",
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
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                height: screenSize.width * .16,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(0),
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFF1543C9),
                                      Color(0xFF1543C9)
                                    ],
                                  ),
                                ),
                                child: const Center(
                                  child: Text(
                                    "KG",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: TextFormField(
                                controller: height,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter height";
                                  } else if (!weightRegex.hasMatch(value)) {
                                    return "Invalid Format";
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.height),
                                  hintText: "Your height",
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
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Expanded(
                                flex: 1,
                                child: Container(
                                  height: screenSize.width * .16,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0),
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0xFF1543C9),
                                        Color(0xFF1543C9)
                                      ],
                                    ),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "CM",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton.icon(
                  onPressed: () async {
                    final db = AuthService();
                    if (formKey.currentState!.validate()) {
                      // userInfo["gender"] = selectedGender;
                      userInfo["height"] = age.text.trim();
                      userInfo["height"] = height.text.trim();
                      userInfo["weight"] = weight.text.trim();
                      await db.storeUserInfo(userInfo);
                      Get.offAll(const LoginScreen());
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      backgroundColor: Colors.red,
                      elevation: 5,
                      minimumSize: Size(
                        screenSize.width * 0.8,
                        screenSize.height * 0.08,
                      ),
                      textStyle: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.w600)),
                  icon: Icon(
                    Icons.navigate_next,
                    size: screenSize.width * 0.08,
                  ),
                  label: const Text("Next"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

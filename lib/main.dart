
import 'package:clickaeventpr/screen/main%20manu/calander.dart';
import 'package:clickaeventpr/screen/main%20manu/home.dart';
import 'package:clickaeventpr/screen/main%20manu/sub%20manu/share.dart';
import 'package:clickaeventpr/screen/onborading/complete_profile_screen.dart';
import 'package:clickaeventpr/screen/onborading/login_screen.dart';
import 'package:clickaeventpr/screen/onborading/register_screen.dart';
import 'package:clickaeventpr/screen/onborading/splash_screen.dart';
import 'package:clickaeventpr/screen/profile/ProfilePage.dart';
import 'package:firebase_core/firebase_core.dart';




import 'package:flutter/material.dart';

import 'Setting/settings.dart';
import 'firebase_options.dart';

import 'navbar.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       title: "Click A Event",
       initialRoute :'/Homepage',
       routes:{

         '/splashScreen':(context)=> const SplashScreen(),
         '/login':(context)=> const LoginScreen(),
         '/SignUpPage':(context)=> const RegisterScreen(),
         '/emailVerification':(context)=> const CompleteProfileScreen(),
         '/profilePage':(context)=> ProfilePage(),
         '/Navbar':(context)=> const Navbar(),
         '/Calendar':(context)=> Calendar(),
         '/share':(context)=> const Share(),
         '/settings':(context)=> const Settings(),
         '/Homepage':(context)=> const Home(),

       }

    );
  }
}

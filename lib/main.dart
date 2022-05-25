import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/responsive/mobile_screen_layout.dart';
import 'package:instagram_flutter/responsive/web_screen_layout.dart';
import 'package:instagram_flutter/screens/login_screen.dart';
import 'package:instagram_flutter/utils/colors.dart';
import 'responsive/responcive_layout_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDM23CzRb8_YTslGTa-eMWyJYWvNQQJPYo",
            appId: "1:14570348753:web:0ca05be3378034c6d665f0",
            messagingSenderId: "14570348753",
            projectId: "instagram-clone-f729b",
            storageBucket: "instagram-clone-f729b.appspot.com",),
            );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Instagram Clone',
        theme: ThemeData.dark()
            .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
        home:
        LoginScreen(),
        //  Scaffold(
        //   appBar: AppBar(),
        //   body: const ResponsiveLayout(
        //       webScreenLayout: WebScreenLayout(),
        //       mobileScreenLayout: MobileScreenLayout()),
        // )
        
        );
  }
}

import 'package:code/responsive/mobile_screen_layout.dart';
import 'package:code/responsive/responsive_screen_layout.dart';
import 'package:code/responsive/web_screen_layout.dart';
import 'package:code/screen/login_UI.dart';
import 'package:code/screen/signup_UI.dart';
import 'package:code/screen/welcome_UI.dart';
import 'package:code/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
      apiKey: 'AIzaSyCNyaRdNsIF-XDtH6jODG4i8NhfPNFXtOQ',
      appId: '1:959952857527:web:84dc67cf526dfaaaa42032',
      messagingSenderId: '959952857527',
      projectId: 'link-14908',
      storageBucket: 'link-14908.appspot.com',
      authDomain: 'link-14908.firebaseapp.com',
    ));
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
      debugShowCheckedModeBanner: false,
      title: 'Link',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      // home: LoginScreen(),
      // home: const ResponsiveLayout(
      //   mobileScreenLayout: MobileScreenLayout(),
      //   webScreenLayout: WebScreenLayout(),
      // ),

      // persisitng Auth
      home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return const WelcomeScreen();
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('${snapshot.error}'),
                );
              }
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return const LoginScreen();
          })),
    );
  }
}

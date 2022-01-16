+import 'package:code/backend/auth_methods.dart';
import 'package:code/screen/sample_screen.dart';
import 'package:code/screen/signup_UI.dart';
import 'package:code/utils/colors.dart';
import 'package:code/utils/utils.dart';
import 'package:code/widgets/text_field.dart';
import 'package:flutter/material.dart';
import '../responsive/mobile_screen_layout.dart';
import '../responsive/responsive_screen_layout.dart';
import '../responsive/web_screen_layout.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: mobileBackgroundColor,
          title: Image.asset('assets/Link_logo.png', height: 100, width: 100),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications_none),
              onPressed: () {},
            ),
            TextButton(
                onPressed: () {},
                child: const Text('Log Out',
                    style: TextStyle(color: buttonColor))),
          ],
        ),
        body: Container(
            child: Column(
          children: <Widget>[
            const Text('Hello, '),
            const SizedBox(height: 30),
            const Text('There is nothing here'),
            Row(
              children: [
                ElevatedButton(
                    onPressed: () {}, child: const Text('Create a Team')),
                const SizedBox(width: 30),
                ElevatedButton(
                    onPressed: () {}, child: const Text('Join a Team'))
              ],
            )
          ],
        )),
      );
}
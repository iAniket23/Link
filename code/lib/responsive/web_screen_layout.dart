import 'package:code/providers/user_provider.dart';
import 'package:code/screen/login_UI.dart';
import 'package:code/utils/colors.dart';
import 'package:code/widgets/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:code/backend/models/user.dart' as model;
import 'package:provider/provider.dart';

class WebScreenLayout extends StatefulWidget {
  const WebScreenLayout({Key? key}) : super(key: key);

  @override
  _WebScreenLayoutState createState() => _WebScreenLayoutState();
}

class _WebScreenLayoutState extends State<WebScreenLayout> {
  // void logout() {
  //   final FirebaseAuth _auth = FirebaseAuth.instance;
  //   _auth.signOut();
  //   Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (context) => const LoginScreen(),
  //     ),
  //   );
  // }

  // void _showMaterialDialog() {
  //   showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           title: const Text('Join Team'),
  //           content: const Text('Team'),
  //           actions: <Widget>[
  //             TextButton(
  //                 onPressed: () {
  //                   _dismissDialog();
  //                 },
  //                 child: const Text('Close')),
  //             TextButton(
  //               onPressed: () {
  //                 _dismissDialog();
  //               },
  //               child: const Text('Join!'),
  //             )
  //           ],
  //         );
  //       });
  // }

  // void _dismissDialog() {
  //   Navigator.pop(context);
  // }

  @override
  Widget build(BuildContext context) {
    // model.User user = Provider.of<UserProvider>(context).getUser;
    // String username = user.username;
    return Scaffold(
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
            
            Text("Hello"),
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
}

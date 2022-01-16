import 'package:code/providers/user_provider.dart';
import 'package:code/screen/login_UI.dart';
import 'package:code/utils/colors.dart';
import 'package:code/widgets/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:code/backend/models/user.dart' as model;
import 'package:provider/provider.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  _MobileScreenLayoutState createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
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
    model.User user = Provider.of<UserProvider>(context).getUser;

    return Scaffold(
      body: Center(
        child: Text(user.username),
      ),
    );
  }
}

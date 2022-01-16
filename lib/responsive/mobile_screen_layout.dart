import 'package:code/providers/user_provider.dart';
import 'package:code/screen/login_UI.dart';
import 'package:code/utils/colors.dart';
import 'package:code/utils/global_var.dart';
import 'package:code/widgets/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:code/backend/models/user.dart' as model;
import 'package:provider/provider.dart';
import '../backend/auth_methods.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  _MobileScreenLayoutState createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  int _page = 0;
  late PageController pageController;

  void navigateTologin() {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    

    // BottomNav
    return Scaffold(
      appBar: AppBar(
          backgroundColor: mobileBackgroundColor,
          title: Image.asset('assets/Link_logo.png', height: 100, width: 110),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications_none),
              onPressed: () {},
            ),
            TextButton(
                onPressed: () async {
                await AuthMethods().signOutUser();
                navigateTologin();
              },
                child: const Text('Log Out',
                    style: TextStyle(color: Colors.white)
                    )
                  ),
          ],
        ),
      body: PageView(
        children: navItems,
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _page == 0 ? primaryColor : secondaryColor),
            
            label: 'Home',
            backgroundColor: buttonColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people,
                color: _page == 1 ? primaryColor : secondaryColor),
            label: "Teams",                                                                      
            backgroundColor: buttonColor,
          ),
        ],
        onTap: navigationTapped,
      ),
    );
  }
}
    // return Scaffold(
    //     appBar: AppBar(
    //       backgroundColor: mobileBackgroundColor,
    //       title: Image.asset('assets/Link_logo.png', height: 100, width: 110),
    //       actions: [
    //         IconButton(
    //           icon: const Icon(Icons.notifications_none),
    //           onPressed: () {},
    //         ),
    //         TextButton(
    //             onPressed: () async {
    //             await AuthMethods().signOutUser();
    //             navigateTologin();
    //           },
    //             child: const Text('Log Out',
    //                 style: TextStyle(color: Colors.white)
    //                 )
    //               ),
    //       ],
    //     ),
    //     body: Container(
    //         child: Column(
    //       children: <Widget>[
            
    //         Flexible(child: Container(), flex: 2),
    //         Text("Hello, $username!",style: const TextStyle(fontSize: 60),),
    //         const SizedBox(height: 8),
    //         const Text('There is nothing here',style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),),
    //         const SizedBox(height: 16),
    //         Flexible(child: Container(), flex: 2),
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
                
    //             ElevatedButton(
    //               style: ButtonStyle(
    //               backgroundColor: MaterialStateProperty.all(buttonColor),
    //               shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    //                RoundedRectangleBorder(
    //                   borderRadius: BorderRadius.circular(30),
    //                   side: const BorderSide(
    //                   width: 2.0,
    //                   ),
    //                 ),
    //               ),),
    //               onPressed: () {}, 
    //               child: const Text('Create a Team')),
    //             const SizedBox(width: 30),
    //             ElevatedButton(
    //               style: ButtonStyle(
    //               backgroundColor: MaterialStateProperty.all(buttonColor),
    //               shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    //                RoundedRectangleBorder(
    //                   borderRadius: BorderRadius.circular(30),
    //                   side: const BorderSide(
    //                   width: 2.0,
    //                 ),),),),
    //                 onPressed: () {}, child: const Text('Join a Team')),
                  
    //               const SizedBox(width: 30),
    //           ],
    //         ),
            
    //       ],
    //     )),
    //   );



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
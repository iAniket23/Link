import 'package:code/backend/auth_methods.dart';
import 'package:code/providers/user_provider.dart';
import 'package:code/screen/signup_UI.dart';
import 'package:code/utils/colors.dart';
import 'package:code/utils/utils.dart';
import 'package:code/backend/models/user.dart' as model;
import 'package:code/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../responsive/mobile_screen_layout.dart';
import '../responsive/responsive_screen_layout.dart';
import '../responsive/web_screen_layout.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

void joinTeam(){

}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    // model user
    model.User user = Provider.of<UserProvider>(context).getUser;
    String username = user.username;
    return Scaffold(
      body: Container(
          child: Column(
        children: <Widget>[
          Flexible(child: Container(), flex: -1),
          const SizedBox(height: 100),
          Text(
            "Hello, $username!",
            style: const TextStyle(fontSize: 60),
          ),
          const SizedBox(height: 8),
          const Text(
            'There is nothing here',
            style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 40),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(buttonColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: const BorderSide(
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                  onPressed: () async {
                    await AuthMethods().createTeam(
                    teamName: "Team1",
                  );
                  },
                  child: const Text('Create a Team')),
              const SizedBox(width: 30),
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(buttonColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: const BorderSide(
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text('Join a Team')),
              const SizedBox(width: 30),
            ],
          ),
        ],
      )),
    );
  }
}

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

class TeamScreen extends StatefulWidget {
  const TeamScreen({Key? key}) : super(key: key);

  @override
  _TeamScreenState createState() => _TeamScreenState();
}

void joinTeam() {}

class _TeamScreenState extends State<TeamScreen> {
  @override
  Widget build(BuildContext context) {
    // model user
    model.User user = Provider.of<UserProvider>(context).getUser;
    String username = user.username;
    List team = user.teamList;

    return ListView.builder(
        itemCount: team.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(team[index]),
            ),
          );
        });
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class Team {
  final String scrumMaster;
  final String uuid;
  final String teamName;
  final List allTeamTask;
  final List members;

  const Team({
    required this.teamName,
    required this.scrumMaster,
    required this.uuid,
    required this.allTeamTask,
    required this.members,
  });

  Map<String, dynamic> toJson() => {
        'teamName': teamName,
        'uuid': uuid,
        'scrumMaster': scrumMaster,
        'allTeamTask': allTeamTask,
        'members': members,
      };

  // take document snapshot and return a user model
  static Team fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Team(
      teamName: snapshot['teamName'],
      uuid: snapshot['uuid'],
      scrumMaster: snapshot['scrumMaster'],
      allTeamTask: snapshot['allTeamTask'],
      members: snapshot['members']
    );
  }
}

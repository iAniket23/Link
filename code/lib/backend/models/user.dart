class User {
  final String email;
  final String uid;
  final String username;
  final String description;

  const User({
    required this.username,
    required this.description,
    required this.email,
    required this.uid,
  });

  Map<String, dynamic> toJson() => {
        'username': username,
        'uid': uid,
        'email': email,
        'description': description,
      };
}

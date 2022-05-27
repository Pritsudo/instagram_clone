class User {
  final String email;
  final String uid;
  final String username;
  final String bio;
  final String photoUrl;
  final List followers;
  final List following;

  User({
    required this.email,
    required this.photoUrl,
    required this.uid,
    required this.username,
    required this.bio,
    required this.followers,
    required this.following,
  });

  Map<String, dynamic> toJson() => {
"username":username,
"uid":uid,
"email":email,
"photoUrl":photoUrl,
"bio":bio,
"followers":followers,
"following":following,

  };
}

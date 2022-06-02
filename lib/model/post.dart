import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String descriptiom;
  final String uid;
  final String username;
  final String postId;
  final  datePublished;
  final String postUrl;
  final String profileImage;
  final likes;

  Post({
    this.likes,
    required this.descriptiom,
    required this.uid,
    required this.username,
    required this.postId,
    required this.datePublished,
    required this.postUrl,
    required this.profileImage,
  });

  Map<String, dynamic> toJson() {
    return {
      'descriptiom': descriptiom,
      'uid': uid,
      'username': username,
      'postId': postId,
      "likes": likes,
      'datePublished': datePublished,
      'postUrl': postUrl,
      'profileImage': profileImage,
    };
  }

  static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Post(
      descriptiom: snapshot['descriptiom'],
      uid: snapshot['uid']  ,
      username: snapshot['username']  ,
      postId: snapshot['postId']  ,
      datePublished: snapshot['datePublished'] ,
      postUrl: snapshot['postUrl'],
      profileImage: snapshot['profileImage'],
      
    );
  }

  
}

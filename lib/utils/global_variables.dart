import 'package:flutter/material.dart';
import 'package:instagram_flutter/screens/feed_screen.dart';
import '../screens/add_post_screen.dart';

const webScreenSize = 600;

 List<Widget> homeScreenItems = [
  FeedScreen(),
  Text('Search'),
   AddPostScreen(),
  Text('notif'),
  Text('profile'),
];

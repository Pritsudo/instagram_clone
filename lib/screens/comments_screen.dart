import 'package:flutter/material.dart';
import 'package:instagram_flutter/utils/colors.dart';
import 'package:instagram_flutter/widgets/comment_cart.dart';

class CommentsScreen extends StatefulWidget {
  CommentsScreen({Key? key}) : super(key: key);

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: const Text('Comments'),
        centerTitle: false,
      ),
      body: CommentCard(),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: kToolbarHeight,
          margin:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          padding: const EdgeInsets.only(left: 16, right: 8),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1654720110542-dddee085756f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60'),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left:16.0 , right: 8),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Comment as username',
                      border: InputBorder.none
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: (){},
                child: Container(padding: const EdgeInsets.symmetric(vertical: 8 , horizontal: 8),
                child: const Text('Post' , style: TextStyle(
                  color: Colors.blueAccent
                ),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

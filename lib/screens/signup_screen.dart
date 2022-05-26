import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_flutter/utils/utils.dart';

import '../utils/colors.dart';
import '../widgets/text_field_input.dart';
import 'package:image_picker/image_picker.dart';

import '../resources/auth_methods.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  Uint8List? _image;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();

    super.dispose();
  }

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);

    setState(() {
      _image = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Container(),
            flex: 1,
          ),
          SvgPicture.asset('assets/ic_instagram.svg',
              color: primaryColor, height: 64),
          const SizedBox(
            height: 64,
          ),

          // circular widget to accept and show our select file

          Stack(
            children: [
         _image!=null?  CircleAvatar(
                radius: 64,
                backgroundImage: MemoryImage(_image!) )   : const CircleAvatar(
                radius: 64,
                backgroundImage: NetworkImage(
                    'https://cdn5.vectorstock.com/i/thumb-large/13/04/male-profile-picture-vector-2041304.jpg'),
              ),
              Positioned(
                bottom: -10,
                right: 2,
                child: IconButton(
                  onPressed: selectImage,
                  icon: const Icon(
                    Icons.add_a_photo,
                  ),
                ),
              )
            ],
          ),

          const SizedBox(
            height: 10,
          ),

          TextFieldInput(
              textEditingController: _usernameController,
              hintText: 'Enter your username',
              textInputType: TextInputType.text),
          const SizedBox(
            height: 10,
          ),
          TextFieldInput(
              textEditingController: _emailController,
              hintText: 'Enter your email',
              textInputType: TextInputType.emailAddress),
          const SizedBox(
            height: 10,
          ),
          TextFieldInput(
              isPass: true,
              textEditingController: _passwordController,
              hintText: 'Enter your passsword',
              textInputType: TextInputType.text),
          const SizedBox(
            height: 10,
          ),
          TextFieldInput(
              textEditingController: _bioController,
              hintText: 'Enter your bio',
              textInputType: TextInputType.text),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () async {
              String res = await AuthMethod().signUpUser(
                  email: _emailController.text,
                  password: _passwordController.text,
                  username: _usernameController.text,
                  bio: _bioController.text,
                  file: _image!,
                  );
              print(res);
            },
            child: Container(
              child: const Text('Login'),
              width: double.infinity,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: const ShapeDecoration(
                color: blueColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4))),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Flexible(
            child: Container(),
            flex: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: const Text("Don't have an account?"),
                padding: const EdgeInsets.symmetric(vertical: 8),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  child: const Text(
                    "Sign up",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                ),
              ),
            ],
          )
        ],
      ),
    )));
  }
}

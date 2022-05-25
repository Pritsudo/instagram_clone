import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_flutter/utils/colors.dart';
import 'package:instagram_flutter/widgets/text_field_input.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
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
            height: 20,
          ),
          InkWell(
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
         const SizedBox(height: 10,),

         Flexible(
            child: Container(),
            flex: 1,
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Container(
             child:const Text("Don't have an account?"),
             padding: const EdgeInsets.symmetric(vertical: 8),
           ),
           
           GestureDetector(
             onTap: (){},
             child: Container(
               child:const Text("Sign up" , style: TextStyle(
                 fontWeight: FontWeight.bold
               ),),
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

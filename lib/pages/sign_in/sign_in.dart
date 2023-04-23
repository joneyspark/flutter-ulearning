import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/pages/sign_in/widgets/sign_in_widget.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBar(),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildThirdPathLogin(context),
                Center(child: reusbleText(String, "Or use your email to login your account")),
                Container(
                  margin: EdgeInsets.only(top: 66.h),
                  padding: EdgeInsets.only(left: 25.w, right: 25.w,),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      reusbleText(String, "Email"),
                      SizedBox(height: 5.h,),
                      buildTextField("Enter Your Email Address", "email", "user"),
                      reusbleText(String, "Password"),
                      SizedBox(height: 5.h,),
                      buildTextField("Enter Your Password Here", "password", "lock"),
                    ],
                  ),
                ),
                forgetPasswordText("Forgot password?"),
                buildLoginAndRegButton("Login", "login"),
                buildLoginAndRegButton("Register", "registration"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

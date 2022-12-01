import 'package:store_app/constants.dart';
import 'package:store_app/ui/user/sign_up/sign_up_screen.dart';
import 'package:store_app/ui/widgets/build_app_bar.dart';
import 'package:store_app/ui/widgets/sign_in_form.dart';
import 'package:store_app/ui/widgets/social_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';


class SignInScreen extends StatelessWidget {
  static String routeName = "/SignInScreen";
  const SignInScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(text: "Sign In"),
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 3.h,),
              Text("Welcome Back",style: kHeadingStyle,),
              SizedBox(height: 1.h,),
              Text("Sign in with email and password "
                  "\n or continue with social media account",
                style: kUnderHeadingStyle,textAlign: TextAlign.center,),
              SizedBox(height: 10.h,),
              SignInForm(),
              SizedBox(height: 5.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialCard(
                    svgImg:"assets/icons/google-icon.svg",
                  ),
                  SocialCard(
                   svgImg: "assets/icons/facebook-2.svg",
                  ),
                  SocialCard(
                    svgImg:"assets/icons/twitter.svg",
                  ),
                ],
              ),
              SizedBox(height: 2.h,),
             Padding(
               padding:EdgeInsets.symmetric(horizontal: 22.w),
               child: Row(
                  children: [
                    Text("Don't have an account? ",
                        style: TextStyle(color:kSecondaryColor,fontSize: 11.sp)),
                    GestureDetector(
                      onTap: ()=> Navigator.pushNamed(context, SignUpScreen.routeName),
                      child: Text("Sign Up",
                          style: TextStyle(color: kPrimaryColor,fontSize: 11.5.sp)),
                    )
                  ]
                ),
             ),
            ],
          ),
        ),
      ),
    );
  }
}








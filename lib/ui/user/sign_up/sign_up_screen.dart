import 'package:store_app/ui/user/sign_in/sign_in_screen.dart';
import 'package:store_app/ui/widgets/build_app_bar.dart';
import 'package:store_app/ui/widgets/sign_up_form.dart';
import 'package:store_app/ui/widgets/social_card.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../constants.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/SignUpScreen";

  SignUpScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          buildAppBar(text: "Sign Up", onPressed: () => Navigator.pop(context)),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: ListView(
          children: [
            SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(height: 6.h,),
                    Text("Register Account", style: kHeadingStyle,),
                    SizedBox(height: 1.5.h,),
                    Text("Complete your details or continue withe Social Media",
                      style: kUnderHeadingStyle, textAlign: TextAlign.center,),
                    SizedBox(height: 5.h,),
                    SignUpForm(),
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
                      padding:EdgeInsets.symmetric(horizontal: 19.w),
                      child: Row(
                          children: [
                            Text("Do you have an account? ",
                                style: TextStyle(color:kSecondaryColor,fontSize: 11.sp)),
                            GestureDetector(
                              onTap: ()=> Navigator.pushNamed(context, SignInScreen.routeName),
                              child: Text("Sign in",
                                  style: TextStyle(color: kPrimaryColor,fontSize: 11.5.sp)),
                            )
                          ]
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}



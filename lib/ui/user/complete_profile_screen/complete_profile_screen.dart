import 'package:store_app/constants.dart';
import 'package:store_app/ui/widgets/build_app_bar.dart';
import 'package:store_app/ui/widgets/build_text_form_field.dart';
import 'package:store_app/ui/widgets/complete_profile_form.dart';
import 'package:store_app/ui/widgets/defult_button.dart';
import 'package:store_app/ui/widgets/form_error.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class CompleteProfileScreen extends StatelessWidget {

  static String routeName= "/CompleteProfileScreen";
  const CompleteProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(text: "Sign Up",
          onPressed: ()=>Navigator.pop(context)),
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 5.w),
        child: Column(
          children: [
            SizedBox(height: 3.h,),
            Text("Complete Profile Screen",style: kHeadingStyle,),
            SizedBox(height: 1.h,),
            Text("Complete your details or continue \n with social media",
              style: kUnderHeadingStyle,textAlign: TextAlign.center,),
            SizedBox(height: 5.h,),
            Expanded(
              child: Container(
                width: double.infinity,
                child: ListView(
                  children: [
                    SizedBox(height: 5.h,),
                    CompleteProfileForm(),
                    SizedBox(height: 4.h,),
                    Text("By continuing you confirm that you"
                        " agree with our Terms And Conditions",
                        style: TextStyle(fontSize: 11.sp,fontWeight: FontWeight.w400,),
                        textAlign: TextAlign.center),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}



import 'package:store_app/constants.dart';
import 'package:store_app/ui/widgets/build_app_bar.dart';
import 'package:store_app/ui/widgets/build_text_form_field.dart';
import 'package:store_app/ui/widgets/defult_button.dart';
import 'package:store_app/ui/widgets/form_error.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class ForgotPasswordScreen extends StatefulWidget {
  static String routeName = "/ForgotPassword";
  const ForgotPasswordScreen({Key key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
 final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(text: "Forgot Password",onPressed: ()=>Navigator.pop(context)),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: 4.h,left: 5.w,right: 5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Forgot Password",style: TextStyle(
                color: Colors.black,fontSize: 18.sp,fontWeight: FontWeight.w700
            )),
            SizedBox(height: 1.h,),
            Text( "Please enter your email and we will send \n"
                "you a link to return to your account ",style: TextStyle(
                fontSize: 10.sp,fontWeight: FontWeight.w400,color: kSecondaryColor
            ),textAlign: TextAlign.center,),
            SizedBox(height: 20.h,),
            Form(
              key: _formKey,
              child: BuildTextFormField(
                hintText: "Enter Your Name",
                svgImg: "assets/icons/Mail.svg",
                label: "Email",
                onChanged: (val){
                  if(val.isNotEmpty && errors.contains(kEmailNullError)){
                    setState((){
                      errors.remove(kEmailNullError);
                    });
                  }else if( emailValidatorExp.hasMatch(val)
                      &&  errors.contains(kInvalidEmailError)){
                    setState((){
                      errors.remove(kInvalidEmailError);
                    });
                  }
                },
                validator: (val) {
                  if(val.isEmpty && !errors.contains(kEmailNullError)){
                    setState((){
                      errors.add(kEmailNullError);
                    });
                  }else if(!emailValidatorExp.hasMatch(val)
                      && !errors.contains(kInvalidEmailError)){
                    setState((){
                      errors.add(kInvalidEmailError);
                    });
                  }
                },
              ),
            ),
            SizedBox(height: 4.h,),
            FormError(error: errors,),
            SizedBox(height: 5.h,),
            DefaultButton(
              onPressed: (){
                if(_formKey.currentState.validate()){
                  _formKey.currentState.save();
                }
              },
            ),
            SizedBox(height: 15.h,),
            RichText(text: TextSpan(
                children: [
                  TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyle(color:kSecondaryColor,fontSize: 11.sp
                      )
                  ),
                  TextSpan(
                      text: "Sign Up",style: TextStyle(color: kPrimaryColor,fontSize: 11.5.sp)
                  )
                ]
            )),
        ],),
      ),
    );
  }
}

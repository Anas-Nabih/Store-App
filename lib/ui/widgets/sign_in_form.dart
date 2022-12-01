import 'package:store_app/ui/home_screen/home_screen.dart';
import 'package:store_app/ui/mainScreen/main_screen.dart';
import 'package:store_app/ui/user/forgot_password/forgot_passwoed_screen.dart';
import 'package:store_app/ui/user/login_success/login_success.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constants.dart';
import 'build_text_form_field.dart';
import 'defult_button.dart';
import 'form_error.dart';
class SignInForm extends StatefulWidget {
SignInForm({Key key}) : super(key: key);

@override
State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String email,password;
  bool checkVal = false;
  List<String> errors = [];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Column(
          children: [
            BuildTextFormField(
              hintText: "Enter Your Email",
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
            SizedBox(height: 5.h,),
            BuildTextFormField(
              hintText: "Enter Your Password",
              svgImg: "assets/icons/Lock.svg",
              label: "Password",
              onChanged: (val) {
                if(val.isNotEmpty && errors.contains(kPassNullError)){
                  setState((){
                    errors.remove(kPassNullError);
                  });
                }else if(val.length >= 8
                    && errors.contains(kShortPassError)){
                  setState((){
                    errors.remove(kShortPassError);
                  });
                }
                return null;
              },
              validator: (val) {
                if(val.isEmpty && !errors.contains(kPassNullError)){
                  setState((){
                    errors.add(kPassNullError);
                  });
                }else if(val.length <8
                    && !errors.contains(kShortPassError)){
                  setState((){
                    errors.add(kShortPassError);
                  });
                }
              },
            ),
            SizedBox(height: 5.h,),
            FormError(error: errors,),
            Row(
              children: [
                Checkbox(value: checkVal, activeColor:kPrimaryColor,onChanged: (val){
                  setState(() {
                    checkVal = val;
                  });
                }),
                Text("Remember Me"),
                Spacer(),
                GestureDetector(
                  onTap: ()=>Navigator.pushNamed(context, ForgotPasswordScreen.routeName),
                  child: Text("Forget Password",style: TextStyle(
                      fontSize: 12.sp,decoration: TextDecoration.underline
                  ),),
                )
              ],
            ),
            SizedBox(height: 1.h,),
            DefaultButton(text: "Continue",
              onPressed: (){
                if(_formKey.currentState.validate()){
                  _formKey.currentState.save();
                  Navigator.pushNamed(context, MainScreen.routeName);
                }
              },)
          ],
        ),
      ),
    );
  }
}
import 'package:store_app/ui/user/complete_profile_screen/complete_profile_screen.dart';
import 'package:store_app/ui/user/login_success/login_success.dart';
import 'package:store_app/ui/widgets/form_error.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constants.dart';
import 'build_text_form_field.dart';
import 'defult_button.dart';


class SignUpForm extends StatefulWidget {
  SignUpForm();

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
 final  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String email ,password, confirmPassword;

  List<String> errors = [];

  void addError({String error}){
    if(!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String error}){
    setState(() {
      errors.remove(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(height: 4.h,),
            BuildTextFormField(
              hintText: "Enter your email",
              label: "Email",
              svgImg: "assets/icons/Mail.svg",
              onSaved: (val)=> email = val,
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
            SizedBox(height: 4.h,),
            BuildTextFormField(
              hintText: "Enter your password",
              label: "Password",
              svgImg: "assets/icons/Lock.svg",
              onSaved: (val)=> password = val,
              obsTxt: true,
              onChanged: (val){
                if(val.isNotEmpty){
                  removeError(error: kPassNullError);
                }else if(val.length >= 8){
                  removeError(error:kShortPassError);
                }
                password = val;
                return null;
              },
              validator: (val) {
                if(val.isEmpty){
                  addError(error: kPassNullError);
                }else if(val){
                  addError(error: kShortPassError);
                }
                return null;
              },
            ),
            SizedBox(height: 4.h,),
            BuildTextFormField(
              hintText: "Re-enter your password",
              label: "confirm password",
              svgImg: "assets/icons/Lock.svg",
              onSaved: (val)=> confirmPassword = val,
              obsTxt: true,
              onChanged: (val){
                if(password == confirmPassword){
                  removeError(error: kMatchPassError);
                }else if(val.length >= 8){
                  removeError(error:kShortPassError);
                }
                return null;
              },
              validator: (val) {
                if(val.isEmpty){
                  addError(error: kMatchPassError);
                }else if(password != confirmPassword){
                  addError(error: kMatchPassError);
                }
                return null;
              },
            ),
            SizedBox(height: 1.h,),
            FormError(error: errors,),
            SizedBox(height: 1.h,),
            DefaultButton(text: "Continue",
              onPressed: (){
                if(_formKey.currentState.validate()){
                  _formKey.currentState.save();
                  Navigator.pushNamed(context, CompleteProfileScreen.routeName);
                }
              },)
          ],
        ));
  }
}
import 'package:store_app/ui/user/otp_screen/opt_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:store_app/constants.dart';
import 'build_text_form_field.dart';
import 'defult_button.dart';
import 'form_error.dart';


class CompleteProfileForm extends StatefulWidget {
  CompleteProfileForm({
    Key key,
  }) : super(key: key);

  @override
  State<CompleteProfileForm> createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  String firstName, lastName,address,phoneNum;


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<String> errors = [];

  addError({String error}){
    if(!errors.contains(error)) {
      setState(()=> errors.add(error));
    }
  }

  removeError({String error}){
    if(errors.contains(error)) {
      setState(()=> errors.remove(error));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          BuildTextFormField(
            label: "First Name",
            hintText: "Enter your first name",
            svgImg: "assets/icons/User.svg",
            onSaved: (val)=> firstName = val,
            onChanged: (val){
              if(val.isNotEmpty){
                removeError(error: kNameNullError);
                // return "";
              }
              // return null;
            },
            validator: (val) {
              if(val.isEmpty){
                addError(error: kNameNullError);
                // return "";
              }
              return null;
            },
          ),
          SizedBox(height: 3.h,),
          BuildTextFormField(
            label: "Last Name",
            hintText: "Enter your last name",
            svgImg: "assets/icons/User.svg",
            onSaved: (val)=> lastName = val,
            onChanged: (val){
              if(val.isNotEmpty){
                removeError(error: kNameNullError);
              }
              return null;
            },
            validator: (val) {
              if(val.isEmpty){
                addError(error: kNameNullError);
              }
              return null;
            },
          ),
          SizedBox(height: 3.h,),
          BuildTextFormField(
            label: "Phone Number",
            hintText: "Enter your phone number",
            svgImg: "assets/icons/Phone.svg",
            onSaved: (val)=> phoneNum = val,
            onChanged: (val){
              if(val.isNotEmpty){
                removeError(error: kPhoneNumberNullError);

              }
              return null;
            },
            validator: (val) {
              if(val.isEmpty){
                addError(error: kPhoneNumberNullError);
              }
              return null;
            },
          ),
          SizedBox(height: 3.h,),
          BuildTextFormField(
            label: "Address",
            hintText: "Enter your address",
            svgImg: "assets/icons/Location point.svg",
            onSaved: (val)=> address = val,
            onChanged: (val){
              if(val.isNotEmpty){
                removeError(error: kAddressNullError);
                return "";
              }
              return null;
            },
            validator: (val) {
              if(val.isEmpty){
                addError(error: kAddressNullError);
              }
              return null;
            },
          ),
          SizedBox(height: 2.h,),
          FormError(error: errors,),
          SizedBox(height: 2.h,),
          DefaultButton(
            onPressed: (){
              if(_formKey.currentState.validate()){
                _formKey.currentState.save();
                print("Fist name: $firstName last Name: $lastName "
                    "Address: $address Phone: $phoneNum");
                Navigator.pushNamed(context, OPTScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }
}
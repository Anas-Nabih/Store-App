import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

const kPrimaryColor = Color(0xFFFF7643);

const kLightPrimaryColor = Color(0xFFFFECDF);

const kPrimaryLightColor = Color(0xFFFFECDF);

const kWhite = Color(0xFFFFFFFF);

const kPrimaryGradient = LinearGradient(
  begin: Alignment.topLeft,end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E),Color(0xFFFF7643)]
);

const kSecondaryColor = Color(0xFF979797);

const kTextColor = Color(0xFF757575);

const kAnimatedDuration = Duration(milliseconds: 200);


//Styles

 TextStyle kHeadingStyle = TextStyle(
    color: Colors.black,fontSize: 18.sp,fontWeight: FontWeight.w700
);

 TextStyle kUnderHeadingStyle = TextStyle(
   fontSize: 10.sp,fontWeight: FontWeight.w400,
 );

//Form Error
final RegExp emailValidatorExp = 
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

const String kEmailNullError = "Please Enter Your Email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter Your Password";
const String kShortPassError = "Please is too Short";
const String kMatchPassError = "Password don't match";
const String kNameNullError = "Please Enter Your Name";
const String kPhoneNumberNullError = "Please Enter Your Phone Number";
const String kAddressNullError = "Password Enter Your Address";

final kOTPInputDecoration = InputDecoration(
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder(){
  return OutlineInputBorder(
    borderSide: BorderSide(color:kTextColor),
    borderRadius: BorderRadius.circular(12)
  );
}

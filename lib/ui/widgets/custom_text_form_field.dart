import 'package:flutter/material.dart';
import 'package:store_app/constants.dart';
import 'package:sizer/sizer.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
   this.hintText,
    this.inputType,this.onChanged
  });

  final TextInputType inputType;
  final String hintText;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.5.h),
      child: TextField(
        onChanged: onChanged,
        keyboardType: inputType,
        decoration:InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: kSecondaryColor)
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: kSecondaryColor)
          ),
        ),
      ),
    );
  }
}
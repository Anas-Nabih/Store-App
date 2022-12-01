
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:store_app/constants.dart';

class BuildTextFormField extends StatelessWidget {
  String hintText,svgImg,label;
  Function validator;
  bool obsTxt;
  Function onSaved;
  Function onChanged;
  BuildTextFormField({
    this.label,this.hintText,this.svgImg,
    this.onSaved,
    this.validator,this.onChanged,this.obsTxt = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onChanged: onChanged,
      onSaved: onSaved ?? (String){},
      obscureText: obsTxt,
      decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          suffixIcon: Padding(
            padding: EdgeInsets.all(4.w),
            child: SvgPicture.asset(svgImg),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.symmetric(horizontal: 8.w,),
          label: Text(label,style: TextStyle(color: kTextColor),),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: kTextColor),
              gapPadding: 10
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: kTextColor),
              gapPadding: 10
          )
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class FormError extends StatelessWidget {
  List<String> error;
   FormError({this.error});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: List.generate(error.length,
              (index) => formErrorText(error: error[index])),
    );
  }

  Row formErrorText({String error}) {
    return Row(
      children: [
        SvgPicture.asset("assets/icons/Error.svg"),
        SizedBox(width: 2.w,),
        Text(error)
      ],
    );
  }
}

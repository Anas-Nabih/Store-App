import 'package:store_app/constants.dart';
import 'package:store_app/ui/widgets/build_app_bar.dart';
import 'package:store_app/ui/widgets/opt_form.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class OPTScreen extends StatelessWidget {
  static String routeName = "/OPTScreen";
  const OPTScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(text: "OPT Verification",
          onPressed: ()=> Navigator.pop(context)),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            children: [
              SizedBox(height: 6.h,),
              Text("OPT Verification",style: kHeadingStyle,),
              SizedBox(height: 1.h,),
              Text("we sent your code to 0128980****",
                style: kUnderHeadingStyle,textAlign: TextAlign.center,),
              buildTimer(),
              SizedBox(height: 18.h,),
              OPTForm(),
              SizedBox(height: 18.h,),
              GestureDetector(
                onTap: ()=> print("Put here resend opt fun"),
                child: Text("Resend OPT",
                  style: kUnderHeadingStyle.copyWith(
                      decoration: TextDecoration.underline,fontSize: 12.sp
                  ),),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text("This code will expired in ",style: kUnderHeadingStyle,),
              TweenAnimationBuilder(
                  tween: Tween(begin:30.0,end: 0), duration: Duration(seconds: 30),
                  builder: (context, value, child) =>
                      Text("00:${value.toInt()}",style: TextStyle(
                    color: kPrimaryColor
                  ),),
              onEnd: (){},)
          ],);
  }
}



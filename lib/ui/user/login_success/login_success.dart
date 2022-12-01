import 'package:store_app/ui/widgets/build_app_bar.dart';
import 'package:store_app/ui/widgets/defult_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class LoginSuccessScreen extends StatefulWidget {
  static String routeName = "/LoginSuccess";
  const LoginSuccessScreen({Key key}) : super(key: key);

  @override
  _LoginSuccessScreenState createState() => _LoginSuccessScreenState();
}

class _LoginSuccessScreenState extends State<LoginSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(text: "Login Success",
      onPressed: ()=>Navigator.pop(context)),
      body: Padding(
        padding: EdgeInsets.only(top: 3.h),
        child: Column(
          children: [
            Image.asset("assets/images/success.png"),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Text("Login Success",style: TextStyle(
                color: Colors.black,fontSize: 17.sp,fontWeight: FontWeight.w600
              ),),
            ),
            Padding(
                padding: EdgeInsets.only(right: 25.w,left: 25.w,),
                child: DefaultButton(text: "Back To Home",))
          ],
        ),
      ),
    );
  }
}

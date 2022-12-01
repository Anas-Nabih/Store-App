import 'package:store_app/ui/mainScreen/profile_screen/profiie_provider.dart';
import 'package:store_app/ui/user/sign_in/sign_in_screen.dart';
import 'package:store_app/ui/widgets/build_app_bar.dart';
import 'package:store_app/ui/widgets/more_item.dart';
import 'package:store_app/ui/widgets/profile_picture.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';


class ProfileScreen extends StatefulWidget {
  static String routeName ="/ProfileScreen";
   ProfileScreen({Key key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
   ProfileProvider provider = ProfileProvider();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProfileProvider>(
      create: (context)=> provider,
      child: Consumer<ProfileProvider>(
        builder: (context, value, child) => Scaffold(
          appBar:buildAppBar(text: "Profile",),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 2.h,),
                ProfilePicture(),
                SizedBox(height: 4.h,),
                MoreItem(icon: "assets/icons/User.svg",title: "My Account",),
                MoreItem(icon: "assets/icons/Bell.svg",title: "Notification",),
                MoreItem(icon: "assets/icons/Settings.svg",title: "Settings",),
                MoreItem(icon: "assets/icons/Question mark.svg",title: "Help Center",),
                MoreItem(icon: "assets/icons/Log out.svg",title: "Log Out",isLogOut: true,onTapped:()=> Navigator.pushNamed(context, SignInScreen.routeName),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}





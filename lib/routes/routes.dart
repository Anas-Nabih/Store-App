import 'package:store_app/ui/cart_screen/cart_screen.dart';
import 'package:store_app/ui/edit_product/edit_product_screen.dart';
import 'package:store_app/ui/home_screen/home_screen.dart';
import 'package:store_app/ui/mainScreen/main_screen.dart';
import 'package:store_app/ui/mainScreen/profile_screen/profile_screen.dart';
import 'package:store_app/ui/product_details/product_details_screen.dart';
import 'package:store_app/ui/search_screen/search_screen.dart';
import 'package:store_app/ui/splash/splash_screen.dart';
import 'package:store_app/ui/user/complete_profile_screen/complete_profile_screen.dart';
import 'package:store_app/ui/user/forgot_password/forgot_passwoed_screen.dart';
import 'package:store_app/ui/user/login_success/login_success.dart';
import 'package:store_app/ui/user/otp_screen/opt_screen.dart';
import 'package:store_app/ui/user/sign_in/sign_in_screen.dart';
import 'package:store_app/ui/user/sign_up/sign_up_screen.dart';
import 'package:flutter/material.dart';



Map<String,WidgetBuilder> routes = {
SplashScreen.routeName : (context) => SplashScreen(),
SignInScreen.routeName : (context)=> SignInScreen(),
ForgotPasswordScreen.routeName : (context)=> ForgotPasswordScreen(),
LoginSuccessScreen.routeName :(context)=> LoginSuccessScreen(),
SignUpScreen.routeName: (context) =>SignUpScreen(),
CompleteProfileScreen.routeName: (context)=> CompleteProfileScreen(),
OPTScreen.routeName : (context)=>OPTScreen(),
HomeScreen.routeName: (context)=> HomeScreen(),
ProductDetailScreen.routeName: (context)=>ProductDetailScreen(),
CartScreen.routeName: (context)=>CartScreen(),
SearchScreen.routeName: (context)=>SearchScreen(),
ProfileScreen.routeName:(context)=>ProfileScreen(),
MainScreen.routeName: (context)=>MainScreen(),
EditProductScreen.routeName: (context)=>EditProductScreen(),
 };
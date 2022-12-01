import 'package:flutter/material.dart';
import 'components/splash_body.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/SplashScreen";

  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}






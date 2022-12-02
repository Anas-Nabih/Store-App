import 'package:store_app/constants.dart';
import 'package:store_app/routes/routes.dart';
import 'package:store_app/services/get_products.dart';
import 'package:store_app/ui/home_screen/home_screen.dart';
import 'package:store_app/ui/mainScreen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Sizer(
      builder:(context, orientation, deviceType) =>  MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: LightTheme(),
        home: HomeScreen(),
        // routes: routes,
        // initialRoute: MainScreen.routeName,
      ),
    );
  }


  ThemeData LightTheme(){
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        /*color: Colors.white,*/elevation: 0,
          actionsIconTheme: IconThemeData(color: Colors.black),
          textTheme: TextTheme(headline6: TextStyle(color: Color(0xFF8B8B8B)))
      ),
      textTheme: TextTheme(
        bodyText1: TextStyle(color: kTextColor),
        bodyText2: TextStyle(color: kTextColor),
      ),
      primarySwatch: Colors.blue,
    );
  }
}




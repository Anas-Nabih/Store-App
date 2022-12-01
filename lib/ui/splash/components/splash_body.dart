import 'package:store_app/constants.dart';
import 'package:store_app/ui/splash/components/splash_content.dart';
import 'package:store_app/ui/widgets/defult_button.dart';
import 'package:flutter/material.dart';
import 'package:store_app/ui/user/sign_in/sign_in_screen.dart';
import 'package:sizer/sizer.dart';

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  int currentIndex = 0;

  List <Map<String, String>> splashData = [
    {
      "text":"Welcome to Shop App, let's shop",
      "image":"assets/images/splash_1.png"
    }, {
      "text":"We help people conect wit store \naround United State of America",
      "image":"assets/images/splash_2.png"
    },{
      "text":"We show the easy way to shop \njust stay at home with us",
      "image":"assets/images/splash_3.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Sizer(
        builder: (context, orientation, deviceType) => SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: PageView.builder(
                  onPageChanged: (value) => setState(() {
                    currentIndex = value;
                  }),
                  itemCount: splashData.length,
                  itemBuilder: (context, index) =>
                      SplashContent(
                        text: splashData[index]["text"],
                        images: splashData[index]["image"],),),
              ),
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal:4.w ),
                    child: Column(
                      children: [
                        Spacer(flex: 1,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                              splashData.length,
                                  (index) => buildDot(index: index)),
                        ),
                        Spacer(flex: 3,),
                        DefaultButton(text:"Continue",onPressed:(){
                          Navigator.pushNamed(context, SignInScreen.routeName);
                        }),
                        Spacer(),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: kAnimatedDuration,
      margin: EdgeInsets.only(right: 1.w),
              height: 1.h,width: currentIndex == index ? 10.w:4.w,
              decoration: BoxDecoration(
                    color: currentIndex == index?kPrimaryColor:Color(0xFFD8D8d8),
                borderRadius: BorderRadius.circular(12)
              ),
            );
  }
}
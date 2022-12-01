import 'package:store_app/constants.dart';
import 'package:store_app/ui/cart_screen/cart_screen.dart';
import 'package:store_app/ui/home_screen/home_screen.dart';
import 'package:store_app/ui/mainScreen/main_provider.dart';
import 'package:store_app/ui/mainScreen/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class MainScreen extends StatefulWidget {
  static String routeName = "/MainScreen";
  MainScreen({Key key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin{
  MainProvider provider = MainProvider();

  TabController _tabController;

  final List<Widget> _pages = [
    HomeScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      provider.index = _tabController.index;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainProvider>(
      create: (context) => provider,
      child:Consumer<MainProvider>(
        builder: (context, value, child) => DefaultTabController(
          length: 3,
          initialIndex: provider.index,
          child: Scaffold(
            body: Builder(
              builder: (context) {
                switch(provider.index){
                  case 0:
                    return HomeScreen();
                    break;
                  case 1 :
                    return CartScreen();
                    break;
                  case 2 :
                    return ProfileScreen();
                    break;
                  default:
                  return null;
                }
              },
            ),
            bottomNavigationBar: Container(
              height:7.h,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: kSecondaryColor.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 8
                  )
                ],
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                ),
              ),
              child: TabBar(
                controller: _tabController,
                tabs: [
                SvgPicture.asset("assets/icons/Shop Icon.svg",color: provider.index ==0 ?kPrimaryColor: kSecondaryColor),
                SvgPicture.asset("assets/icons/Heart Icon.svg",color: provider.index ==1 ?kPrimaryColor: kSecondaryColor),
                SvgPicture.asset("assets/icons/User.svg",color: provider.index ==2 ?kPrimaryColor: kSecondaryColor),
              ],onTap: (index)=>
                provider.index = index,indicatorColor: Colors.transparent,
              ),
            ),
          ),
        ),
      ),
    );
  }
}



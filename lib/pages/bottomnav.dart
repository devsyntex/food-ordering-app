import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/pages/home.dart';
import 'package:fooddelivery/pages/profile.dart';
import 'package:fooddelivery/pages/wallet.dart';
import 'package:fooddelivery/pages/order.dart';


class Bottomnav extends StatefulWidget {
  const Bottomnav({super.key});

  @override
  State<Bottomnav> createState() => _BottomnavState();
}

class _BottomnavState extends State<Bottomnav> {
  int currentTabIndex=0;

  late List<Widget> pages;
  late Widget currentPage;
  late Home homePage;
  late Profile profile;
  late Order order;
  late Wallet wallet;
  @override
  void initState() {
    homePage=Home();
    order= Order();
    wallet=Wallet();
    profile=Profile();
    pages=[homePage,order,wallet, profile
    ];
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 65,
        backgroundColor: Colors.white,
        color: Colors.black,
        animationDuration: Duration(milliseconds: 500),
        onTap: (int index){
          setState(() {
            currentTabIndex=index;
          });
        },
        items: [
        Icon(Icons.home_outlined,
        color: Colors.white,),
        Icon(Icons.shopping_bag_outlined,
          color: Colors.white,),
        Icon(Icons.wallet_outlined,
          color: Colors.white,),
        Icon(Icons.person_outlined,
          color: Colors.white,),
      ],
      ),
      body: pages[currentTabIndex],
    );
  }
}

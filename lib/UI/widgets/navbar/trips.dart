import 'package:flutter/material.dart';
import '../../screens/Apps/apps_screens.dart';
import '../../screens/home/home_screens.dart';
import '../../screens/profile/profile_screens.dart';
import '../../screens/chat/chat_screens.dart';
import '../../screens/wallet/wallet_screens.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class AppFlutterTrips extends StatefulWidget {
  const AppFlutterTrips({super.key});
  @override
  State<AppFlutterTrips> createState() => _AppFlutterTrips();
}

class _AppFlutterTrips extends State<AppFlutterTrips> {
    int indexTap = 0;

    final List<Widget> pageindex = [
    const AppsTrips(),
    HomeTrips(),
    const ProfileTrips(),
    const ChatTrips(),
    const WalletTrips(),
  ];

    void onTapTapped(int index){

      setState(() {
        indexTap = index;
      });

    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
          body: pageindex[indexTap],
            bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(
                iconTheme: const IconThemeData(color: Colors.white)
              ),
              child: CurvedNavigationBar(
                color: Colors.grey.shade900,
                backgroundColor: Colors.transparent,
                height: 55,
                animationCurve: Curves.easeInOut,
                animationDuration: const Duration(milliseconds: 400),
                onTap: onTapTapped,
                index: indexTap,
              items: const <Widget>[
                  Icon(Icons.star, size: 30),
                  Icon(Icons.home, size: 30),
                  Icon(Icons.person, size: 30),
                  Icon(Icons.chat, size: 30),
                  Icon(Icons.wallet, size: 30),
              ],
              ),
            ),
        );
    }
}
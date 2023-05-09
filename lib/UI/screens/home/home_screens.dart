import 'package:flutter/material.dart';
import 'Home_parts/feed_home.dart';
import 'Home_parts/stories.dart';

class HomeTrips extends StatelessWidget {

  HomeTrips({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Colors.transparent,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(40.0),
              child: AppBar(
        backgroundColor: Colors.white70,
        elevation: 0,
        centerTitle: true,
        title: const Text("App",
          style: TextStyle(color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.w600,
            fontFamily: 'relay',
          ),
        ),
                leading: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.photo_camera_outlined,
                    color: Colors.black,
                    size: 28,),
                ),
        actions: <Widget>[
          IconButton(
                onPressed: () {},
                icon: const Icon(Icons.tv,
                  color: Colors.black,
                  size: 28,
                )),
          IconButton(
                onPressed: () {},
                icon: const Icon(Icons.send,
                  color: Colors.black,
                  size: 28,
                )),
        ],
      ),
            ),
            body: Column(
              children: const [
                StoriesHome(),
                SizedBox(height: 20),
                FeedHome(),
              ],
            ),
    );
  }

}

class AccountsUsersList {
  const AccountsUsersList({ required this.title , required this.icon});

  final String title;
  final IconData icon;

  @override
  String toString() => title;
}

const List<AccountsUsersList> listUser = <AccountsUsersList> [
  AccountsUsersList(title: 'maria rojas', icon: Icons.directions_car),
  AccountsUsersList(title: 'inversiones online', icon: Icons.directions_car),
  AccountsUsersList(title: 'yohanderson marquez', icon: Icons.directions_car),
];


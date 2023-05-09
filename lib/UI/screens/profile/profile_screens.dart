import 'package:flutter/material.dart';
import 'package:merkabah/UI/screens/profile/profiletab/Header/layout_select.dart';
import 'package:merkabah/UI/screens/profile/profiletab/feed_profile/dashboard.dart';
import 'package:merkabah/UI/screens/profile/profiletab/feed_profile/saved.dart';
import 'package:merkabah/UI/screens/profile/profiletab/feed_profile/view_principal.dart';

class ProfileTrips extends StatefulWidget {
  const ProfileTrips({super.key});

  @override
  State<ProfileTrips> createState() => _ProfileTrips();
}

class _ProfileTrips extends State<ProfileTrips> {
  List<Tab> tabs = [
    const Tab(
      child: Tab(
        child: Icon(
          Icons.grid_view_outlined,
          color: Colors.black,
        ),
      ),
    ),
    const Tab(
      child: Tab(
        child: Icon(
          Icons.bar_chart_outlined,
          color: Colors.black,
        ),
      ),
    ),
    const Tab(
      child: Icon(
        Icons.unarchive_outlined,
        color: Colors.black,
      ),
    ),
  ];

  List<Widget> tabsContent = [
    const ViewPrincipal(),
    const Dashboard(),
    const Saved(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        extendBody: true,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 3,
            title: Positioned(
              left: 0,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: const [
                          Text(
                            'Users',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down_outlined,
                            size: 26,
                          ),
                        ],
                      ),
                    ),
                    const Expanded(child: SizedBox())
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add_box_outlined,
                    color: Colors.black,
                    size: 28,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.black,
                    size: 28,
                  )),
            ],
          ),
        ),
        body: Column(
          children: [
            const LayoutSelect(),
            const Divider(
              color: Colors.grey,
            ),
            Expanded(
              child: DefaultTabController(
                length: 3,
                initialIndex: 0,
                child: Column(
                  children: [
                    TabBar(
                      indicatorColor: Colors.black,
                      tabs: tabs,
                    ),
                    Expanded(
                      child: TabBarView(
                        children: tabsContent,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

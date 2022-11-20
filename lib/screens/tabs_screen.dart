import 'package:flutter/material.dart';

import '../widgets/app_drawer.dart';
import './salestabs_screen.dart';
import './zreportstabs_screen.dart';

import './dashboardies_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      // initialIndex: 0,
      child: Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          title: const Text('Dirm VFD'),
          //title: Text('Receipts Statistics'),
          centerTitle: true,
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.receipt_sharp),
                text: 'Receipts',
              ),
              Tab(
                icon: Icon(Icons.report),
                text: 'Z-Reports',
              ),
              Tab(
                icon: Icon(Icons.verified_user),
                text: 'Sales',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            DashboardiesScreen(),
            ZreportsTabsScreen(),
            SalesTabsScreen(),
          ],
        ),
      ),
    );
  }
}

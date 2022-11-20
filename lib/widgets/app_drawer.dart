import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.60,
      child: Drawer(
          child: Column(
        children: [
          AppBar(
            title: Text('DirmVfdApp'),
            automaticallyImplyLeading: false,
            elevation: 0,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.dashboard),
            title: Text('Dashboard'),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.print_disabled_rounded),
            title: Text('MyVfd'),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.receipt_outlined),
            title: Text('MyReceipts'),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.supervised_user_circle),
            title: Text('MyProfile'),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {},
          ),
          Divider(),
        ],
      )),
    );
  }
}

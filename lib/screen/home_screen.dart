import 'package:flutter/material.dart';

import 'package:msg_app/pages/calls_page.dart';
import 'package:msg_app/pages/contacts_page.dart';
import 'package:msg_app/pages/messages_page.dart';
import 'package:msg_app/pages/notifications_page.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  
  final ValueNotifier<int> pageIndex = ValueNotifier(0);

  final pages = const [
    MessagesPage(),
    NotificationsPage(),
    CallsPage(),
    ContactsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: pageIndex, 
        builder: (BuildContext context, int value, _){
          return pages[value];
        }
      ),
      bottomNavigationBar: _bottomNavigation(
        onItemSelected: (index){
          pageIndex.value = index;
        },
      ),
    );
  }
}

class _bottomNavigation extends StatelessWidget {
  const _bottomNavigation({
    Key? key,
    required this.onItemSelected,
  }) : super(key: key);

  final ValueChanged<int> onItemSelected;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavigationBarItem(
            index: 0,
            icon: Icons.message,
            label: "Messages",
            onTap: onItemSelected,
          ),
          _NavigationBarItem(
            index: 1,
            icon: Icons.notifications,
            label: "Notifications",
            onTap: onItemSelected,
          ),
          _NavigationBarItem(
            index: 2,
            icon: Icons.call,
            label: "Calls",
            onTap: onItemSelected,
          ),
          _NavigationBarItem(
            index: 3,
            icon: Icons.contacts,
            label: "Contacts",
            onTap: onItemSelected,
          ),
        ],
      ),
    );
  }
} 

class _NavigationBarItem extends StatelessWidget {
  const _NavigationBarItem({
    Key? key,
    required this.index,
    required this.label,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  
  final int index;
  final String label;
  final IconData icon;
  final ValueChanged<int> onTap;

  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTap(index);
      },
      child: SizedBox(
        height: 70,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 25,),
            SizedBox(height: 8,),
            Text(label, style: const TextStyle(fontSize: 11, ),)
          ],
        ),
      ),
    );
  }
}

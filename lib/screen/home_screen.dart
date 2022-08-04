import 'package:flutter/material.dart';

import 'package:msg_app/pages/calls_page.dart';
import 'package:msg_app/pages/contacts_page.dart';
import 'package:msg_app/pages/messages_page.dart';
import 'package:msg_app/pages/notifications_page.dart';
import 'package:msg_app/theme.dart';
import 'package:msg_app/widgets/action_btn.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  
  final ValueNotifier<int> pageIndex = ValueNotifier(0);

  final pages = const [
    MessagesPage(),
    ContactsPage(),
    NotificationsPage(),
    CallsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Qube Chat"),
        actions: [
          const Padding(
            padding: EdgeInsets.only(top: 12, right: 15),
            child: Icon(Icons.search, size: 28,),
          ),
          PopupMenuButton(
            padding: const EdgeInsets.symmetric(vertical: 20),
            iconSize: 28,
            itemBuilder: (context) => const [
              PopupMenuItem(
                value: 1,
                child: Text("New group", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),)
              ),
              PopupMenuItem(
                value: 2,
                child: Text("New broadcast", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),)
              ),
              PopupMenuItem(
                value: 3,
                child: Text("Linked device", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),)
              ),
              PopupMenuItem(
                value: 4,
                child: Text("Starred message", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),)
              ),
              PopupMenuItem(
                value: 5,
                child: Text("Settings", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),)
              ),
            ]
          )
        ],
      ),
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

class _bottomNavigation extends StatefulWidget {
  const _bottomNavigation({
    Key? key,
    required this.onItemSelected,
  }) : super(key: key);

  final ValueChanged<int> onItemSelected;

  @override
  State<_bottomNavigation> createState() => _bottomNavigationState();
}

class _bottomNavigationState extends State<_bottomNavigation> {
  var selectedIndex = 0;
  void handleSelectedItem(int index){
    setState(() {
      selectedIndex = index;
    });
    widget.onItemSelected(index);
  }

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
            isSelected: (selectedIndex == 0),
            onTap: handleSelectedItem,
          ),
          _NavigationBarItem(
            index: 1,
            icon: Icons.contacts,
            label: "Contacts",
            isSelected: (selectedIndex == 3),
            onTap: handleSelectedItem,
          ),
          GlowingActionButton(
            color: AppColors.secondary, 
            icon: Icons.add, 
            onPressed: (){}
          ),
          _NavigationBarItem(
            index: 2,
            icon: Icons.notifications,
            label: "Notifications",
            isSelected: (selectedIndex == 1),
            onTap: handleSelectedItem,
          ),
          _NavigationBarItem(
            index: 3,
            icon: Icons.call,
            label: "Calls",
            isSelected: (selectedIndex == 2),
            onTap: handleSelectedItem,
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
    this.isSelected = false,
    required this.onTap,
  }) : super(key: key);

  
  final int index;
  final String label;
  final IconData icon;
  final bool isSelected;
  final ValueChanged<int> onTap;

  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: (){
        onTap(index);
      },
      child: SizedBox(
        height: 70,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 25, color: isSelected ? AppColors.secondary : null),
            const SizedBox(height: 8,),
            Text(label, style: TextStyle(fontSize: 11, color: isSelected ? AppColors.secondary : null, fontWeight: isSelected ? FontWeight.bold : null),)
          ],
        ),
      ),
    );
  }
}

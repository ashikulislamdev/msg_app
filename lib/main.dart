import 'package:flutter/material.dart';
import 'package:msg_app/screen/home_screen.dart';
import 'package:msg_app/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark(),
      themeMode: ThemeMode.dark,
      title: 'Qube Chat App',
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text('App Bar'),
        // ),
        body: HomeScreen(),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:msg_app/screen/home_screen.dart';
import 'package:msg_app/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.system,
      title: 'Qube Chat App',
      home: Scaffold(
        body: HomeScreen(),
      ),
    );
  }
}
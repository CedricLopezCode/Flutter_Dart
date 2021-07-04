import 'package:flutter/material.dart';
import 'package:aaa_memo/menu/bottom_navbar.dart';
import 'package:aaa_memo/menu/app_navbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exo Profil',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // appBar: AppNavBar(),
      body: Center(child: Text("Widget Contenu Page")),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

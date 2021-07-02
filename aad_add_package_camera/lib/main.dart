
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:aad_add_package_camera/bottom_navbar.dart';
import 'package:aad_add_package_camera/page_add_package.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ajouter package',
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
      appBar: AppBar( //Tout est optionnel  //Ordre automatique 
          title: Text("Ajouter package"),
          backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
          child: PageAddPackage(),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  
}
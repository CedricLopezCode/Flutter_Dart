
import 'package:flutter/material.dart';

import 'package:aae_routing_modal/bottom_navbar.dart';
import 'package:aae_routing_modal/page_routing_modal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Routing et Modal (Pop up)',
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
          title: Text("Routing et Modal"),
          backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
          child: PageRoutingModal(),
      ),
      bottomNavigationBar: BottomNavBar(),
      
    );
  }

  
}
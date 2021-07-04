import 'package:flutter/material.dart';
import 'package:aaa_memo/exo/exo_b_profil/profil.dart';
import 'package:aaa_memo/exo/exo_b_profil/profil_page.dart';

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
      home: MyHomePage(title: 'Exo Profil'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

 
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: PageProfil()
      ),
    );
  }
}

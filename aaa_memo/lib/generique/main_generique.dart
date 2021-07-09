import 'package:aaa_memo/cette_app/page_principale.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:aaa_memo/cette_app/bottom_navbar.dart';
import 'package:flutter/services.dart';

void main() {

  SystemChrome.setPreferredOrientations(
   [DeviceOrientation.landscapeRight]//Liste des orientations possibles
  );
 SystemChrome.setSystemUIOverlayStyle(
   SystemUiOverlayStyle(
     statusBarColor: Colors.blueAccent, // Changer la couleyr de la barre de status
     systemNavigationBarColor: Colors.red,  // Changer la couleyr de la barre de navigation
    )
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ), 
      dark: ThemeData(
        brightness: Brightness.dark,  
        primarySwatch: Colors.orange,
      ), 
      initial: AdaptiveThemeMode.light, 
      builder: (theme, darkTheme) =>  MaterialApp(
        title: 'Mémo',
        debugShowCheckedModeBanner: false,
        theme: theme,
        darkTheme: darkTheme,
        home: PagePrincipale(),
      )
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

    //Variables Contextuelles
  var hauteurAppareil = MediaQuery.of(context).size.height;
  var largeurAppareil = MediaQuery.of(context).size.height;
  var orientationAppareil = MediaQuery.of(context).orientation; // nécessite l'import service


    return Scaffold(
      extendBodyBehindAppBar: true,//pour que le body prenne aussi la place de la navbar,
      appBar: AppBar(),
      body: Center(child: Text("Widget Contenu Page")),
      bottomNavigationBar: BottomNavBar(),
    );

  }
}

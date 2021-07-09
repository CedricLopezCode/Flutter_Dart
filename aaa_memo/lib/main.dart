
import 'package:aaa_memo/cette_app/page_principale.dart';
import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/services.dart';



void main() {
 

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
/*class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mémo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PagePrincipale(),
    );
  }
}*/

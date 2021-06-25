import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basics Widgets',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BasicsPage(),
    );
  }
}

class BasicsPage extends StatelessWidget{
  @override   //TOUJOURS un overide du build !!!!
  Widget build(BuildContext context) { //Context == infos (taille, couleur, langues, etc...)
    var size = MediaQuery.of(context).size; //Récupère la taille depuis le context
    var theme = Theme.of(context).platform; //Récupère le theme depuis le context
    print("size: $size  width: ${size.width}   height: ${size.height}");
    print("theme: $theme");
    //return Container(height: 10, width: 20); //juste voir les retour dans console
    return Scaffold( //squelette donc classsiquement:
      /*appBar: ,
      body: ,
      bottomNavigationBar: ,*/
      body: Container(
        //  Taille
        height: 80, //(double) size.height == MediaQuery.of(context).size.height == tout l'écran
        width: 150, //(double) size.width == MediaQuery.of(context).size.width == tout l'écran

        //  Couleur == background
        //color: Theme.of(context).accentColor, //accentColor = primary swatch dans materialApp
        //color: Color.fromRGBO(0, 200, 0, 0.5), //Color. a différente façon de choisir la couleur
        color: Colors.green.shade600, //Colors. == les noms de couleur (shade optionnel)


        //  Margin et padding
        margin: EdgeInsets.all(50), //margin all
        //margin: EdgeInsets.zero, // On précise explicitement qu'on veut pas de margin
        //margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20), //symetrique suivant la direction //pas obliger de donner les 2
        //margin: EdgeInsets.fromLTRB(left, top, right, bottom), //On met une valeur pour chaque direction (obligé toutes)
        //margin: EdgeInsets.only(left: 10, top: 30), //On choisit chaque direction individuellement mais pas obligé toutes
        //padding: EdgeInsets.all(50), //padding all
        padding: EdgeInsets.zero, //padding all

        //  Margin et padding
      ),
    );
  }
}

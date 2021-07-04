

import 'package:aaa_memo/menu/page_menu.dart';
import 'package:flutter/material.dart';
import 'package:aaa_memo/generique/main_generique.dart';
import 'package:aaa_memo/generique/memo_dart.dart';
import 'package:aaa_memo/generique/page_generique.dart';
import 'package:aaa_memo/menu/app_navbar.dart';
import 'package:aaa_memo/menu/bottom_navbar.dart';


void main() {runApp(MyApp());}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mémo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PageSommaire(),
    );
  }
}

class PageSommaire extends StatefulWidget {
  final indexBottom;
  PageSommaire({this.indexBottom});

  @override
  PageSommaireState createState() => PageSommaireState();
}

class PageSommaireState extends State<PageSommaire> {

  int indexBottomFonction = 0;

  var listeActuelle = [];
 
  var listeDeRevision = [
    ["menu", "generique", "stateless", "stateful", "modalRouting", "package"],
    ["AppBar", "BottomNavBar",],
    ["Main", "Dynamique", "Dart"],
    ["Container", "Espaceur", "Stack", "Texte", "ListeGrille", "Icone", "Image"],
    ["Bouton", "TextField", "Checkbox", "Switch", "slider", "radio", "DateTimePicker"],
    ["SnackBar", "Alert", "Dialog", "Routing"],
    ["ImagePicker"]
  ];
  var listeDeCours = [
    ["menu", "generique", "stateless", "stateful", "modalRouting", "package"],
    ["AppBar", "BottomNavBar",],
    ["Main", "Dynamique", "Dart"],
    ["Container", "Espaceur", "Stack", "Texte", "ListeGrille", "Icone", "Image"],
    ["Bouton", "TextField", "Checkbox", "Switch", "slider", "radio", "DateTimePicker"],
    ["SnackBar", "Alert", "Dialog", "Routing"],
    ["ImagePicker"]
  ];
  var listeDeExo = [
    ["clicker", "facebook", "profil", "quizz"],
    ["AppBar", "BottomNavBar",],
    ["Main", "Dynamique", "Dart"],
    ["Container", "Espaceur", "Stack", "Texte", "ListeGrille", "Icone", "Image"],
    ["Bouton", "TextField", "Checkbox", "Switch", "slider", "radio", "DateTimePicker"],
    ["SnackBar", "Alert", "Dialog", "Routing"],
    ["ImagePicker"]
  ];
/*
  List<String> laListe = [];
  List<String> categories = ["Menu", "Generique", "Basiques", "Dynamique", "ModalRouting", "Package"];
  List<String> menus = ["AppBar", "BottomNavBar",];
  List<String> generiques = ["Main", "Dynamique", "Dart"];
  List<String> statelesss = ["Container", "Espaceur", "Stack", "Texte", "Image"];
  List<String> statefuls = ["Bouton", "TextField", "Checkbox", "Switch", "slider", "radio", "DateTimePicker"];
  List<String> modalRoutings = ["SnackBar", "Alert", "Dialog", "Routing"];
  List<String> packages = ["ImagePicker"];
*/
  


  @override
  Widget build(BuildContext context) {
    //print(widget.indexBottom);
    print(indexBottomFonction);
    return Scaffold(
      appBar: AppBar(title: Text("Sommaire"), centerTitle: true,),
      body: SingleChildScrollView(child: Center(child: bountonsListDD(),)),
      bottomNavigationBar: bottomNavBarFonction(),// BottomNavBar(),
    );
  }
  Column bountonsListDD(){
    //switch (widget.indexBottom) {
    switch (indexBottomFonction) {
      case 0:     listeActuelle = listeDeRevision;  break;
      case 1:     listeActuelle = listeDeCours;     break;
      case 2:     listeActuelle = listeDeExo;       break;
      case 3:     listeActuelle = listeDeRevision;               break;
      default:    listeActuelle = listeDeRevision;  break;
    }
    List<Widget> lesBoutons = [];
    listeActuelle[0].forEach((nomMenus) {
      ElevatedButton unBouton = ElevatedButton(
        onPressed: () => pageMenuD(listeActuelle[listeActuelle[0].indexOf(nomMenus)+1]), 
        child: Text(nomMenus),
      );
      lesBoutons.add(unBouton);
    });
    return Column(
      children: lesBoutons,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
    );
  }
  pageMenuD(List<String> listeMenus){
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext ctx) => PageMenu(menusAAfficher: listeMenus,)
      ),
    );
  }
  BottomNavigationBar bottomNavBarFonction() {
    return BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Révision',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Cours',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Exo',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Essais',
            backgroundColor: Colors.blueGrey,
          ),
        ],

        currentIndex: indexBottomFonction,
        selectedItemColor: Colors.yellow,
        onTap: ((int index) => setState(() => indexBottomFonction = index)),
      );
  }
  /*
  Column bountonsMenu(){
    List<Widget> lesBoutons = [];
    categories.forEach((nomMenus) { 
      ElevatedButton unBouton = ElevatedButton(
        onPressed: choixListe(nomMenus), 
        child: Text(nomMenus)
      );
      lesBoutons.add(unBouton);
    });
    return Column(
      children: lesBoutons,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
    );
  }
  choixListe(String menuAOuvrir){
    switch (menuAOuvrir) {
      case "menu": laListe = menus; break;
      case "generique":     laListe = generiques;     break;
      case "stateless":     laListe = statelesss;     break;
      case "stateful":      laListe = statefuls;      break;
      case "modalRouting":  laListe = modalRoutings;  break;
      case "package":       laListe = packages;       break;
      case "menu":          laListe = menus;          break;
      default:
    }
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext ctx) => PageMenu(menusAAfficher: laListe,)
      ),
    );
  }
  */
}
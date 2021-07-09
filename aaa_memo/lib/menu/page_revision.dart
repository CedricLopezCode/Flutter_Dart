
import 'package:aaa_memo/cette_app/page_menu.dart';
import 'package:flutter/material.dart';

class PageRevision extends StatefulWidget {
  @override
  PageRevisionState createState() => PageRevisionState();
}

class PageRevisionState extends State<PageRevision> {
  
  var listeDeListe = [
    ["menu", "generique", "stateless", "stateful", "modalRouting", "package"],
    ["AppBar", "BottomNavBar",],
    ["Main", "Dynamique", "Dart"],
    ["Container", "Espaceur", "Stack", "Texte", "ListeGrille", "Icone", "Image"],
    ["Bouton", "TextField", "Checkbox", "Switch", "slider", "radio", "DateTimePicker"],
    ["SnackBar", "Alert", "Dialog", "Routing"],
    ["ImagePicker"]
  ];

  List<String> laListe = [];
  List<String> categories = ["Menu", "Generique", "Basiques", "Dynamique", "ModalRouting", "Package"];
  List<String> menus = ["AppBar", "BottomNavBar",];
  List<String> generiques = ["Main", "Dynamique", "Dart"];
  List<String> statelesss = ["Container", "Espaceur", "Stack", "Texte", "Image"];
  List<String> statefuls = ["Bouton", "TextField", "Checkbox", "Switch", "slider", "radio", "DateTimePicker"];
  List<String> modalRoutings = ["SnackBar", "Alert", "Dialog", "Routing"];
  List<String> packages = ["ImagePicker"];

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sommaire"), centerTitle: true,),
      body: SingleChildScrollView(child: Center(child: bountonsListDD(),)),
      //bottomNavigationBar: BottomNavBar(),
    );
  }
  Column bountonsListDD(){
    List<Widget> lesBoutons = [];
    listeDeListe[0].forEach((nomMenus) {
      ElevatedButton unBouton = ElevatedButton(
        onPressed: () => pageMenuD(nomMenus.toString(), listeDeListe[listeDeListe[0].indexOf(nomMenus)+1]), 
        child: Text(nomMenus),
      );
      lesBoutons.add(unBouton);
    });
    return Column(
      children: lesBoutons,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
    );
  }
  pageMenuD(String titreMenu, List<String> listeMenus){
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext ctx) => PageMenu(titreMenu: titreMenu, menusAAfficher: listeMenus)
      ),
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
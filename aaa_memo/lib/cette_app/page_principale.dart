import 'package:aaa_memo/cette_app/page_menu.dart';
import 'package:aaa_memo/exo/comprehension_clicker/clicker.dart';
import 'package:aaa_memo/exo/exo_a_facebook/facebook.dart';
import 'package:aaa_memo/exo/exo_b_profil/main_profil.dart';
import 'package:aaa_memo/exo/exo_b_profil/profil_page.dart';
import 'package:aaa_memo/exo/exo_c_quizz/main_quizz.dart';
import 'package:aaa_memo/exo/exo_c_quizz/quizz.dart';
import 'package:aaa_memo/exo/exo_d_meteo/page_meteo.dart';
import 'package:aaa_memo/exo/exo_e_courses/main_courses.dart';
import 'package:aaa_memo/menu/drawer.dart';
import 'package:flutter/material.dart';

class PagePrincipale extends StatefulWidget {
  final indexBottom;
  PagePrincipale({this.indexBottom});

  @override
  PagePrincipaleState createState() => PagePrincipaleState();
}

class PagePrincipaleState extends State<PagePrincipale> {

  int indexBottomFonction = 0;
  List<String> villes = ["Grenoble", "Paris", "Brest"];
  String villeChoisie ="";

  var listeActuelle = [];

 
  var listeDeRevision = [
    ["Menu", "Générique", "Widget Basiques", "Widget Interactifs", "Modal Routing", "Package", "Data"],
    ["AppBar", "BottomNavBar", "Drawer"],
    ["Main", "Dynamique", "Dart"],
    ["Container", "Espaceur", "Stack", "Texte", "Liste", "Grille", "Icone", "Image"],
    ["Bouton", "TextField", "Checkbox", "Switch", "Slider", "Radio", "DateTimePicker", "Future Builder", 
      "Listeners"],
    ["SnackBar", "Alert", "Dialog", "Routing"],
    ["ImagePicker", "News RSS", "Localisation", "Shared Préférences", "Adaptive Theme", "Launcher Icon",
      "URL Launcher"],
    ["News RSS", "Api Json", "Shared Préférences", "DB SQLite"]
  ];
  var listeDeCours = [
    ["menu", "generique", "stateless", "stateful", "modalRouting", "package"],
    ["AppBar", "BottomNavBar", "Drawer"],
    ["Main", "Dynamique", "Dart"],
    ["Container", "Espaceur", "Stack", "Texte", "ListeGrille", "Icone", "Image"],
    ["Bouton", "TextField", "Checkbox", "Switch", "slider", "radio", "DateTimePicker"],
    ["SnackBar", "Alert", "Dialog", "Routing"],
    ["ImagePicker"]
  ];
  var listeDeExo = [
    ["Clicker", "Facebook", "Profil", "Quizz", "Météo", "Courses"],
    ["Clicker"],
    ["Facebook"],
    ["Profil"],
    ["Quizz"],
    ["Météo"],
    ["Courses"]
  ];
  Map<String, dynamic> mapExo = {
    "Clicker": Clicker(title: "Clicker"), "Facebook": Facebook() , "Profil": MainProfil(title: "Profil",),
        "Quizz": MainQuizz(title: "Quizz",), "Météo": PageMeteo(), "Courses": MainCourses()
  };
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
      drawer: Drawer(
        child: Container(color: Colors.yellow,child: 
          ListView.builder(
            itemCount: villes.length,
            itemBuilder: (context, index){
              return ListTile(
                title: Text(villes[index]),
                onTap: (){setState(() {
                  print("avant: $villeChoisie");
                  villeChoisie = villes[index];
                  print("apres: $villeChoisie");
                  Navigator.of(context).pop();
                });},
              );
            }
          )
        ,),
      ),
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
        onPressed: () {
          if(indexBottomFonction == 2){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext ctx) => mapExo[nomMenus]
              ),
            );
          }else{
            pageMenuD(nomMenus.toString(), listeActuelle[listeActuelle[0].indexOf(nomMenus)+1]);
          }

        }, 
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
        showUnselectedLabels: true,
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
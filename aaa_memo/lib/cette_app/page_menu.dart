import 'package:aaa_memo/cette_app/bottom_navbar.dart';
import 'package:aaa_memo/cette_app/page_affichage.dart';
import 'package:flutter/material.dart';

class PageMenu extends StatefulWidget{

  final menusAAfficher;
  final titreMenu;

  PageMenu({required this.titreMenu, required this.menusAAfficher});

  @override
  State<StatefulWidget> createState() => PageMenuState();
}

class PageMenuState extends State<PageMenu>{

  List<String> villes = ["Grenoble", "Paris", "Brest"];

   @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(title: Text(widget.titreMenu), centerTitle: true,),
      body: SingleChildScrollView(child:Center(child: bountonsList(widget.menusAAfficher))),
      //bottomNavigationBar: BottomNavBar(),
    );
  }
  
  Column bountonsList(List<String> aVoir){
    List<Widget> lesBoutons = [];
    int indexBouton = 0;
    aVoir.forEach((nomPage) {
      indexBouton++; 
      ElevatedButton unBouton = ElevatedButton(
        onPressed: (){
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext ctx) => PageAffichage(pageAAfficher: nomPage))
          );
        }, 
        child: Text(nomPage)
      );
      lesBoutons.add(unBouton);
    });
    return Column(
      children: lesBoutons,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
    );
  }
 
}//fin class
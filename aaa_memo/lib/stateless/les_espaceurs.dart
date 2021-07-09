import 'package:flutter/material.dart';

class LesEspaceurs extends StatefulWidget{
  
  @override
  LesEspaceursState createState () => LesEspaceursState();

}
class LesEspaceursState extends State<LesEspaceurs>{
  
  //Les const et var
 
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Divider(color: Colors.blue, thickness: 2,),
          lePadding(),
          Divider(color: Colors.blue, thickness: 2,),
          leExpanded(),
          Divider(color: Colors.blue, thickness: 2,),
          leSpacer(),
          Divider(color: Colors.blue, thickness: 2,),
          leDivider(),
          Divider(color: Colors.blue, thickness: 2,),
          pourScroller(),
          //customScrollView(),
          Divider(color: Colors.blue, thickness: 2,),
        ],
      )
    ;//fin return
  }
Widget lePadding() { //prend le maximum de place
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start, //Optionel//memes valeurs que le flex
        children: <Widget> [
          Text("Mon texte sans padding"),
          Padding(padding: EdgeInsets.all(10),),
          Text("Mon texte après padding"),
          Padding(
            padding: EdgeInsets.all(20),
            child: Text("Mon texte dans padding"),
          ),
          
        ]
      );
  }
//Par exemple quand 2 en flex le 1ere a gauche et le 2nd centre sur la place qu'il reste
  Widget leExpanded() {//Permet d'étendre 1 widget pour aligner 
    return Container(
     color: Colors.red,
     padding: EdgeInsets.all(5),
      child: Column(
        children: [
          Text("Je veux texte au centre de l'espace restant laissé par l'image"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.asset("images/02.jpg", height: 50),
              Text("sans expanded", textAlign: TextAlign.center)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.asset("images/02.jpg", height: 50),
              Expanded(child: Text("avec expanded", textAlign: TextAlign.center))
            ],
          ),
        ],
      )   
    );
  }

  Widget leSpacer() { //prend le maximum de place
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start, //Optionel//memes valeurs que le flex
        children: <Widget> [
          Icon(Icons.brightness_2),
          Icon(Icons.brightness_7_sharp),
          Spacer(),
          Text("Mon texte à droite grace au spacer"),
        ]
      );
  }

  Widget leDivider() {  //Les lignes de séparation de sections
     return Column(
      children: <Widget> [
        Divider(),
        Divider(
          color: Colors.red,
          height: 10, //a moitie pertinent
          thickness: 2, //epaisseur
          indent: 30, //décalage pour pas toucher le bord au début
          endIndent: 50,  //décalage pour pas toucher le bord a la fin
        ),
      ]
    );
  }

  Widget pourScroller() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,   //Par défaut
      child: Column(
        children: [
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
        ],
      ),
    );
  }
  Widget customScrollView(){
    return CustomScrollView(
      slivers: [
        SliverAppBar(floating: true,),  //option pour que la AppBar disparaisse quand on scroll
        SliverList(delegate: SliverChildListDelegate([
          Text("Du Texte pour remplir custom"),
          Text("Du Texte pour remplir custom"),
          Text("Du Texte pour remplir custom"),
          Text("Du Texte pour remplir custom"),
          Text("Du Texte pour remplir custom"),
          Text("Du Texte pour remplir custom"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
          Text("Du Texte pour remplir"),
        ]))
      ],
    );
  }

}
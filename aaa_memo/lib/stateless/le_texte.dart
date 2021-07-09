import 'package:flutter/material.dart';

class LeTexte extends StatefulWidget{
  
  @override
  LeTexteState createState () => LeTexteState();

}
class LeTexteState extends State<LeTexte>{
  
  //Les const et var
  int age = 12;
  TextStyle variableStyle = TextStyle(
    fontStyle: FontStyle.italic,
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: Color.fromRGBO(13, 200, 160, 0.5),
  );

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget> [

        Text("texte simple"),

        Text("texte avec variable age = $age"),

        Text("texte avec alignement enfin si ça veut bien marcher parce que là je suis obligé de prendre 2 lignes", 
          textAlign: TextAlign.right
        ),
        
        Text("texte avec 1 style en brut", style: TextStyle(color: Colors.orange)),
        
        Text(
          "texte avec plusieurs styles en brut",
            style: TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Color.fromRGBO(130, 20, 60, 0.5),
            //background: Color.fromARGB(1, 20, 2, 20),
            //fontFamily: , //  plus tard car necessite des import  //arial black, time new roman, etc...
          )
        ),
        
        Text("texte avec plusieurs styles en variable", style: variableStyle),
        
        Divider(),

        SelectableText("Selectable text"),

        Divider(),

        Text.rich( //plusieurs styles dans 1 seul texte
          TextSpan(
            text: "Texte riche: Texte principal",
            style: TextStyle(color: Colors.red),
            children: [
              TextSpan(
                text: "1er enfant avec un second style",
                style: TextStyle(color: Colors.grey)
              ),
              TextSpan(
                  text: "2eme enfant reprend le style du parent si pas changé ici la couleur",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                  )
              )
            ]
          )
        )
      
      ]
      )
    ;//fin return
  }

}
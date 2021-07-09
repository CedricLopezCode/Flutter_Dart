import 'package:flutter/material.dart';

class LesSwitch extends StatefulWidget{
  
  @override
  LesSwitchState createState () => LesSwitchState();

}
class LesSwitchState extends State<LesSwitch>{
  
  List<bool> valeurSwitch = [false, true, false];  //Switch
 
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
           //----------------------------------   Switch  -----------------------------------------
      Row(children: [
        Switch(
          value: valeurSwitch[0], 
          onChanged: ((changSwitch) => setState(() => valeurSwitch[0] = changSwitch)),
        ),
        Switch(
          value: valeurSwitch[1], 
          onChanged: ((changSwitch) => setState(() => valeurSwitch[1] = changSwitch)),
          activeColor: Colors.green,  
          activeTrackColor: Colors.blue,  //seulement si on veut la barre d'une autre couleur
          inactiveThumbColor: Colors.red, //bouton
          inactiveTrackColor: Colors.yellow,  //barre
          hoverColor: Colors.black,    //?????
        ),
       
        
        Text("$valeurSwitch"),
      ],),
      //Pas dans une row car prend toute la largeur !!!
        SwitchListTile( //Pour inclure text et/ou image directement dans le switch 
          title: Text("SwitchListTile"),
          value: valeurSwitch[2], 
          onChanged: ((changSwitch) => setState(() => valeurSwitch[2] = changSwitch)),
          secondary: Icon(Icons.hourglass_top_rounded),
        ),
        ],
      )
    ;//fin return
  }
}
import 'package:flutter/material.dart';

class LesCheckbox extends StatefulWidget{
  
  @override
  LesCheckboxState createState () => LesCheckboxState();

}
class LesCheckboxState extends State<LesCheckbox>{
  
   List<bool> valeurCheckBox = [false, true, false, false];  //Checkbox
 
  @override
  Widget build(BuildContext context) {
    return Column(children: [

        Checkbox(
          value: valeurCheckBox[0], 
          onChanged: ((changCheckbox) => setState(() => valeurCheckBox[0] = changCheckbox ?? false)), 
          //Pour enlever l'erreur de l'optionnel on met une valeur par défaut 
        ),

        Checkbox(
          value: valeurCheckBox[1], 
          onChanged: ((changCheckbox) => setState(() => valeurCheckBox[1] = changCheckbox ?? false)), 
          //Pour enlever l'erreur de l'optionnel on met une valeur par défaut 
          activeColor: Colors.green,  //couleur de la case quand checked
          checkColor: Colors.yellow,  //couleur de la croix quand checked
          hoverColor: Colors.red,  // ????
        ),

        Row(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(Icons.hourglass_bottom),
          Text("Row pour avoir une icone"),
          Checkbox(
            value: valeurCheckBox[2], 
            onChanged: ((changCheckbox) => setState(() => valeurCheckBox[2] = changCheckbox ?? false)),
            activeColor: Colors.green,  //couleur de la case quand checked
            checkColor: Colors.yellow,  //couleur de la croix quand checked
            hoverColor: Colors.red,  // ????
          ),
        ],),
 
        //Pas dans une row car prend toute la largeur !!!
        CheckboxListTile( //Pour inclure text et/ou image directement dans la checkbox
            value: valeurCheckBox[3], 
            onChanged: ((changCheckbox) => setState(() => valeurCheckBox[3] = changCheckbox ?? false)), 
            //Pour enlever l'erreur de l'optionnel on met une valeur par défaut 
            title: Text("CheckboxListTile"),
            //subtitle: Text("subtitle"),
            secondary: Icon(Icons.lightbulb),
          ),
      Divider(),
      Text("$valeurCheckBox"),
    ],)
    ;//fin return
  }
}
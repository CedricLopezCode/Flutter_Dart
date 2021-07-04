import 'package:flutter/material.dart';

class LesCheckbox extends StatefulWidget{
  
  @override
  LesCheckboxState createState () => LesCheckboxState();

}
class LesCheckboxState extends State<LesCheckbox>{
  
   List<bool> valeurCheckBox = [false, true, false];  //Checkbox
 
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Row(children: [
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
        Row(children: [
          Icon(Icons.hourglass_bottom),
          Text('Animate Slowly'),
          Checkbox(
            value: valeurCheckBox[2], 
            onChanged: ((changCheckbox) => setState(() => valeurCheckBox[2] = changCheckbox ?? false)),
            activeColor: Colors.green,  //couleur de la case quand checked
            checkColor: Colors.yellow,  //couleur de la croix quand checked
            hoverColor: Colors.red,  // ????
          ),
        ],),
/*
        Checkbox(
          value: valeurCheckBox[2], 
          onChanged: ((changCheckbox) => setState(() => valeurCheckBox[2] = changCheckbox ?? false)), 
          //Pour enlever l'erreur de l'optionnel on met une valeur par défaut 
          activeColor: Colors.green,  //couleur de la case quand checked
          checkColor: Colors.yellow,  //couleur de la croix quand checked
          hoverColor: Colors.red,  // ????
        ),
        */
        /* 
        Expanded(
          child: CheckboxListTile(
            title: const Text('Animate Slowly'),
            value: valeurCheckBox[2],
            onChanged: ((changCheckbox) => setState(() => valeurCheckBox[2] = changCheckbox !)),
            //secondary: Icon(Icons.hourglass_empty),
          ),
        ),
        */
        /*
        CheckboxListTile( //Pour inclure text et/ou image directement dans la checkbox
          value: valeurCheckBox[2], 
          onChanged: ((changCheckbox) => setState(() => valeurCheckBox[2] = changCheckbox ?? false)), 
          //Pour enlever l'erreur de l'optionnel on met une valeur par défaut 
          title: Text("SwitchListTile"),
          secondary: Icon(Icons.lightbulb),
        ),
        */
        Text("$valeurCheckBox"),
      ],),
        ],
      )
    ;//fin return
  }
}
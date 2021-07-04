import 'package:flutter/material.dart';

class LesSimpleDialog extends StatefulWidget{
  
  @override
  LesSimpleDialogState createState () => LesSimpleDialogState();

}
class LesSimpleDialogState extends State<LesSimpleDialog>{
  
  //Les const et var
 
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Divider(color: Colors.blue, thickness: 2,),
          bloc1(),
          Divider(color: Colors.blue, thickness: 2,),
          Row(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            boutonDialogMin(),
            boutonDialogEvo(),
            boutonDialogOption(),
          ],),
          Divider(color: Colors.blue, thickness: 2,),
        ],
      )
    ;//fin return
  }
  Container bloc1() {
    return Container(color: Colors.greenAccent, width: 300, height: 100, child: Column(children: [
      Text("Principale différence entre Alert et Dialog:"),
      Text("- L'alert a des actions prédéfinies"),
      Text("- Le Dialog a des enfants 'normaux'"),
    ],)
    );
  }
  ElevatedButton boutonDialogMin(){ 
    return ElevatedButton(
        onPressed: (){
          const simpleMin = SimpleDialog(
            title: Text("Titre dialog min"),
          );
          showDialog(
            context: context, 
            builder: (BuildContext ctx) => simpleMin,
          );
        },
        child: Text("Dialog min"), 
      );
  }
  ElevatedButton boutonDialogEvo(){ 
    return ElevatedButton(
        onPressed: (){
          final simpleEvo = SimpleDialog(
            title: Text("Titre dialog evo"),
            children: [
              Text("Children comme une column"),
              Text("Mais dans un pop up"),
              Text("data"),
              Text("data"),
            ],
            elevation: 15,
            backgroundColor: Colors.yellow, //Le fond du pop-up
            //shape: RoundedRectangleBorder(borderRadius: BorderRadius.),
          );
          showDialog(
            context: context, 
            builder: (BuildContext ctx) => simpleEvo,
          );
        },
        child: Text("Dialog evo"), 
      );
  }
  ElevatedButton boutonDialogOption(){ 
    return ElevatedButton(
        onPressed: (){
          final simpleOption = SimpleDialog(
            title: Text("Titre dialog option"),
            children: [
              Text("Children comme une column"),
              Text("Mais dans un pop up"),
              Text("data"),
              Text("data"),
              option(),
            ],
            elevation: 15,
            backgroundColor: Colors.yellow, //Le fond du pop-up
            //shape: RoundedRectangleBorder(borderRadius: BorderRadius.),
          );
          showDialog(
            context: context, 
            builder: (BuildContext ctx) => simpleOption,
          );
        },
        child: Text("Dialog option"), 
      );
  }
 SimpleDialogOption option(){
    return SimpleDialogOption(
      onPressed: () => Navigator.of(context).pop(),
      child: Text("Les options (ici fermer le pop up alors qu'on clique dessus)"),
    );
  }
}
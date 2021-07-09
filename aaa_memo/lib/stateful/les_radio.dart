import 'package:flutter/material.dart';

class LesRadio extends StatefulWidget{
  
  @override
  LesRadioState createState () => LesRadioState();

}
class LesRadioState extends State<LesRadio>{
  
  //Les const et var
  List<int> groupeRadios = [0,0,0,0];
  List<String> listeJeux = ["Mario", "Métroïd", "Zelda", "TESO"];


  @override
  Widget build(BuildContext context) {
    return Column(children: [
        Radio(
          value: 1, 
          groupValue: groupeRadios[0], 
          onChanged: ((changRadio) => setState(() => groupeRadios[0] = changRadio as int)), 
          activeColor: Colors.green,
        ),
        Divider(color: Colors.red,),
        nombreRadio(5),
        Divider(color: Colors.red,),
        listeRadio(listeJeux),
        Divider(color: Colors.red,),
        listeRadioListTile(listeJeux),
        Divider(color: Colors.red,),
        Text("$groupeRadios"),
    ],)
    ;//fin return
  }
   Row nombreRadio(int nbRadio){
    List<Widget> allRadio = [];
    for(var i = 0; i < nbRadio; i++){
      Radio uneRadio = Radio(
          value: i, 
          groupValue: groupeRadios[1], 
          onChanged: ((changRadio) => setState(() => groupeRadios[1] = changRadio as int)), 
      );
      allRadio.add(uneRadio);
    }
    return Row(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.center, children: allRadio,);
  }
  Row listeRadio(List<String> liste){
    List<Widget> allJeux = [];
    for(var i = 0; i < liste.length; i++){
      Column unJeu = Column(children: [
        Text("${liste[i]}"),
        Radio(
            value: i, 
            groupValue: groupeRadios[2], 
            onChanged: ((changRadio) => setState(() => groupeRadios[2] = changRadio as int)), 
        ),
      ]);
      allJeux.add(unJeu);
    }
    return Row(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.center, children: allJeux,);
  }
  Column listeRadioListTile(List<String> liste){
    List<Widget> allJeux = [];
    for(var i = 0; i < liste.length; i++){
      RadioListTile unJeu = RadioListTile(
          title: Text("${liste[i]}"),
          value: i, 
          groupValue: groupeRadios[3], 
          onChanged: ((changRadio) => setState(() => groupeRadios[3] = changRadio as int)), 
          secondary: Icon(Icons.lightbulb),
      );
      allJeux.add(unJeu);
    }
    return Column(children: allJeux,);
  }
}
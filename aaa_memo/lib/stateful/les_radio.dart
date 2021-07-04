import 'package:flutter/material.dart';

class LesRadio extends StatefulWidget{
  
  @override
  LesRadioState createState () => LesRadioState();

}
class LesRadioState extends State<LesRadio>{
  
  //Les const et var
  int groupeRadio = 1;  //Radio


  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Row(children: [
        Radio(
          value: 1, 
          groupValue: 1, 
          onChanged: ((changRadio) => setState(() => groupeRadio = changRadio as int)), 
          activeColor: Colors.green,
        ),
        listeRadio(5),
        Text("$groupeRadio"),
        /*
        RadioListTile<SingingCharacter>(
        title: const Text('Lafayette'),
        value: SingingCharacter.lafayette,
        groupValue: _character,
        onChanged: (SingingCharacter? value) { setState(() { _character = value; }); },
      ),
        */
      ],),
        ],
      )
    ;//fin return
  }
   Row listeRadio(int nbRadio){
    List<Widget> allRadio = [];
    for(var i = 0; i < nbRadio; i++){
      Radio uneRadio = Radio(
          value: i, 
          groupValue: groupeRadio, 
          onChanged: ((changRadio) => setState(() => groupeRadio = changRadio as int)), 
      );
      allRadio.add(uneRadio);
    }
    return Row(children: allRadio,);
  }
}
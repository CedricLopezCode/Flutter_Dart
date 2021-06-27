
import 'package:flutter/material.dart';

class StyleTitreSection extends StatelessWidget{
  
 final String titreSection; //final obligaqtoire car impossible de le changer dans cette classe

 StyleTitreSection(this.titreSection);
  
  @override
  Widget build(BuildContext context) {
    return Text(
      titreSection, 
      style: TextStyle(
        fontWeight: FontWeight.bold, 
        fontSize: 15
      ),
    );
  }
}
//Peuvent faire office de Classe CSS comme ça !!!

//  Text("A propos de moi", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
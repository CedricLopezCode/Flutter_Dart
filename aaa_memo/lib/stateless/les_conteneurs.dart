import 'package:flutter/material.dart';

class LesConteneurs extends StatefulWidget{
  
  @override
  LesConteneursState createState () => LesConteneursState();

}
class LesConteneursState extends State<LesConteneurs>{
  
  //Les const et var
 
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Divider(color: Colors.blue, thickness: 2,),
          centre(),
          Divider(color: Colors.blue, thickness: 2,),
          conteneur(),
          Divider(color: Colors.blue, thickness: 2,),
          lesBoxDecoration(),
          Divider(color: Colors.blue, thickness: 2,),
          lesCard(),
          Divider(color: Colors.blue, thickness: 2,),
          colonne(),
          Divider(color: Colors.blue, thickness: 2,),
          ligne(),
          Divider(color: Colors.blue, thickness: 2,),
        ],
      )
    ;//fin return
  }

  Center centre() {
    return Center( //Attention au padding
      child: Text("center"),
    );
  }

  Container conteneur() {
    return Container(
      height: 50,
      width: 50,
      color: Colors.green,
    );
  }
  Container lesBoxDecoration() {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(10),

      decoration: BoxDecoration(
        //  Image
        image: DecorationImage(
          image: AssetImage("images/02.jpg"),
          fit: BoxFit.cover
        ),
        //  Ombre
        boxShadow: [
          BoxShadow(
            color: Colors.yellow,
            offset: Offset(3, 3),  //décalage horizontal puis vertical
            blurRadius: 2,  //Floute l'ombre
            spreadRadius: 5,//Etale l'ombre
          ),
        ],
        //  Angles
        //shape: BoxShape.circle, //Change la forme de la décoration
        borderRadius: BorderRadius.all(Radius.circular(15)), //Arrondi les angles
      ),
      child: Text("Box Décoration", style: TextStyle(color: Colors.red,)),
    );
  }
 Widget lesCard() {
    return Row( children: <Widget> [
      conteneur(),

      Card(
        child: conteneur(),
        elevation: 5, //met une ombre qui donne l'impression de sur-élevé
      ),

      Card(//Astuce pour ajouter du padding à des élément qui n'en ont pas(Card)
        child: conteneur(),
        elevation: 5, 
      ),

      Card(//Astuce pour ajouter du padding à des élément qui n'en ont pas(Card)
        child: Padding(
          padding: EdgeInsets.all(10),
          child: conteneur(),
        ),
        elevation: 5, 
      ),

      Card(
        child: Text("texte"),
        color: Colors.green,
        elevation: 5,
        margin: EdgeInsets.all(20),
      ),

    ]
   );
  }

  Column colonne() {
    return Column(
      mainAxisSize: MainAxisSize.min,  
      mainAxisAlignment: MainAxisAlignment.start,   //Optionel//memes valeurs que le flex
      crossAxisAlignment: CrossAxisAlignment.start, //Optionel//memes valeurs que le flex
      children: <Widget> [
        Text("Col1"),
        Text("Col2"),
        Text("Col3"),
        Text("Col4"),
      ]
    );
  }

  Row ligne() {
    return Row(
      mainAxisSize: MainAxisSize.min,   
      mainAxisAlignment: MainAxisAlignment.center,   //Optionel//memes valeurs que le flex
      crossAxisAlignment: CrossAxisAlignment.start, //Optionel//memes valeurs que le flex
      children: <Widget> [
        Text("Row1"),
        Text("Row2"),
        Text("Row3"),
        Text("Row4"),
      ]
    );
  }

}
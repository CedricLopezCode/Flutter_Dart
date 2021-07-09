import 'package:aaa_memo/modalRouting/page_alternative.dart';
import 'package:flutter/material.dart';

class LeRouting extends StatefulWidget{
  
  @override
  LeRoutingState createState () => LeRoutingState();

}
class LeRoutingState extends State<LeRouting>{
  
  //Les const et var
 
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Divider(color: Colors.blue, thickness: 2,),
          Row(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            boutonChangPage(),
          ],),
          Divider(),
          GestureDetector(
            onTap: (){
              final autrePage = PageAlternative(couleur: Colors.yellow);
              Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext ctx) => autrePage)
            ); },
            child: Hero(
              tag: "hero", 
              child: CircleAvatar(backgroundImage: AssetImage("images/02.jpg"),)
            ),
          )
          
        ],
      )
    ;//fin return
  }
  
  ElevatedButton boutonChangPage(){   //Comme un popup qui prend toute la page avec un bouton retour topleft
    return ElevatedButton(
        onPressed: (){
          final autrePage = PageAlternative(couleur: Colors.yellow);
          Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext ctx) => autrePage)
          );
        },
        child: Text("Changer Page"), 
      );
  }
}
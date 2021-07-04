import 'package:flutter/material.dart';

class LIcone extends StatefulWidget{
  
  @override
  LIconeState createState () => LIconeState();

}
class LIconeState extends State<LIcone>{
  
  //liste: https://fonts.google.com/icons?selected=Material+Icons

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Divider(color: Colors.blue, thickness: 2,),
          lesIcones(),
          Divider(color: Colors.blue, thickness: 2,),
          leCircleAvatar(),
          Divider(color: Colors.blue, thickness: 2,),

        ],
      )
    ;//fin return
  }
  Widget lesIcones() {
    return Row( children: <Widget> [ 
      Icon(Icons.memory), 

      Icon( 
        Icons.house,
        color: Colors.yellow, //la couleur du dessin à l'intérieur
        size: 50,
      ),

      Image.asset( 
        "images/02.jpg",
        height: 30,
      ),

    ]
   );
  }
  Widget leCircleAvatar() {
    return Row(children: [

        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.yellow,
          foregroundColor: Colors.green,
          foregroundImage: AssetImage("images/03.jpg"),
        ),

        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.yellow,
          foregroundColor: Colors.green,
          foregroundImage: NetworkImage("https://images.pexels.com/photos/1373100/pexels-photo-1373100.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"),
        )

      ],
    );    
  }
}
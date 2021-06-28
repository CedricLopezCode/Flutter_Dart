import 'package:flutter/material.dart';

class Wig extends StatefulWidget{
  //V1
  /*@override
  State<Wig> createState(){
    return WigState();

  }*/

  //V2
  WigState createState() => WigState();//Ecouteur d'état pour savoir quand maj
}

class WigState extends State<Wig>{      //Quoi faire quand maj

  @override
  void initState() {    //A la création
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {  //A la destruction
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {  // Constructeur comme Stateless
    return Scaffold(
      appBar: AppBar(title: Text("WIdgets Interactifs"),),
      body: Center(child: Text("Widget Intéractif"),),
    );
  }


}


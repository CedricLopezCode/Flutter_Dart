import 'package:flutter/material.dart';

class LaStack extends StatefulWidget{
  
  @override
  LaStackState createState () => LaStackState();

}
class LaStackState extends State<LaStack>{
  
  //Les const et var
 
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Divider(color: Colors.blue, thickness: 2,),
          stackRelative(),
          Divider(color: Colors.blue, thickness: 2,),
          stackAbsolue(),
          Divider(color: Colors.blue, thickness: 2,),
          dansConteneur(),
          Divider(color: Colors.blue, thickness: 2,),
        ],
      )
    ;//fin return
  }
  Widget stackRelative() {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget> [
        Image.asset("images/02.jpg", height: 200),
        CircleAvatar(radius: 50, backgroundColor: Colors.yellow),
        Text("Stack"),
        Padding(
          padding: EdgeInsets.only(top: 50, right: 40),
          child: Text("+padding"),
        )
      ]
    );
  }
  Widget stackAbsolue() {//Avec Positionned //Positionned ne marche que dans une stack
    return Stack(
      alignment: Alignment.topCenter, //ne sert que si des élément sans Positionned
      children: <Widget> [
        Positioned.fill( //Pour que ça remplisse la stack
          child: Image.asset("images/02.jpg", height: 200, fit: BoxFit.cover,),),
        Positioned( //Positionned ne marche que dans une stack
          top: 20,
          left: 200,
          child: CircleAvatar(radius: 50, backgroundColor: Colors.yellow),
        ),
        Text("Stack"),
        Positioned(
          top: 50,
          left: 100,
          child: Text("positionned sans padding"),
        ),
      ]
    );
  }
  Widget dansConteneur(){ //Pour que la taille soit défini et pas au minimum
    return Container(
      height: 300,
      width: 300,
      child: stackAbsolue(),
    );
  }
}
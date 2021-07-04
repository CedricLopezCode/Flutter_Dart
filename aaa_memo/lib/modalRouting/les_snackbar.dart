import 'package:flutter/material.dart';

class LesSnackBar extends StatefulWidget{
  
  @override
  LesSnackBarState createState () => LesSnackBarState();

}
class LesSnackBarState extends State<LesSnackBar>{
  
  Color couleurBtn = Colors.orange;
 
  @override
  Widget build(BuildContext context) {
    return Column(
         children: [
          Row(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            boutonSnackBarMin(),
            boutonSnackBarEvo(),
          ],),
        ],
      )
    ;//fin return
  }

  //------------------------  Snack --------------------------------------------------
  ElevatedButton boutonSnackBarMin(){ 
    return ElevatedButton(
        onPressed: (){
          final maSnackbar = SnackBar(content: Text("Ma snackbar min"));
          ScaffoldMessenger.of(context).showSnackBar(maSnackbar);
        },
        child: Text("Snackbar min"), 
      );
  }
  ElevatedButton boutonSnackBarEvo(){ 
    return ElevatedButton(
        onPressed: (){
          final maSnackbar = SnackBar(
            content: Text("Ma snackbar evo"),
            backgroundColor: Colors.red,
            
            action: SnackBarAction(
              label: "Changer couleur btn", 
              textColor: Colors.yellow,
              onPressed: (){
                setState(() {
                  couleurBtn = (couleurBtn == Colors.orange) ? Colors.purple : Colors.orange;
                });
              }),
              elevation: 8,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              behavior: SnackBarBehavior.floating, //pour que la barre flotte au dessus
              width: 300,
              duration: Duration(seconds: 10),
              
          );
          ScaffoldMessenger.of(context).showSnackBar(maSnackbar);
        },
        style: ElevatedButton.styleFrom(primary: couleurBtn),
        child: Text("Snackbar evo"), 
      );
  }
   
  
}//Fin page
import 'package:flutter/material.dart';

class LesAlert extends StatefulWidget{
  
  @override
  LesAlertState createState () => LesAlertState();

}
class LesAlertState extends State<LesAlert>{
  
  //Les const et var
 
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Divider(color: Colors.blue, thickness: 2,),
          bloc1(),
          Divider(color: Colors.blue, thickness: 2,),
          Row(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            boutonAlertMin(),
            boutonAlertEvo(),
            boutonAlertFuture(),
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
  ElevatedButton boutonAlertMin(){  
    return ElevatedButton(
        onPressed: (){
          const alertMin = AlertDialog( //il faut cliquer dehors pour que ça parte
            title: Text("Titre alert min"), 
            content: Text("Le content de mon alert min"),
          );
          showDialog(
            context: context, 
            builder: (BuildContext ctx) => alertMin,
          );
        },
        child: Text("Alert min"), 
      );
  }
  ElevatedButton boutonAlertEvo(){ 
    return ElevatedButton(
        onPressed: (){
          var alertEvo = AlertDialog( //il faut cliquer dehors pour que ça parte
            title: Text("Titre alert Evo"), 
            content: Text("Voulez-vous ouvrir snack ?"),
            actions: [
              TextButton(
                onPressed: (){
                  Navigator.of(context).pop();
                  final maSnackbar = SnackBar(content: Text("Ma snackbar min"));
                  ScaffoldMessenger.of(context).showSnackBar(maSnackbar);
                },
                child: Text("Oui")
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(), //Ferme le pop up
                child: Text("Non")
              ),
            ],
            backgroundColor: Colors.grey,
            elevation: 10,
          );
          showDialog(
            barrierDismissible: false, // pour pas que ça parte si on appuie à coté //donc obligé action
            context: context, 
            builder: (BuildContext ctx) => alertEvo,
            barrierColor: Colors.black, // reste de l'écran
          );
        },
        child: Text("Alert evo"), 
      );
  }
  ElevatedButton boutonAlertFuture(){ 
    return ElevatedButton(
      onPressed: ouvrirDialog,
      child: Text("Alert fonc"), 
    );
  }
  Future ouvrirDialog() async{
    await showDialog(
      barrierDismissible: false, // pour pas que ça parte si on appuie à coté //donc obligé action
      context: context, 
      builder: (BuildContext ctx) => alertfonc(),
      barrierColor: Colors.black, // reste de l'écran
    );
  }
  AlertDialog alertfonc(){
    return AlertDialog( //il faut cliquer dehors pour que ça parte
      title: Text("Titre alert Fonc"), 
      content: Text("Voulez-vous ouvrir snack ?"),
      actions: [
        TextButton(
          onPressed: (){
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(snackFonc());
          },
          child: Text("Oui")
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(), //Ferme le pop up
          child: Text("Non")
        ),
      ],
      backgroundColor: Colors.grey,
      elevation: 10,
    );
  }
  SnackBar snackFonc() => SnackBar(content: Text("Ma snackbar fonc"));
}
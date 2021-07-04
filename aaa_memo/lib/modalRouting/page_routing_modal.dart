import 'package:aaa_memo/modalRouting/page_alternative.dart';
import 'package:flutter/material.dart';

class PageRoutingModal extends StatefulWidget{
  PageRoutingModalState createState () => PageRoutingModalState();

}
class PageRoutingModalState extends State<PageRoutingModal>{
  
  Color couleurBtn = Colors.orange;
 

  @override
  void initState() {
    super.initState();
    //à l'init
  }
  @override
  void dispose() {
    //a la destruction
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column( 
        children: [
          Row(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            boutonSnackBarMin(),
            boutonSnackBarEvo(),
          ],),
          Row(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            boutonAlertMin(),
            boutonAlertEvo(),
            boutonAlertFuture(),
          ],),
          Row(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            boutonDialogMin(),
            boutonDialogEvo(),
            boutonDialogOption(),
          ],),
          Divider(color: Colors.blue, thickness: 2,),
          bloc1(),
          Divider(color: Colors.blue, thickness: 2,),
          Row(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            boutonChangPage(),
          ],),
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
   
  //------------------------  Alert --------------------------------------------------
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
  //------------------------  Dialog --------------------------------------------------
  ElevatedButton boutonDialogMin(){ 
    return ElevatedButton(
        onPressed: (){
          const simpleMin = SimpleDialog(
            title: Text("Titre dialog min"),
          );
          showDialog(
            context: context, 
            builder: (BuildContext ctx) => simpleMin,
          );
        },
        child: Text("Dialog min"), 
      );
  }
  ElevatedButton boutonDialogEvo(){ 
    return ElevatedButton(
        onPressed: (){
          final simpleEvo = SimpleDialog(
            title: Text("Titre dialog evo"),
            children: [
              Text("Children comme une column"),
              Text("Mais dans un pop up"),
              Text("data"),
              Text("data"),
            ],
            elevation: 15,
            backgroundColor: Colors.yellow, //Le fond du pop-up
            //shape: RoundedRectangleBorder(borderRadius: BorderRadius.),
          );
          showDialog(
            context: context, 
            builder: (BuildContext ctx) => simpleEvo,
          );
        },
        child: Text("Dialog evo"), 
      );
  }
  ElevatedButton boutonDialogOption(){ 
    return ElevatedButton(
        onPressed: (){
          final simpleOption = SimpleDialog(
            title: Text("Titre dialog option"),
            children: [
              Text("Children comme une column"),
              Text("Mais dans un pop up"),
              Text("data"),
              Text("data"),
              option(),
            ],
            elevation: 15,
            backgroundColor: Colors.yellow, //Le fond du pop-up
            //shape: RoundedRectangleBorder(borderRadius: BorderRadius.),
          );
          showDialog(
            context: context, 
            builder: (BuildContext ctx) => simpleOption,
          );
        },
        child: Text("Dialog option"), 
      );
  }
 SimpleDialogOption option(){
    return SimpleDialogOption(
      onPressed: () => Navigator.of(context).pop(),
      child: Text("Les options"),
    );
  }
  //------------------------  Routing --------------------------------------------------

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
}//Fin page
          
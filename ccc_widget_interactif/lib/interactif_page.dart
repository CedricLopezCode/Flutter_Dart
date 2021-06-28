import 'package:flutter/material.dart';

class InteractifPage extends StatefulWidget{
  //V1
  /*@override
  State<InteractifPage> createState(){
    return InteractifPageState();

  }*/

  //V2
  InteractifPageState createState() => InteractifPageState();//Ecouteur d'état pour savoir quand maj
}

class InteractifPageState extends State<InteractifPage>{      //Quoi faire quand maj

  Color backgroundColor = Colors.white; //FloatingActionButton
  Color textColor = Colors.black; //FloatingActionButton
  bool textButtonAppuye = false; //Text Button
  bool textButtonAppuyelong = false; //Text Button
  bool eleveButtonAppuye = false; //Elevated Button
  bool eleveButtonAppuyelong = false; //Elevated Button
  IconData iconBouton = Icons.thumb_up_alt; //Icon Button
  String textFieldRentre = "";  //Text field
  late TextEditingController monController; //Text Control 
  //late enleve l'erreur du null car il ne le sera pas apres puisque à l'init
  bool valeurSwitch[] = false;
  bool valeurSwitch = false;
  bool valeurSwitch = false;

  @override
  void initState() {    //A la création
    super.initState();
    monController = TextEditingController();// apres le super

  }

  @override
  void dispose() {  //A la destruction
    monController.dispose();// avant le super
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {   // Constructeur comme Stateless
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(title: Text("WIdgets Interactifs"),),
      body: SingleChildScrollView( 
      child: Column(children: [
        Center(child: Text("Les Boutons !!!",style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20),)),
      //----------------------------------   TextButton == Bouton plat  -----------------------------------------
        Row(children: [
          TextButton(
            onPressed: changEtatTextButton, 
            onLongPress: changEtatTextButtonLong, 
            child: Text("Text Button  ")
          ),
          Text(majText()),
          Text(longText()),
        ],),
        //ElevatedButton == TextButton avec design  bootstrap
      //----------------------------------   ElevatedButton == en hauteur  -----------------------------------------
        Row(children: [
          ElevatedButton(
            onPressed: changEtatElevatedButton, 
            onLongPress: changEtatElevatedButtonLong, 
            child: Text("Elevated Button  "),
            style: ElevatedButton.styleFrom(
              primary: Colors.green,  //fond
              onPrimary: Colors.yellow, //texte
              elevation: 5,
            ),
          ),
          Text(majEleve()),
          Text(longEleve()),
        ],),
      //----------------------------------   IconActionButton  -----------------------------------------
        IconButton(
          onPressed: changEtatIconButton,
          icon: Icon(iconBouton),
          color: Colors.blue, //mais pas de background possible
          iconSize: 50,
          splashRadius: 60, //aire autour du bouton
          splashColor: Colors.red, 
        ),

  //------------------------------------------------------------------------------------------------
  Divider(),//------------------------------------------------------------------------------------
  //---------------------------------------------------------------------------------------------
        Center(child: Text("Les Formulaires !!!",style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20),)),
      //----------------------------------   TextField  -----------------------------------------
      TextField(
        decoration: InputDecoration(
          hintText: "PlaceHolder",
          //border: OutlineInputBorder(),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        ),
        keyboardType: TextInputType.emailAddress,//Pour avoir le @ 
        //phone pour les chiffre, datetime ?????  , multiline ????, visiblepassword ???
        obscureText: false,//true pour les mdp //point
        //onChanged: (newText) {setState(() textFieldRentre = newText;});},
        onSubmitted: (newText) {setState(() {textFieldRentre = newText;});},
      ),
      Text(textFieldRentre),

      //----------------------------------   TextEditingController  ----------------------------
      TextField(
        decoration: InputDecoration(hintText: "Controler",border: OutlineInputBorder(),),
        controller: monController,  //permet d'eviter de stocker la value de la variable
        onChanged: ((newValue) => setState(() => monController.text = newValue)),
        //onSubmitted: (newText) {setState(() {textFieldcontrol = newText;});},
      ),
      Text(monController.text),
      //----------------------------------   Switch  -----------------------------------------
      Row(children: [
        Switch(
          value: valeurSwitch1, 
          onChanged: ((changSwitch) => setState(() => valeurSwitch1 = changSwitch)),
        ),
        Switch(
          value: valeurSwitch2, 
          onChanged: ((changSwitch) => setState(() => valeurSwitch2 = changSwitch)),
        ),
        Switch(
          value: valeurSwitch3, 
          onChanged: ((changSwitch) => setState(() => valeurSwitch3 = changSwitch)),
        ),

      ],),
      //----------------------------------   Slider  -----------------------------------------
      //----------------------------------   CheckBox  -----------------------------------------
      //----------------------------------   Radio  -----------------------------------------
      //----------------------------------   DatePicker  -----------------------------------------

      ],),
      ),
      //----------------------------------   FloatingActionButton  -----------------------------------------
      floatingActionButton: FloatingActionButton(  //Pas vraiment un Widget
       /* onPressed: (){  // Quand plusieurs actions
          updateColor();
        },*/
        onPressed: updateColor, // pas besoin des parenthese
        child: Icon(Icons.remove_red_eye),
        backgroundColor: Colors.orange,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,//position si on veut la bouger
      //----------------------------------   XXXXXX  -----------------------------------------
      
    );
  }
  
//----------------------------------   FloatingActionButton  -----------------------------------------
  void updateColor(){ //FloatingActionButton
    setState(() { //variable maj que si à l'intérieur
      backgroundColor = (backgroundColor == Colors.white) ? Colors.black  : Colors.white ;
      textColor = (textColor == Colors.white) ? Colors.black  : Colors.white ;
    });
  }
  //----------------------------------   TextButton  -----------------------------------------
  void changEtatTextButton(){
    setState(() {
      textButtonAppuye = !textButtonAppuye;
    });
  }
  void changEtatTextButtonLong(){
    setState(() {
      textButtonAppuyelong = !textButtonAppuyelong;
    });
  }
  String majText() => (textButtonAppuye)? "Bouton flat appuyé" : "Bouton flat Relaché";
  String longText() => (textButtonAppuyelong)? "Bouton flat long" : "bas";
  //----------------------------------   ElevatedButton  -----------------------------------------
  void changEtatElevatedButton(){
    setState(() {
      eleveButtonAppuye = !eleveButtonAppuye;
    });
  }
  void changEtatElevatedButtonLong(){
    setState(() {
      eleveButtonAppuyelong = !eleveButtonAppuyelong;
    });
  }
  String majEleve() => (eleveButtonAppuye)? "Bouton élevé appuyé" : "Bouton élevé Relaché";
  String longEleve() => (eleveButtonAppuyelong)? "Bouton élevé long" : "haut";
  
  //----------------------------------   IconButton  -----------------------------------------
  void changEtatIconButton(){
    setState(() {
      iconBouton = (iconBouton == Icons.thumb_up_alt) ? Icons.thumb_down_alt  : Icons.thumb_up_alt ;
    });
  }

  //----------------------------------   TextField  -----------------------------------------
  String majTextField(){ 
    setState(() { //variable maj que si à l'intérieur
      textFieldRentre ="f";
    });
    return textFieldRentre;
  }
  //----------------------------------   TextEditingController et late  ----------------------------
  //----------------------------------   Switch  -----------------------------------------
  
  //----------------------------------   Slider  -----------------------------------------
  //----------------------------------   CheckBox  -----------------------------------------
  //----------------------------------   Radio  -----------------------------------------
  //----------------------------------   DatePicker  -----------------------------------------

}//Fin Widgte interactif




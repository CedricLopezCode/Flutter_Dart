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
  bool outlinedButtonAppuye = false; //Outlined Button
  bool outlinedButtonAppuyelong = false; //Outlined Button
  bool eleveButtonAppuye = false; //Elevated Button
  bool eleveButtonAppuyelong = false; //Elevated Button
  IconData iconBouton = Icons.thumb_up_alt; //Icon Button
  String textFieldRentre = "";  //Text field
  late TextEditingController monController; //Text Control 
  //late enleve l'erreur du null car il ne le sera pas apres puisque à l'init
  List<bool> valeurSwitch = [false, true, false];  //Switch
  List<bool> valeurCheckBox = [false, true, false];  //Checkbox
  int groupeRadio = 1;  //Radio
  List<double> valeurSliders = [0, 10, 50]; //Slider

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
          value: valeurSwitch[0], 
          onChanged: ((changSwitch) => setState(() => valeurSwitch[0] = changSwitch)),
        ),
        Switch(
          value: valeurSwitch[1], 
          onChanged: ((changSwitch) => setState(() => valeurSwitch[1] = changSwitch)),
          activeColor: Colors.green,  
          activeTrackColor: Colors.blue,  //seulement si on veut la barre d'une autre couleur
          inactiveThumbColor: Colors.red, //bouton
          inactiveTrackColor: Colors.yellow,  //barre
          hoverColor: Colors.black,    //?????
        ),
       /*
        SwitchListTile( //Pour inclure text et/ou image directement dans le switch
          title: Text("SwitchListTile"),
          value: valeurSwitch[2], 
          onChanged: ((changSwitch) => setState(() => valeurSwitch[2] = changSwitch)),
          secondary: Icon(Icons.hourglass_top_rounded),
        ),
        */
        Text("$valeurSwitch"),
      ],),
      //----------------------------------   CheckBox  -----------------------------------------
        Row(children: [
        Checkbox(
          value: valeurCheckBox[0], 
          onChanged: ((changCheckbox) => setState(() => valeurCheckBox[0] = changCheckbox ?? false)), 
          //Pour enlever l'erreur de l'optionnel on met une valeur par défaut 
        ),
        Checkbox(
          value: valeurCheckBox[1], 
          onChanged: ((changCheckbox) => setState(() => valeurCheckBox[1] = changCheckbox ?? false)), 
          //Pour enlever l'erreur de l'optionnel on met une valeur par défaut 
          activeColor: Colors.green,  //couleur de la case quand checked
          checkColor: Colors.yellow,  //couleur de la croix quand checked
          hoverColor: Colors.red,  // ????
        ),
        /*
        CheckboxListTile( //Pour inclure text et/ou image directement dans la checkbox
          value: valeurCheckBox[2], 
          onChanged: ((changCheckbox) => setState(() => valeurCheckBox[2] = changCheckbox ?? false)), 
          //Pour enlever l'erreur de l'optionnel on met une valeur par défaut 
          title: Text("SwitchListTile"),
          secondary: Icon(Icons.lightbulb),
        ),
        */
        Text("$valeurCheckBox"),
      ],),
      //-------------------------------   Radio  via fonction   -----------------------------------------
      Row(children: [
        Radio(
          value: 1, 
          groupValue: 1, 
          onChanged: ((changRadio) => setState(() => groupeRadio = changRadio as int)), 
          activeColor: Colors.green,
        ),
        listeRadio(5),
        Text("$groupeRadio"),
      ],),
      //----------------------------------   DatePicker  -----------------------------------------
      //----------------------------------   Slider  -----------------------------------------
        Slider(
          value: valeurSliders[0], 
          onChanged: ((changSlider) => setState(() => valeurSliders[0] = changSlider)),
        ),
        Slider(
          value: valeurSliders[1], 
          min: -100, //Doit etre précisé si value ![0-1]
          max: 50, //Doit etre précisé si value ![0-1]
          onChanged: ((changSlider) => setState(() => valeurSliders[1] = changSlider)),
        ),
        Slider(
          value: valeurSliders[2], 
          min: 0,
          max: 100,
          divisions: 3, //ne peut prendre que ces valeurs là //m3 segments donc 4 valeurs
          label: valeurSliders[2].round().toStringAsFixed(2), //apparait au dessus quand on appuie
          onChanged: ((changSlider) => setState(() => valeurSliders[2] = changSlider)),
          activeColor: Colors.red,
          inactiveColor: Colors.yellow,
        ),
        Text("$valeurSliders"),
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
      //----------------------------------   OutlinedButton == Bouton pourtour -----------------------------------------
        Row(children: [
          OutlinedButton(
            onPressed: changEtatOutlinedButton, 
            onLongPress: changEtatOutlinedButtonLong, 
            child: Text("Outlined Button"),
            style: OutlinedButton.styleFrom(
              
            )
          ),
          Text(majOutlined()),
          Text(longOutlined()),
        ],),
      //----------------------------------   ElevatedButton == en hauteur  -----------------------------------------
        Row(children: [
          ElevatedButton(
            onPressed: changEtatElevatedButton, 
            onLongPress: changEtatElevatedButtonLong, 
            child: Text("Elevated Button"),
          ),
          Text(majEleve()),
          Text(longEleve()),
        ],),
        ElevatedButton(
          onPressed: changEtatElevatedButton, 
          onLongPress: changEtatElevatedButtonLong, 
          child: Text("Elevated Button"),
          style: ElevatedButton.styleFrom(
            primary: Colors.green,  //fond
            onPrimary: Colors.yellow, //texte
            elevation: 5,
            shadowColor: Colors.red, 
          ),
        ),
      //----------------------------------   IconActionButton  -----------------------------------------
        IconButton(
          onPressed: changEtatIconButton,
          icon: Icon(iconBouton),
          color: Colors.blue, //mais pas de background possible
          iconSize: 50,
          splashRadius: 60, //aire autour du bouton
          splashColor: Colors.red, 
        ),
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
  String longText() => (textButtonAppuyelong)? "loooong" : "court";
  //----------------------------------   OutlinedButton  -----------------------------------------
  void changEtatOutlinedButton(){
    setState(() {
      outlinedButtonAppuye = !outlinedButtonAppuye;
    });
  }
  void changEtatOutlinedButtonLong(){
    setState(() {
      outlinedButtonAppuyelong = !outlinedButtonAppuyelong;
    });
  }
  String majOutlined() => (outlinedButtonAppuye)? "Bouton Outlined appuyé" : "Bouton Outlined Relaché";
  String longOutlined() => (outlinedButtonAppuyelong)? "loooong" : "court";
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
  String longEleve() => (eleveButtonAppuyelong)? "loooong" : "court";
  
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
  //----------------------------------   Radio  -----------------------------------------
  
  Row listeRadio(int nbRadio){
    List<Widget> allRadio = [];
    for(var i = 0; i < nbRadio; i++){
      Radio uneRadio = Radio(
          value: i, 
          groupValue: groupeRadio, 
          onChanged: ((changRadio) => setState(() => groupeRadio = changRadio as int)), 
      );
      allRadio.add(uneRadio);
    }
    return Row(children: allRadio,);
  }
  //----------------------------------   DatePicker  -----------------------------------------

}//Fin Widget interactif




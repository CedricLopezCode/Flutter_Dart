import 'package:flutter/material.dart';

class LesBoutons extends StatefulWidget{
  
  @override
  LesBoutonsState createState () => LesBoutonsState();

}
class LesBoutonsState extends State<LesBoutons>{
  
  Color backgroundColor = Colors.white; //FloatingActionButton
  Color textColor = Colors.black; //FloatingActionButton
  bool textButtonAppuye = false; //Text Button
  bool textButtonAppuyelong = false; //Text Button
  bool outlinedButtonAppuye = false; //Outlined Button
  bool outlinedButtonAppuyelong = false; //Outlined Button
  bool eleveButtonAppuye = false; //Elevated Button
  bool eleveButtonAppuyelong = false; //Elevated Button
  IconData iconBouton = Icons.thumb_up_alt; //Icon Button
  String valeurDropDown = "ccc"; //Select DropDown
  List<String> possibleDropDown = ["aaa", "bbb", "ccc", "ddd", "eee"]; //Select DropDown
  bool inkwellAppuye = false; // Inkwell
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
      //----------------------------------   TextButton == Bouton plat  -----------------------------------------
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          TextButton(
            onPressed: changEtatTextButton, 
            onLongPress: changEtatTextButtonLong, 
            child: Text("Text Button  ")
          ),
          Text(majText()),
          Text(longText()),
        ],),
      //----------------------------------   OutlinedButton == Bouton pourtour -----------------------------------------
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
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
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          ElevatedButton(
            onPressed: changEtatElevatedButton, 
            onLongPress: changEtatElevatedButtonLong, 
            child: Text("Elevated Button"),
          ),
          Text(majEleve()),
          Text(longEleve()),
        ],),

        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        ElevatedButton(
          onPressed: changEtatElevatedButton, 
          onLongPress: changEtatElevatedButtonLong, 
          child: Text("Elevated Button"),
          style: ElevatedButton.styleFrom(
            primary: Colors.green,  //fond
            onPrimary: Colors.yellow, //texte
            elevation: 5,
            shadowColor: Colors.red, 
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          ),
        ),
      //----------------------------------   FloatingActionButton  -----------------------------------------
        FloatingActionButton( //Dans le Scaffold, body
          onPressed: updateColor, // pas besoin des parenthese
          child: Icon(Icons.remove_red_eye_outlined),
           backgroundColor: Colors.deepOrange,
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
      //---------------------------   DropdownButton == Select  -----------------------------------------
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          DropdownButton<String>(
            value: valeurDropDown,
            icon: const Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: ((newValue) => setState(() => valeurDropDown = newValue as String)),
            items: possibleDropDown.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          Text(valeurDropDown),
        ],),
      //----------------------------------   Inkwell (Rendre stateless clickable)  -----------------------------------------
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          InkWell(
            onTap: (() => setState(() => inkwellAppuye = !inkwellAppuye)),
            child: Container(
              child: Text("Mon Container avec texte deviens clickable"),
              color: Colors.blue,
              height: 30,
            ), 
          ),
          Text("$inkwellAppuye"),
        ],),
        //----------------------------------   Visibility  -----------------------------------------
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          ElevatedButton(
            onPressed: (() => setState(() => isVisible = !isVisible)),
            child: Text("Visibility change"),
          ),
          Visibility(
            visible: isVisible,
            child: Text("La Visibilité est true"),
          )
          
        ],),
          
        
      ],)
    ;//fin return
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

}
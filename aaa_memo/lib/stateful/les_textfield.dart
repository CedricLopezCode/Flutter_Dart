import 'package:flutter/material.dart';

class LesTextField extends StatefulWidget{
  
  @override
  LesTextFieldState createState () => LesTextFieldState();

}
class LesTextFieldState extends State<LesTextField>{
  
  String textFieldRentre = "";  //Text field
  late TextEditingController monController; //Text Control 
  //late enleve l'erreur du null car il ne le sera pas apres puisque à l'init
  String valeurSelect = "Pierre";  //Select: DropDown Button
  List<String> valeursSelect = ["Pierre", "Paul", "Jacques"];  //Select: DropDown Button
 

  @override
  void initState() {
    super.initState();
    monController = TextEditingController();// apres le super
  }
  @override
  void dispose() {
    monController.dispose();// avant le super
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
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
        onChanged: (newText) {setState(() => textFieldRentre = newText);},
        //onSubmitted: (newText) {setState(() {textFieldRentre = newText;});},
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
      //----------------------------------   Select  ----------------------------
      /*
      DropdownButton<String>(items: valeursSelect),
     */
      Text(textFieldRentre),
        ],
      )
    ;//fin return
  }
   String majTextField(){ 
    setState(() { //variable maj que si à l'intérieur
      textFieldRentre ="f";
    });
    return textFieldRentre;
  }
}
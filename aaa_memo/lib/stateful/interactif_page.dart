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
  String valeurSelect = "Pierre";  //Select: DropDown Button
  List<String> valeursSelect = ["Pierre", "Paul", "Jacques"];  //Select: DropDown Button
  List<bool> valeurSwitch = [false, true, false];  //Switch
  List<bool> valeurCheckBox = [false, true, false];  //Checkbox
  int groupeRadio = 1;  //Radio
  List<double> valeurSliders = [0, 10, 50]; //Slider
  DateTime dateInitiale = DateTime.now(); //Picker Date
  DateTime dateSelected = DateTime.utc(2020, 12, 16); //Picker Date
  TimeOfDay heureInitiale = TimeOfDay.now(); //Picker Time
  TimeOfDay heureSelected = TimeOfDay.now(); //Picker Time
  

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
      //----------------------------------   Select  ----------------------------
      /*
      DropdownButton<String>(items: valeursSelect),
     */
      Text(textFieldRentre),
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
        Row(children: [
          Icon(Icons.hourglass_bottom),
          Text('Animate Slowly'),
          Checkbox(
            value: valeurCheckBox[2], 
            onChanged: ((changCheckbox) => setState(() => valeurCheckBox[2] = changCheckbox ?? false)),
            activeColor: Colors.green,  //couleur de la case quand checked
            checkColor: Colors.yellow,  //couleur de la croix quand checked
            hoverColor: Colors.red,  // ????
          ),
        ],),
/*
        Checkbox(
          value: valeurCheckBox[2], 
          onChanged: ((changCheckbox) => setState(() => valeurCheckBox[2] = changCheckbox ?? false)), 
          //Pour enlever l'erreur de l'optionnel on met une valeur par défaut 
          activeColor: Colors.green,  //couleur de la case quand checked
          checkColor: Colors.yellow,  //couleur de la croix quand checked
          hoverColor: Colors.red,  // ????
        ),
        */
        /* 
        Expanded(
          child: CheckboxListTile(
            title: const Text('Animate Slowly'),
            value: valeurCheckBox[2],
            onChanged: ((changCheckbox) => setState(() => valeurCheckBox[2] = changCheckbox !)),
            //secondary: Icon(Icons.hourglass_empty),
          ),
        ),
        */
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
        /*
        RadioListTile<SingingCharacter>(
        title: const Text('Lafayette'),
        value: SingingCharacter.lafayette,
        groupValue: _character,
        onChanged: (SingingCharacter? value) { setState(() { _character = value; }); },
      ),
        */
      ],),
      //----------------------------------   Calendrier  -----------------------------------------
      Row(children: [
        ElevatedButton(
          child: Icon(Icons.calendar_today),
          onPressed: (() => montrerCalendrier(context)),
        ),
        Text(dateSelected.toString()),
        Text("Le ${dateSelected.weekday} ${dateSelected.day}/${dateSelected.month}/${dateSelected.year} à ${dateSelected.hour} h ${dateSelected.minute}"),
      ],),
      
      //----------------------------------   Horloge  -----------------------------------------
      Row(children: [
        ElevatedButton(
          child: Icon(Icons.watch),
          onPressed: (() => montrerHorloge(context)),
        ),
        Text(heureSelected.toString()),
        Text("A ${heureSelected.hour}h ${heureSelected.minute} min "),
      ],),
      
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
          divisions: 3, //ne peut prendre que ces valeurs là // 3 segments donc 4 valeurs
          label: valeurSliders[2].round().toStringAsFixed(2), //apparait au dessus quand on appuie
          onChanged: ((changSlider) => setState(() => valeurSliders[2] = changSlider)),
          activeColor: Colors.red,
          inactiveColor: Colors.yellow,
        ),
        Text("$valeurSliders"),
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
  /*void*/ montrerCalendrier(BuildContext context){
    showDatePicker(context: context, 
      initialDate: dateInitiale, 
      firstDate: DateTime(1980), 
      lastDate: DateTime(2050), 
    ).then((value) =>  setState(() => dateSelected = value ?? dateInitiale));
  }
  /*void montrerHorloge(BuildContext context){
    showTimePicker(context: context, 
      initialTime: dateInitiale.,
    )
  }*/
  //----------------------------------   TimePicker  -----------------------------------------
  /*void*/ montrerHorloge(BuildContext context){
    showTimePicker(context: context, 
      initialTime: heureInitiale
    ).then((value) =>  setState(() => heureSelected = value ?? heureInitiale));
  }
  /*void montrerHorloge(BuildContext context){
    showTimePicker(context: context, 
      initialTime: dateInitiale.,
    )
  }*/

}//Fin Widget interactif




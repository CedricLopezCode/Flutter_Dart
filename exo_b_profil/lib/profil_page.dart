import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:exo_b_profil/profil.dart';

class PageProfil extends StatefulWidget{
  PageProfilState createState () => PageProfilState();

}
class PageProfilState extends State<PageProfil>{
  Profil profil = Profil(prenom: "ccc", nom: "vvv", age: 0, taille: 0, genre: Genre.Femme, hobbies: {"Manga": true, "JV": true, "papa": false}, langagePref: "", unSecret: "le Secret en question");
  bool secretDevoile = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        boxResume(),
        Divider(color: Colors.blue, thickness: 2,),
        infos(),
        Divider(color: Colors.blue, thickness: 2,),
        passions(),
        Divider(color: Colors.blue, thickness: 2,),
        preference()
      ],
    )
    ;//fin return
  }
  Container boxResume() {
    return Container(
      width: 1500,
      decoration: BoxDecoration(
        boxShadow:[BoxShadow(
          color: Colors.grey,
          offset: Offset(1, 3),
        )] ,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.blueAccent,
      ),
      padding: EdgeInsets.all(5),
      child: contenuResume(),   
    );
  }//Fin resume
  Column contenuResume() {
    //bool secretDevoile = false;
    
    return Column(
      children: [
        Text("${profil.prenom} ${profil.nom}"),
        Text("Age: ${profil.age} ans"),
        Text("Taille: ${profil.taille} cm"),
        //Text("Genre: ${profil.genre == Genre.Homme ? "Masculin : Féminin;}"),
        //Text("Genre: ${profil.adjGenre()}"),
        Text("Hobbies: ${profil.hobbies}"),
        Text("Hobbies: ${profil.stringHobbies()}"),
        Text("Langage de Programmation Favori: ${profil.langagePref}"),
        ElevatedButton(
          child: Text(textBoutonSecret()),
          style: ElevatedButton.styleFrom(
            primary: couleurBouton(),
            onPrimary: couleurText(),
          ),
          onPressed: chan, 
        ),
        Text(leSecret()),
      ],      
    );
  }//Fin contenuResume
  void changEtatSecret() =>  (setState(() =>  secretDevoile = !secretDevoile));
  String textBoutonSecret() => (secretDevoile)? "Cacher Secret" : "Dévoiler Secret";
  Color couleurBouton() => (secretDevoile)? Colors.green : Colors.red;
  Color couleurText() => (secretDevoile)? Colors.yellow : Colors.yellow;
  String leSecret() => (secretDevoile)? profil.unSecret : "";
  void chan(){
    setState(() {
      setState(() =>  secretDevoile = !secretDevoile);
    });
  }
  Container infos() {
    return Container(
          

            
        );
  }//Fin infos
  Container passions() {
    return Container(
         
        );
  }//Fin passions
  Container preference() {
    return Container(
         
            
        );
  }//Fin preference
  
}// Fin classe profil_page

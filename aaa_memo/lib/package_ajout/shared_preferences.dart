

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LesSharedPreferences extends StatefulWidget {
  @override
  _LesSharedPreferencesState createState() => _LesSharedPreferencesState();
}

class _LesSharedPreferencesState extends State<LesSharedPreferences> {
  List<String> jeux = ["Métroïd", "Mario", "Zelda", "Civilization"];
  String jeuDuMoment ="";

  String keyJeux = "jeux";
  String keyJeuDuMoment = "jeu";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readJeux(); 
    readJeuDuMoment();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [ 
      Text("${jeux.toString()}"),
      listeJeux(),
    ],);
  }
  //-------------------- Dialog nv jeu ---------------------------------------------
  Future ouvrirNvJeu() async{
    await showDialog(
      context: context, 
      builder: ((BuildContext ctx) => rentrerNvJeu()),
    );
  }
  SimpleDialog rentrerNvJeu(){
    return SimpleDialog(
      backgroundColor: Colors.lightBlueAccent,
      title: Text("Ajouter un jeu"),
      children: [
      TextField(
        decoration: InputDecoration(hintText: "Rentrer jeu",),
        onSubmitted: (nvJeu) {setState(() {
          createJeu(nvJeu);
          jeuDuMoment = nvJeu;
          Navigator.of(context).pop();
        });},
      ),
      
    ],);
  }
//---------------- Liste des jeux  -------------------------------
   Widget listeJeux(){
     return Container( height: 500, width: 500,color: Colors.yellow , child: 
      ListView.builder(
        itemCount: jeux.length+2,
        itemBuilder: (context, index){

          if(index == 0){
            return Column(children: [
              Text("Jeu du Moment: $jeuDuMoment", style: TextStyle(color: Colors.blue, fontStyle: FontStyle.italic, fontSize: 20,)),
            ],);

          }else if (index == 1){
            return ElevatedButton(
                onPressed: ouvrirNvJeu, 
                child: Text("Ajouter un jeu"),
            );

          }else{
            return ListTile(
            title: Row(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(jeux[index-2]),
                IconButton(
                  onPressed: (){if(jeuDuMoment != jeux[index-2]) {deleteJeu(jeux[index-2]);} }, 
                  icon: Icon(Icons.delete, color: Colors.red,),
                ),
            ],),
            selectedTileColor: Colors.green, 
            onTap: () => setState(() {
              print("tap list");
              jeuDuMoment = jeux[index-2];
              updadteJeuDuMoment(jeuDuMoment);
            }), 
          );
          }
        }
      )
     )
    ;
   }
//--------------------  CRUD Shared Preferences All ----------------------------
  readJeux() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() => jeux = sharedPreferences.getStringList(keyJeux) ?? []);

  }

  createJeu(String nvJeu) async{
    if(!jeux.contains(nvJeu)){
      jeux.add(nvJeu);
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      await sharedPreferences.setStringList(keyJeux, jeux);
      readJeux();
    }
  }

  deleteJeu(String jeuASupp) async{
    jeux.remove(jeuASupp);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setStringList(keyJeux, jeux);
    readJeux();
  }
//--------------------  CRUD Shared Jeu du moment ----------------------------
  readJeuDuMoment() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() => jeuDuMoment = sharedPreferences.getString(keyJeuDuMoment) ?? "");
  }
  
  updadteJeuDuMoment(String jeuDuMoment) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(keyJeuDuMoment, jeuDuMoment);
    readJeux();
  }


}
